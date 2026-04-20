import { BadRequestException } from '@nestjs/common';
import { Test, TestingModule } from '@nestjs/testing';
import { getRepositoryToken } from '@nestjs/typeorm';
import { OrderStatus } from '../common/enums/order-status.enum';
import { Order } from '../database/entities/order.entity';
import { KitchenGateway } from './kitchen.gateway';
import { KitchenService } from './kitchen.service';

describe('KitchenService', () => {
  let service: KitchenService;
  const orders = {
    find: jest.fn(),
    findOne: jest.fn(),
    save: jest.fn(),
  };
  const gateway = { emitOrderUpdated: jest.fn() };

  beforeEach(async () => {
    jest.clearAllMocks();
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        KitchenService,
        { provide: getRepositoryToken(Order), useValue: orders },
        { provide: KitchenGateway, useValue: gateway },
      ],
    }).compile();

    service = module.get<KitchenService>(KitchenService);
  });

  it('markOrderDone rejects when status not kitchen-active', async () => {
    orders.findOne.mockResolvedValue({
      id: 1,
      status: OrderStatus.ready,
      items: [],
      table: null,
    });
    await expect(service.markOrderDone(1)).rejects.toBeInstanceOf(
      BadRequestException,
    );
  });
});
