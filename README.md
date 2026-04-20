# Bean OS (MVP)

Ứng dụng quản lý quán (POS / bếp / thu ngân) theo MVP trong [`.context/mvp.md`](.context/mvp.md).

## Thành phần

| Phần | Mô tả |
| --- | --- |
| **Backend** | [`packages/server`](packages/server) — NestJS, MySQL (driver `mysql2`), TypeORM, JWT, Socket.IO (`/kitchen`), Swagger tại `/docs`. |
| **Mobile** | Flutter (theo MVP: Riverpod + WebSocket) — roadmap UI trong `mvp.md`. |

## Chạy nhanh backend

```bash
cd packages/server
cp .env.example .env
docker compose up -d
npm install
npm run start:dev
```

- API: `http://localhost:3000` (mặc định `PORT=3000`)
- Swagger: `http://localhost:3000/docs`
- Đăng nhập: `POST /auth/login` (user seed mặc định trong `.env.example`), sau đó dùng **Authorize** trên Swagger với Bearer token.
- Socket.IO bếp: namespace `http://localhost:3000/kitchen` — sự kiện `order.new`, `order.updated`.

Chi tiết biến môi trường, Docker MySQL, test và endpoint: xem [`packages/server/README.md`](packages/server/README.md).
