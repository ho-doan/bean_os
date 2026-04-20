import { Injectable, NotFoundException, OnModuleInit } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { TableStatus } from '../common/enums/table-status.enum';
import { RestaurantTable } from '../database/entities/restaurant-table.entity';
import { UpdateTableStatusDto } from './dto/update-table-status.dto';

@Injectable()
export class TablesService implements OnModuleInit {
  constructor(
    @InjectRepository(RestaurantTable)
    private readonly tables: Repository<RestaurantTable>,
  ) {}

  async onModuleInit(): Promise<void> {
    await this.ensureDefaultTables();
  }

  findAll(): Promise<RestaurantTable[]> {
    return this.tables.find({ order: { id: 'ASC' } });
  }

  async updateStatus(
    id: number,
    dto: UpdateTableStatusDto,
  ): Promise<RestaurantTable> {
    const table = await this.tables.findOne({ where: { id } });
    if (!table) {
      throw new NotFoundException('Table not found');
    }
    table.status = dto.status;
    return this.tables.save(table);
  }

  private async ensureDefaultTables(): Promise<void> {
    const count = await this.tables.count();
    if (count > 0) {
      return;
    }
    const rows = Array.from({ length: 12 }, (_, i) =>
      this.tables.create({
        label: `T${i + 1}`,
        status: TableStatus.free,
      }),
    );
    await this.tables.save(rows);
  }
}
