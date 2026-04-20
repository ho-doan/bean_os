import { Test, TestingModule } from '@nestjs/testing';
import { getRepositoryToken } from '@nestjs/typeorm';
import { DataSource } from 'typeorm';
import { OrderStatus } from '../common/enums/order-status.enum';
import { PaymentMethod } from '../common/enums/payment-method.enum';
import { TableStatus } from '../common/enums/table-status.enum';
import { Order } from '../database/entities/order.entity';
import { Payment } from '../database/entities/payment.entity';
import { KitchenGateway } from '../kitchen/kitchen.gateway';
import { PaymentsService } from './payments.service';

describe('PaymentsService', () => {
  let service: PaymentsService;
  const ordersRepo = { findOne: jest.fn() };
  const kitchenGateway = { emitOrderUpdated: jest.fn() };
  const dataSource = { transaction: jest.fn() };

  beforeEach(async () => {
    jest.clearAllMocks();
    dataSource.transaction.mockImplementation((fn: (m: unknown) => unknown) => {
      const manager = {
        findOne: jest.fn().mockResolvedValue({
          id: 1,
          status: OrderStatus.ready,
          table: { id: 10, status: TableStatus.occupied },
          items: [{ qty: 2, menuItem: { price: 10000 } }],
        }),
        save: jest.fn((_: unknown, row: unknown) => Promise.resolve(row)),
        create: jest.fn((_e: unknown, row: unknown) => row),
      };
      return fn(manager);
    });
    ordersRepo.findOne.mockResolvedValue({
      id: 1,
      status: OrderStatus.paid,
      items: [],
      table: null,
    });

    const module: TestingModule = await Test.createTestingModule({
      providers: [
        PaymentsService,
        { provide: getRepositoryToken(Payment), useValue: {} },
        { provide: getRepositoryToken(Order), useValue: ordersRepo },
        { provide: DataSource, useValue: dataSource },
        { provide: KitchenGateway, useValue: kitchenGateway },
      ],
    }).compile();

    service = module.get<PaymentsService>(PaymentsService);
  });

  it('create returns change for cash', async () => {
    const res = await service.create({
      orderId: 1,
      method: PaymentMethod.cash,
      amount: 50000,
    });
    expect(res.orderTotal).toBe(20000);
    expect(res.changeAmount).toBe(30000);
    expect(kitchenGateway.emitOrderUpdated).toHaveBeenCalled();
  });
});
