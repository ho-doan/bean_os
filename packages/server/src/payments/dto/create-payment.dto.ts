import { ApiProperty } from '@nestjs/swagger';
import { IsEnum, IsInt, IsNumber, Min } from 'class-validator';
import { PaymentMethod } from '../../common/enums/payment-method.enum';

export class CreatePaymentDto {
  @ApiProperty({ example: 1 })
  @IsInt()
  @Min(1)
  orderId: number;

  @ApiProperty({ enum: PaymentMethod, example: PaymentMethod.cash })
  @IsEnum(PaymentMethod)
  method: PaymentMethod;

  @ApiProperty({
    description: 'Số tiền khách đưa (tiền mặt). Phải >= tổng đơn.',
    example: 100000,
  })
  @IsNumber()
  @Min(0)
  amount: number;
}
