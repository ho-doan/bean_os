import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { DataSource, Repository } from 'typeorm';
import { OrderStatus } from '../common/enums/order-status.enum';
import { PaymentMethod } from '../common/enums/payment-method.enum';
import { TableStatus } from '../common/enums/table-status.enum';
import { Order } from '../database/entities/order.entity';
import { Payment } from '../database/entities/payment.entity';
import { RestaurantTable } from '../database/entities/restaurant-table.entity';
import { KitchenGateway } from '../kitchen/kitchen.gateway';
import { CreatePaymentDto } from './dto/create-payment.dto';

export type PaymentResult = {
  payment: Payment;
  orderTotal: number;
  changeAmount: number;
};

@Injectable()
export class PaymentsService {
  constructor(
    @InjectRepository(Payment)
    private readonly payments: Repository<Payment>,
    @InjectRepository(Order)
    private readonly orders: Repository<Order>,
    private readonly dataSource: DataSource,
    private readonly kitchenGateway: KitchenGateway,
  ) {}

  private computeOrderTotal(order: Order): number {
    return order.items.reduce(
      (sum, line) => sum + line.menuItem.price * line.qty,
      0,
    );
  }

  async create(dto: CreatePaymentDto): Promise<PaymentResult> {
    const result = await this.dataSource.transaction(async (manager) => {
      const order = await manager.findOne(Order, {
        where: { id: dto.orderId },
        relations: ['items', 'items.menuItem', 'table'],
      });
      if (!order) {
        throw new NotFoundException('Order not found');
      }
      if (order.status === OrderStatus.paid) {
        throw new BadRequestException('Order already paid');
      }

      const total = this.computeOrderTotal(order);
      if (dto.amount < total) {
        throw new BadRequestException('Amount is less than order total');
      }

      const changeAmount =
        dto.method === PaymentMethod.cash ? dto.amount - total : 0;

      const payment = manager.create(Payment, {
        orderId: order.id,
        method: dto.method,
        amount: dto.amount,
        changeAmount: dto.method === PaymentMethod.cash ? changeAmount : null,
        voidedAt: null,
      });
      await manager.save(Payment, payment);

      order.status = OrderStatus.paid;
      await manager.save(Order, order);

      if (order.table) {
        order.table.status = TableStatus.free;
        await manager.save(RestaurantTable, order.table);
      }

      return { payment, orderTotal: total, changeAmount };
    });

    const fullOrder = await this.orders.findOne({
      where: { id: dto.orderId },
      relations: ['items', 'items.menuItem', 'table'],
    });
    if (fullOrder) {
      this.kitchenGateway.emitOrderUpdated(fullOrder);
    }

    return result;
  }

  async voidPayment(id: number): Promise<Payment> {
    const payment = await this.dataSource.transaction(async (manager) => {
      const row = await manager.findOne(Payment, {
        where: { id },
        relations: ['order', 'order.table'],
      });
      if (!row) {
        throw new NotFoundException('Payment not found');
      }
      if (row.voidedAt) {
        throw new BadRequestException('Payment already voided');
      }

      row.voidedAt = new Date();
      await manager.save(Payment, row);

      const order = row.order;
      order.status = OrderStatus.ready;
      await manager.save(Order, order);

      if (order.table) {
        order.table.status = TableStatus.occupied;
        await manager.save(RestaurantTable, order.table);
      }

      return row;
    });

    const fullOrder = await this.orders.findOne({
      where: { id: payment.orderId },
      relations: ['items', 'items.menuItem', 'table'],
    });
    if (fullOrder) {
      this.kitchenGateway.emitOrderUpdated(fullOrder);
    }

    return payment;
  }
}
