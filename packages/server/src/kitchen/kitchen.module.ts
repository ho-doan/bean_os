import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Order } from '../database/entities/order.entity';
import { KitchenController } from './kitchen.controller';
import { KitchenGateway } from './kitchen.gateway';
import { KitchenService } from './kitchen.service';

@Module({
  imports: [TypeOrmModule.forFeature([Order])],
  controllers: [KitchenController],
  providers: [KitchenService, KitchenGateway],
  exports: [KitchenGateway],
})
export class KitchenModule {}
