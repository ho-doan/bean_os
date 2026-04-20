import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import { IsDateString, IsInt, IsOptional, Max, Min } from 'class-validator';

export class ReportsDateQueryDto {
  @ApiProperty({ example: '2026-04-20', description: 'YYYY-MM-DD' })
  @IsDateString()
  date: string;
}

export class ReportsItemsQueryDto extends ReportsDateQueryDto {
  @ApiPropertyOptional({ default: 20, maximum: 100 })
  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  @Max(100)
  limit?: number;
}
