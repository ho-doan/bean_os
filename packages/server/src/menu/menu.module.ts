import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MenuItem } from '../database/entities/menu-item.entity';
import { MenuItemOption } from '../database/entities/menu-item-option.entity';
import { MenuController } from './menu.controller';
import { MenuService } from './menu.service';

@Module({
  imports: [TypeOrmModule.forFeature([MenuItem, MenuItemOption])],
  controllers: [MenuController],
  providers: [MenuService],
})
export class MenuModule {}
