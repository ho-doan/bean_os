import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import {
  IsArray,
  IsBoolean,
  IsNumber,
  IsOptional,
  IsString,
  MaxLength,
  Min,
  ValidateNested,
} from 'class-validator';
import { Type } from 'class-transformer';

class MenuOptionDto {
  @ApiProperty({ example: 'sugar' })
  @IsString()
  @MaxLength(100)
  key: string;

  @ApiPropertyOptional({ example: 'Đường' })
  @IsOptional()
  @IsString()
  @MaxLength(255)
  label?: string;

  @ApiProperty({ type: [String], example: ['100%', '70%', '50%', '0%'] })
  @IsArray()
  @IsString({ each: true })
  values: string[];
}

export class CreateMenuDto {
  @ApiProperty({ example: 'Phin sữa đá' })
  @IsString()
  @MaxLength(255)
  name: string;

  @ApiProperty({ example: 25000 })
  @IsNumber()
  @Min(0)
  price: number;

  @ApiPropertyOptional({ default: true })
  @IsOptional()
  @IsBoolean()
  isAvailable?: boolean;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  @MaxLength(2000)
  description?: string;

  @ApiPropertyOptional({ type: [MenuOptionDto] })
  @IsOptional()
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => MenuOptionDto)
  options?: MenuOptionDto[];
}
