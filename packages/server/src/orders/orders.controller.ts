import {
  Body,
  Controller,
  Get,
  Param,
  ParseIntPipe,
  Patch,
  Post,
} from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiOkResponse,
  ApiOperation,
  ApiTags,
} from '@nestjs/swagger';
import { CreateOrderDto } from './dto/create-order.dto';
import { UpdateOrderStatusDto } from './dto/update-order-status.dto';
import { OrdersService } from './orders.service';

@ApiTags('orders')
@ApiBearerAuth()
@Controller('orders')
export class OrdersController {
  constructor(private readonly ordersService: OrdersService) {}

  @Post()
  @ApiOperation({
    summary: 'Tạo đơn',
    description:
      'Body: tableId + items (menuItemId, qty, note). Emit JSON WebSocket `order.new` tới path `/kitchen`.',
  })
  @ApiCreatedResponse({ description: 'Đơn mới kèm line items và bàn' })
  create(@Body() createOrderDto: CreateOrderDto) {
    return this.ordersService.create(createOrderDto);
  }

  @Get('active')
  @ApiOperation({
    summary: 'Danh sách đơn chưa thanh toán',
    description:
      'Trạng thái pending, preparing, ready — dùng cho màn thu ngân.',
  })
  @ApiOkResponse({ description: 'Danh sách order active' })
  findActive() {
    return this.ordersService.findActive();
  }

  @Patch(':id/status')
  @ApiOperation({
    summary: 'Cập nhật trạng thái đơn',
    description: 'Chuỗi: pending → preparing → ready → paid',
  })
  updateStatus(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateOrderStatusDto,
  ) {
    return this.ordersService.updateStatus(id, dto);
  }
}
