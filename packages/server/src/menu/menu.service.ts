import { Injectable, NotFoundException, OnModuleInit } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { MenuItem } from '../database/entities/menu-item.entity';
import { MenuItemOption } from '../database/entities/menu-item-option.entity';
import { CreateMenuDto } from './dto/create-menu.dto';
import { UpdateMenuDto } from './dto/update-menu.dto';

@Injectable()
export class MenuService implements OnModuleInit {
  constructor(
    @InjectRepository(MenuItem)
    private readonly menu: Repository<MenuItem>,
    @InjectRepository(MenuItemOption)
    private readonly menuOptions: Repository<MenuItemOption>,
  ) {}

  async onModuleInit(): Promise<void> {
    await this.ensureSampleMenu();
  }

  async create(dto: CreateMenuDto): Promise<MenuItem> {
    const row = this.menu.create({
      name: dto.name,
      price: dto.price,
      isAvailable: dto.isAvailable ?? true,
      description: dto.description ?? null,
      options:
        dto.options?.map((o) =>
          this.menuOptions.create({
            key: o.key,
            label: o.label ?? o.key,
            values: o.values,
          }),
        ) ?? [],
    });
    const saved = await this.menu.save(row);
    return this.findOne(saved.id);
  }

  findAll(): Promise<MenuItem[]> {
    return this.menu.find({ order: { id: 'ASC', options: { id: 'ASC' } } });
  }

  async findOne(id: number): Promise<MenuItem> {
    const item = await this.menu.findOne({
      where: { id },
      order: { options: { id: 'ASC' } },
    });
    if (!item) {
      throw new NotFoundException('Menu item not found');
    }
    return item;
  }

  async update(id: number, dto: UpdateMenuDto): Promise<MenuItem> {
    const item = await this.findOne(id);
    if (dto.name !== undefined) item.name = dto.name;
    if (dto.price !== undefined) item.price = dto.price;
    if (dto.isAvailable !== undefined) item.isAvailable = dto.isAvailable;
    if (dto.description !== undefined) item.description = dto.description;
    if (dto.options !== undefined) {
      item.options = dto.options.map((o) =>
        this.menuOptions.create({
          key: o.key,
          label: o.label ?? o.key,
          values: o.values,
        }),
      );
    }
    await this.menu.save(item);
    return this.findOne(id);
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
        options: [
          this.menuOptions.create({
            key: 'sugar',
            label: 'Duong',
            values: ['100%', '70%', '50%', '30%', '0%'],
          }),
          this.menuOptions.create({
            key: 'ice',
            label: 'Da',
            values: ['Da thuong', 'It da', 'Khong da'],
          }),
        ],
      }),
      this.menu.create({
        name: 'Phin sữa',
        price: 22000,
        isAvailable: true,
        description: null,
        options: [
          this.menuOptions.create({
            key: 'sugar',
            label: 'Duong',
            values: ['100%', '70%', '50%', '30%', '0%'],
          }),
          this.menuOptions.create({
            key: 'ice',
            label: 'Da',
            values: ['Da thuong', 'It da', 'Khong da'],
          }),
        ],
      }),
      this.menu.create({
        name: 'Bánh mì thịt',
        price: 25000,
        isAvailable: true,
        description: null,
        options: [],
      }),
    ]);
  }
}
