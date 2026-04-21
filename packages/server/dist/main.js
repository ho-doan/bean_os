"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const common_1 = require("@nestjs/common");
const core_1 = require("@nestjs/core");
const swagger_1 = require("@nestjs/swagger");
const platform_ws_1 = require("@nestjs/platform-ws");
const app_module_1 = require("./app.module");
async function bootstrap() {
    const app = await core_1.NestFactory.create(app_module_1.AppModule);
    app.useWebSocketAdapter(new platform_ws_1.WsAdapter(app));
    app.enableCors({ origin: true });
    app.useGlobalPipes(new common_1.ValidationPipe({
        whitelist: true,
        forbidNonWhitelisted: true,
        transform: true,
        transformOptions: { enableImplicitConversion: true },
    }));
    const swaggerConfig = new swagger_1.DocumentBuilder()
        .setTitle('Bean OS API')
        .setDescription('MVP backend: orders, tables, menu, kitchen (REST + native WebSocket `ws://…/kitchen`), payments, reports, JWT auth. Database: MySQL qua driver **mysql2**.')
        .setVersion('1.0')
        .addBearerAuth()
        .build();
    const document = swagger_1.SwaggerModule.createDocument(app, swaggerConfig);
    swagger_1.SwaggerModule.setup('swagger', app, document);
    const port = Number(process.env.PORT ?? 3000);
    console.log(`Server is running on port http://localhost:${port}/swagger`);
    await app.listen(port);
}
void bootstrap();
//# sourceMappingURL=main.js.map