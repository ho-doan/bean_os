import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { DataSource, In, Repository } from 'typeorm';
import { OrderStatus } from '../common/enums/order-status.enum';
import { TableStatus } from '../common/enums/table-status.enum';
import { MenuItem } from '../database/entities/menu-item.entity';
import { OrderItem } from '../database/entities/order-item.entity';
import { Order } from '../database/entities/order.entity';
import { RestaurantTable } from '../database/entities/restaurant-table.entity';
import { KitchenGateway } from '../kitchen/kitchen.gateway';
import { CreateOrderDto } from './dto/create-order.dto';
import { UpdateOrderStatusDto } from './dto/update-order-status.dto';

const allowedTransitions: Record<OrderStatus, OrderStatus[]> = {
  [OrderStatus.pending]: [OrderStatus.preparing, OrderStatus.ready],
  [OrderStatus.preparing]: [OrderStatus.ready],
  [OrderStatus.ready]: [OrderStatus.paid],
  [OrderStatus.paid]: [],
};

@Injectable()
export class OrdersService {
  constructor(
    @InjectRepository(Order)
    private readonly orders: Repository<Order>,
    @InjectRepository(RestaurantTable)
    private readonly tables: Repository<RestaurantTable>,
    @InjectRepository(MenuItem)
    private readonly menuItems: Repository<MenuItem>,
    private readonly dataSource: DataSource,
    private readonly kitchenGateway: KitchenGateway,
  ) {}

  async create(dto: CreateOrderDto): Promise<Order> {
    const created = await this.dataSource.transaction(async (manager) => {
      const table = await manager.findOne(RestaurantTable, {
        where: { id: dto.tableId },
      });
      if (!table) {
        throw new NotFoundException('Table not found');
      }

      const active = await manager.exists(Order, {
        where: {
          tableId: dto.tableId,
          status: In([
            OrderStatus.pending,
            OrderStatus.preparing,
            OrderStatus.ready,
          ]),
        },
      });
      if (active) {
        throw new BadRequestException('Table already has an active order');
      }

      const menuIds = [...new Set(dto.items.map((i) => i.menuItemId))];
      const menus = await manager.find(MenuItem, {
        where: { id: In(menuIds) },
      });
      if (menus.length !== menuIds.length) {
        throw new BadRequestException('One or more menu items not found');
      }
      for (const m of menus) {
        if (!m.isAvailable) {
          throw new BadRequestException(`Menu item #${m.id} is not available`);
        }
      }

      const order = manager.create(Order, {
        tableId: dto.tableId,
        status: OrderStatus.pending,
        items: dto.items.map((i) =>
          manager.create(OrderItem, {
            menuItemId: i.menuItemId,
            qty: i.qty,
            note: i.note ?? null,
          }),
        ),
      });
      const saved = await manager.save(Order, order);

      table.status = TableStatus.occupied;
      await manager.save(RestaurantTable, table);

      return saved;
    });

    const full = await this.findOneWithRelations(created.id);
    this.kitchenGateway.emitOrderNew(full);
    return full;
  }

  findActive(): Promise<Order[]> {
    return this.orders.find({
      where: {
        status: In([
          OrderStatus.pending,
          OrderStatus.preparing,
          OrderStatus.ready,
        ]),
      },
      order: { createdAt: 'ASC' },
      relations: ['items', 'items.menuItem', 'table'],
    });
  }

  async updateStatus(id: number, dto: UpdateOrderStatusDto): Promise<Order> {
    const order = await this.orders.findOne({
      where: { id },
      relations: ['table'],
    });
    if (!order) {
      throw new NotFoundException('Order not found');
    }
    const allowed = allowedTransitions[order.status];
    if (!allowed.includes(dto.status)) {
      throw new BadRequestException(
        `Cannot move from ${order.status} to ${dto.status}`,
      );
    }

    order.status = dto.status;
    if (dto.status === OrderStatus.paid && order.table) {
      order.table.status = TableStatus.free;
      await this.orders.manager.save(RestaurantTable, order.table);
    }
    await this.orders.save(order);

    const full = await this.findOneWithRelations(order.id);
    this.kitchenGateway.emitOrderUpdated(full);
    return full;
  }

  async findOneWithRelations(id: number): Promise<Order> {
    const order = await this.orders.findOne({
      where: { id },
      relations: ['items', 'items.menuItem', 'table'],
    });
    if (!order) {
      throw new NotFoundException('Order not found');
    }
    return order;
  }
}
