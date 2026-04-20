import { Injectable, NotFoundException, OnModuleInit } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { MenuItem } from '../database/entities/menu-item.entity';
import { CreateMenuDto } from './dto/create-menu.dto';
import { UpdateMenuDto } from './dto/update-menu.dto';

@Injectable()
export class MenuService implements OnModuleInit {
  constructor(
    @InjectRepository(MenuItem)
    private readonly menu: Repository<MenuItem>,
  ) {}

  async onModuleInit(): Promise<void> {
    await this.ensureSampleMenu();
  }

  create(dto: CreateMenuDto): Promise<MenuItem> {
    const row = this.menu.create({
      name: dto.name,
      price: dto.price,
      isAvailable: dto.isAvailable ?? true,
      description: dto.description ?? null,
    });
    return this.menu.save(row);
  }

  findAll(): Promise<MenuItem[]> {
    return this.menu.find({ order: { id: 'ASC' } });
  }

  async findOne(id: number): Promise<MenuItem> {
    const item = await this.menu.findOne({ where: { id } });
    if (!item) {
      throw new NotFoundException('Menu item not found');
    }
    return item;
  }

  async update(id: number, dto: UpdateMenuDto): Promise<MenuItem> {
    const item = await this.findOne(id);
    Object.assign(item, dto);
    return this.menu.save(item);
  }

  async remove(id: number): Promise<void> {
    const item = await this.findOne(id);
    await this.menu.remove(item);
  }

  private async ensureSampleMenu(): Promise<void> {
    const count = await this.menu.count();
    if (count > 0) {
      return;
    }
    await this.menu.save([
      this.menu.create({
        name: 'Phin đen',
        price: 18000,
        isAvailable: true,
        description: null,
      }),
      this.menu.create({
        name: 'Phin sữa',
        price: 22000,
        isAvailable: true,
        description: null,
      }),
      this.menu.create({
        name: 'Bánh mì thịt',
        price: 25000,
        isAvailable: true,
        description: null,
      }),
    ]);
  }
}
