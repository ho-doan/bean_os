import { Column, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
import { MenuItem } from './menu-item.entity';

@Entity('menu_item_options')
export class MenuItemOption {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: 'menu_item_id' })
  menuItemId: number;

  @ManyToOne(() => MenuItem, (menuItem) => menuItem.options, {
    onDelete: 'CASCADE',
  })
  @JoinColumn({ name: 'menu_item_id' })
  menuItem: MenuItem;

  @Column({ length: 100 })
  key: string;

  @Column({ length: 255 })
  label: string;

  @Column({ type: 'json' })
  values: string[];
}
