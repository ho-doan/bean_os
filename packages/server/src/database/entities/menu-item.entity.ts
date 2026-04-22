import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { MenuItemOption } from './menu-item-option.entity';
import { OrderItem } from './order-item.entity';

@Entity('menu_items')
export class MenuItem {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ length: 255 })
  name: string;

  @Column({ type: 'double' })
  price: number;

  @Column({ default: true })
  isAvailable: boolean;

  @Column({ type: 'text', nullable: true })
  description: string | null;

  @OneToMany(() => MenuItemOption, (option) => option.menuItem, {
    cascade: true,
    eager: true,
  })
  options: MenuItemOption[];

  @OneToMany(() => OrderItem, (line) => line.menuItem)
  orderLines: OrderItem[];
}
