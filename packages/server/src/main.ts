import { ValidationPipe } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.enableCors({ origin: true });

  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      forbidNonWhitelisted: true,
      transform: true,
      transformOptions: { enableImplicitConversion: true },
    }),
  );

  const swaggerConfig = new DocumentBuilder()
    .setTitle('Bean OS API')
    .setDescription(
      'MVP backend: orders, tables, menu, kitchen (REST + Socket.IO `/kitchen`), payments, reports, JWT auth. Database: MySQL qua driver **mysql2**.',
    )
    .setVersion('1.0')
    .addBearerAuth()
    .build();
  const document = SwaggerModule.createDocument(app, swaggerConfig);
  SwaggerModule.setup('swagger', app, document);

  const port = Number(process.env.PORT ?? 3000);
  console.log(`Server is running on port http://localhost:${port}/swagger`);
  await app.listen(port);
}
void bootstrap();
