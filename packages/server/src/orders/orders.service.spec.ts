import { BadRequestException, NotFoundException } from '@nestjs/common';
import { Test, TestingModule } from '@nestjs/testing';
import { getRepositoryToken } from '@nestjs/typeorm';
import { DataSource, Repository } from 'typeorm';
import { OrderStatus } from '../common/enums/order-status.enum';
import { TableStatus } from '../common/enums/table-status.enum';
import { MenuItem } from '../database/entities/menu-item.entity';
import { Order } from '../database/entities/order.entity';
import { RestaurantTable } from '../database/entities/restaurant-table.entity';
import { KitchenGateway } from '../kitchen/kitchen.gateway';
import { OrdersService } from './orders.service';

describe('OrdersService', () => {
  let service: OrdersService;
  let ordersRepo: jest.Mocked<
    Pick<Repository<Order>, 'find' | 'findOne' | 'save'> & {
      manager: { save: jest.Mock };
    }
  >;
  const kitchenGateway = {
    emitOrderNew: jest.fn(),
    emitOrderUpdated: jest.fn(),
  };
  const dataSource = { transaction: jest.fn() };

  beforeEach(async () => {
    jest.clearAllMocks();
    ordersRepo = {
      find: jest.fn(),
      findOne: jest.fn(),
      save: jest.fn(),
      manager: { save: jest.fn() },
    };

    const module: TestingModule = await Test.createTestingModule({
      providers: [
        OrdersService,
        { provide: getRepositoryToken(Order), useValue: ordersRepo },
        { provide: getRepositoryToken(RestaurantTable), useValue: {} },
        { provide: getRepositoryToken(MenuItem), useValue: {} },
        { provide: DataSource, useValue: dataSource },
        { provide: KitchenGateway, useValue: kitchenGateway },
      ],
    }).compile();

    service = module.get<OrdersService>(OrdersService);
  });

  it('updateStatus rejects invalid transition', async () => {
    ordersRepo.findOne.mockResolvedValue({
      id: 1,
      status: OrderStatus.paid,
      table: null,
    } as Order);
    await expect(
      service.updateStatus(1, { status: OrderStatus.preparing }),
    ).rejects.toBeInstanceOf(BadRequestException);
  });

  it('updateStatus throws when order missing', async () => {
    ordersRepo.findOne.mockResolvedValue(null);
    await expect(
      service.updateStatus(1, { status: OrderStatus.preparing }),
    ).rejects.toBeInstanceOf(NotFoundException);
  });

  it('updateStatus allows ready -> paid and frees table', async () => {
    const table = { id: 2, status: TableStatus.occupied } as RestaurantTable;
    const order = {
      id: 1,
      status: OrderStatus.ready,
      table,
    } as Order;
    ordersRepo.findOne.mockResolvedValueOnce(order).mockResolvedValueOnce({
      ...order,
      status: OrderStatus.paid,
      items: [],
      table,
    } as Order);
    ordersRepo.save.mockResolvedValue({
      ...order,
      status: OrderStatus.paid,
    } as Order);
    ordersRepo.manager.save.mockResolvedValue(table);

    const res = await service.updateStatus(1, { status: OrderStatus.paid });
    expect(res.status).toBe(OrderStatus.paid);
    expect(ordersRepo.manager.save).toHaveBeenCalled();
    expect(kitchenGateway.emitOrderUpdated).toHaveBeenCalled();
  });

  it('findActive delegates to repository', async () => {
    ordersRepo.find.mockResolvedValue([]);
    const res = await service.findActive();
    expect(res).toEqual([]);
    expect(ordersRepo.find).toHaveBeenCalled();
  });
});
