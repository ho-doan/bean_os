import { Test, TestingModule } from '@nestjs/testing';
import { getDataSourceToken } from '@nestjs/typeorm';
import { ReportsService } from './reports.service';

describe('ReportsService', () => {
  let service: ReportsService;
  const query = jest.fn();

  beforeEach(async () => {
    query.mockReset();
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        ReportsService,
        {
          provide: getDataSourceToken(),
          useValue: { query },
        },
      ],
    }).compile();

    service = module.get<ReportsService>(ReportsService);
  });

  it('maps daily query result', async () => {
    query.mockResolvedValueOnce([{ total: '150.5', orderCount: '3' }]);
    const row = await service.getDaily('2026-04-20');
    expect(row).toEqual({
      date: '2026-04-20',
      totalRevenue: 150.5,
      orderCount: 3,
    });
    expect(query).toHaveBeenCalled();
  });

  it('maps top items query result', async () => {
    query.mockResolvedValueOnce([
      { menuItemId: 1, name: 'Phin đen', qtySold: '5' },
    ]);
    const rows = await service.getTopItems('2026-04-20', 10);
    expect(rows).toEqual([{ menuItemId: 1, name: 'Phin đen', qtySold: 5 }]);
  });
});
