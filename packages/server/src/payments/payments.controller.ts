import {
  Body,
  Controller,
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
import { CreatePaymentDto } from './dto/create-payment.dto';
import { PaymentsService } from './payments.service';

@ApiTags('payments')
@ApiBearerAuth()
@Controller('payments')
export class PaymentsController {
  constructor(private readonly paymentsService: PaymentsService) {}

  @Post()
  @ApiOperation({
    summary: 'Thanh toán đơn',
    description:
      'Tính thối tiền (cash), đóng order (paid), giải phóng bàn, emit kitchen.',
  })
  @ApiCreatedResponse({
    description: 'Payment + orderTotal + changeAmount',
  })
  create(@Body() createPaymentDto: CreatePaymentDto) {
    return this.paymentsService.create(createPaymentDto);
  }

  @Patch(':id/void')
  @ApiOperation({
    summary: 'Void thanh toán',
    description: 'Hoàn order về ready, bàn occupied lại.',
  })
  @ApiOkResponse({ description: 'Payment đã void' })
  void(@Param('id', ParseIntPipe) id: number) {
    return this.paymentsService.voidPayment(id);
  }
}
