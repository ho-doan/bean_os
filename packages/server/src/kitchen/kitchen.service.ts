import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { In, Repository } from 'typeorm';
import { OrderStatus } from '../common/enums/order-status.enum';
import { Order } from '../database/entities/order.entity';
import { KitchenGateway } from './kitchen.gateway';

@Injectable()
export class KitchenService {
  constructor(
    @InjectRepository(Order)
    private readonly orders: Repository<Order>,
    private readonly kitchenGateway: KitchenGateway,
  ) {}

  getQueue(): Promise<Order[]> {
    return this.orders.find({
      where: { status: In([OrderStatus.pending, OrderStatus.preparing]) },
      order: { createdAt: 'ASC' },
      relations: ['items', 'items.menuItem', 'table'],
    });
  }

  async markOrderDone(orderId: number): Promise<Order> {
    const order = await this.orders.findOne({
      where: { id: orderId },
      relations: ['items', 'items.menuItem', 'table'],
    });
    if (!order) {
      throw new NotFoundException('Order not found');
    }
    if (
      order.status !== OrderStatus.preparing &&
      order.status !== OrderStatus.pending
    ) {
      throw new BadRequestException(
        'Only pending or preparing orders can be marked done from kitchen',
      );
    }
    order.status = OrderStatus.ready;
    await this.orders.save(order);
    this.kitchenGateway.emitOrderUpdated(order);
    return order;
  }
}
