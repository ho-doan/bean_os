import { Test, TestingModule } from '@nestjs/testing';
import { getRepositoryToken } from '@nestjs/typeorm';
import { TableStatus } from '../common/enums/table-status.enum';
import { RestaurantTable } from '../database/entities/restaurant-table.entity';
import { TablesService } from './tables.service';

describe('TablesService', () => {
  let service: TablesService;
  const repo = {
    count: jest.fn(),
    find: jest.fn(),
    findOne: jest.fn(),
    save: jest.fn(),
    create: jest.fn((v: unknown) => v),
  };

  beforeEach(async () => {
    jest.clearAllMocks();
    repo.count.mockResolvedValue(1);
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        TablesService,
        { provide: getRepositoryToken(RestaurantTable), useValue: repo },
      ],
    }).compile();

    service = module.get<TablesService>(TablesService);
    await service.onModuleInit();
  });

  it('findAll uses repository', async () => {
    repo.find.mockResolvedValue([]);
    await service.findAll();
    expect(repo.find).toHaveBeenCalledWith({ order: { id: 'ASC' } });
  });

  it('updateStatus saves when table exists', async () => {
    const table = { id: 1, label: 'T1', status: TableStatus.free };
    repo.findOne.mockResolvedValue(table);
    repo.save.mockImplementation((t: RestaurantTable) => Promise.resolve(t));
    const res = await service.updateStatus(1, { status: TableStatus.occupied });
    expect(res.status).toBe(TableStatus.occupied);
    expect(repo.save).toHaveBeenCalled();
  });
});
