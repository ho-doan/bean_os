import {
  Body,
  Controller,
  Get,
  Param,
  ParseIntPipe,
  Patch,
} from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiOkResponse,
  ApiOperation,
  ApiTags,
} from '@nestjs/swagger';
import { UpdateTableStatusDto } from './dto/update-table-status.dto';
import { TablesService } from './tables.service';

@ApiTags('tables')
@ApiBearerAuth()
@Controller('tables')
export class TablesController {
  constructor(private readonly tablesService: TablesService) {}

  @Get()
  @ApiOperation({ summary: 'Danh sách bàn + trạng thái free/occupied' })
  @ApiOkResponse({ description: 'Danh sách bàn' })
  findAll() {
    return this.tablesService.findAll();
  }

  @Patch(':id/status')
  @ApiOperation({
    summary: 'Cập nhật trạng thái bàn',
    description: 'Thường được cập nhật gián tiếp khi tạo/đóng đơn.',
  })
  updateStatus(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateTableStatusDto,
  ) {
    return this.tablesService.updateStatus(id, dto);
  }
}
