import {
  Column,
  CreateDateColumn,
  Entity,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { PaymentMethod } from '../../common/enums/payment-method.enum';
import { Order } from './order.entity';

@Entity('payments')
export class Payment {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: 'order_id' })
  orderId: number;

  @ManyToOne(() => Order, (order) => order.payments)
  @JoinColumn({ name: 'order_id' })
  order: Order;

  @Column({ type: 'enum', enum: PaymentMethod })
  method: PaymentMethod;

  @Column({ type: 'double' })
  amount: number;

  @Column({ name: 'change_amount', type: 'double', nullable: true })
  changeAmount: number | null;

  @Column({ name: 'voided_at', type: 'datetime', nullable: true })
  voidedAt: Date | null;

  @CreateDateColumn({ name: 'created_at' })
  createdAt: Date;
}
