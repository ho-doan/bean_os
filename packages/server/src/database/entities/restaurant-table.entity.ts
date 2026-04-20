import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { TableStatus } from '../../common/enums/table-status.enum';
import { Order } from './order.entity';

@Entity('tables')
export class RestaurantTable {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ length: 32 })
  label: string;

  @Column({ type: 'enum', enum: TableStatus, default: TableStatus.free })
  status: TableStatus;

  @OneToMany(() => Order, (order) => order.table)
  orders: Order[];
}
