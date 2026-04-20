import { Module } from '@nestjs/common';
import { AppController } from '../src/app.controller';
import { AppService } from '../src/app.service';

/**
 * Module tối giản cho smoke e2e (không cần MySQL).
 */
@Module({
  controllers: [AppController],
  providers: [AppService],
})
export class MinimalAppModule {}
