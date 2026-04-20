import { Controller, Get, Query } from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiOkResponse,
  ApiOperation,
  ApiTags,
} from '@nestjs/swagger';
import {
  ReportsItemsQueryDto,
  ReportsDateQueryDto,
} from './dto/reports-query.dto';
import { ReportsService } from './reports.service';

@ApiTags('reports')
@ApiBearerAuth()
@Controller('reports')
export class ReportsController {
  constructor(private readonly reportsService: ReportsService) {}

  @Get('daily')
  @ApiOperation({
    summary: 'Báo cáo doanh thu theo ngày',
    description: 'Tổng tiền + số đơn (theo payments không void).',
  })
  @ApiOkResponse({ description: 'Tổng doanh thu và số đơn' })
  getDaily(@Query() query: ReportsDateQueryDto) {
    return this.reportsService.getDaily(query.date);
  }

  @Get('items')
  @ApiOperation({
    summary: 'Top món bán theo ngày',
    description: 'Theo qty đã bán trong các đơn đã thanh toán trong ngày.',
  })
  @ApiOkResponse({ description: 'Top menu items' })
  getTopItems(@Query() query: ReportsItemsQueryDto) {
    const limit = query.limit ?? 20;
    return this.reportsService.getTopItems(query.date, limit);
  }
}
