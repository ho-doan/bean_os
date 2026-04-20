import { ApiProperty } from '@nestjs/swagger';
import { IsString, MaxLength, MinLength } from 'class-validator';

export class LoginDto {
  @ApiProperty({ example: 'admin' })
  @IsString()
  @MinLength(2)
  @MaxLength(64)
  username: string;

  @ApiProperty({ example: 'admin123' })
  @IsString()
  @MinLength(4)
  @MaxLength(128)
  password: string;
}
