# Bean OS — API (NestJS)

Backend MVP theo [`../../.context/mvp.md`](../../.context/mvp.md): **orders**, **tables**, **menu**, **kitchen** (REST + WebSocket), **payments**, **reports**, **auth** (JWT).

## Yêu cầu

- Node.js 20+
- MySQL 8 (local hoặc Docker)

## Cấu hình môi trường

```bash
cp .env.example .env
```

Biến chính (xem đầy đủ trong `.env.example`):

| Biến | Ý nghĩa |
| --- | --- |
| `PORT` | Cổng HTTP (mặc định 3000) |
| `JWT_SECRET` | Ký JWT (bắt buộc đổi production) |
| `JWT_EXPIRES_IN` | Thời hạn token (vd. `8h`) |
| `DB_*` | Host/port/user/password/database MySQL |
| `TYPEORM_SYNC` | `true` = TypeORM `synchronize` (chỉ dev/MVP) |
| `SEED_ADMIN_*` | Tạo user đầu tiên khi bảng `users` trống |

## MySQL bằng Docker

```bash
docker compose up -d
```

Compose tạo DB `bean_os`, user `bean` / password `bean`, port **3306**. Trùng với giá trị mặc định trong `.env.example`.

## Scripts

```bash
npm install
npm run start:dev    # dev + watch
npm run build
npm run start:prod
npm run test         # unit
npm run test:e2e     # smoke (không cần DB)
npm run test:cov
npm run lint
```

## Swagger & validation

- UI OpenAPI: **`/docs`**
- `ValidationPipe` toàn cục: `whitelist`, `forbidNonWhitelisted`, `class-validator` trên DTO.
- Hầu hết route yêu cầu header `Authorization: Bearer <token>` (JWT). Ngoại lệ `@Public()`: `GET /`, `POST /auth/login`.

## Socket.IO (bếp / thu ngân)

- Namespace: **`/kitchen`**
- Events: `order.new` (đơn mới), `order.updated` (đổi trạng thái / thanh toán / void).

## API tóm tắt (MVP)

| Module | Endpoint |
| --- | --- |
| Auth | `POST /auth/login` |
| Orders | `POST /orders`, `GET /orders/active`, `PATCH /orders/:id/status` |
| Tables | `GET /tables`, `PATCH /tables/:id/status` |
| Menu | CRUD `/menu`, `/menu/:id` (`isAvailable` để ẩn món) |
| Kitchen | `GET /kitchen/queue`, `PATCH /kitchen/:id/done` |
| Payments | `POST /payments`, `PATCH /payments/:id/void` |
| Reports | `GET /reports/daily?date=YYYY-MM-DD`, `GET /reports/items?date=...&limit=20` |

Seed dev: lần đầu chạy, server tạo **12 bàn** và vài **món mẫu** nếu DB trống; tạo user **admin** theo `SEED_ADMIN_*`.

## Ghi chú production

- Tắt `TYPEORM_SYNC` và dùng migration.
- Đổi `JWT_SECRET`, hạn chế CORS, bảo vệ WebSocket (hiện MVP mở CORS).
