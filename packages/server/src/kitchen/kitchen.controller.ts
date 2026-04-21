import { Controller, Get, Param, ParseIntPipe, Patch } from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiOkResponse,
  ApiOperation,
  ApiTags,
} from '@nestjs/swagger';
import { KitchenService } from './kitchen.service';

@ApiTags('kitchen')
@ApiBearerAuth()
@Controller('kitchen')
export class KitchenController {
  constructor(private readonly kitchenService: KitchenService) {}

  @Get('queue')
  @ApiOperation({
    summary: 'Hàng đợi bếp (REST bootstrap)',
    description:
      'Trả pending + preparing. Realtime qua WebSocket path `/kitchen` (JSON `{ event, data }`), events `order.new`, `order.updated`.',
  })
  @ApiOkResponse({ description: 'Danh sách order cho bếp' })
  getQueue() {
    return this.kitchenService.getQueue();
  }

  @Patch(':id/done')
  @ApiOperation({
    summary: 'Đánh dấu đơn xong bếp',
    description: 'Chuyển pending/preparing → ready, emit `order.updated`.',
  })
  markDone(@Param('id', ParseIntPipe) id: number) {
    return this.kitchenService.markOrderDone(id);
  }
}
