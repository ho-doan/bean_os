# CHANGE LOG

## 0.0.1

### packages/server

- MVP NestJS: TypeORM + MySQL (`mysql2`), JWT (`POST /auth/login`), Swagger, `ValidationPipe` (whitelist + transform), seed admin/bàn/menu khi DB trống.
- Modules: **orders**, **tables**, **menu**, **kitchen** (REST queue + mark done), **payments**, **reports**.
- **Kitchen realtime**: chuyển từ Socket.IO sang **WebSocket thuần** (`@nestjs/platform-ws` + `ws`), path **`/kitchen`**, frame text JSON `{"event":"order.new"|"order.updated","data":...}` (tránh vòng tham chiếu khi stringify entity).
- `main.ts`: `WsAdapter`; gateway kitchen gắn **`@Public()`** để handshake không bị `JwtAuthGuard` chặn (MVP).
- Phụ thuộc: gỡ `@nestjs/platform-socket.io` / `socket.io`; thêm `@nestjs/platform-ws`, `ws`, `@types/ws`.
- README / Swagger mô tả cập nhật theo WebSocket (không còn namespace Socket.IO).

### packages/flutter

- MVP UI: shell **Order / Kitchen / Cashier / Reports**; state chính **Riverpod**; clean architecture (use case + repository + Retrofit `PosApi` + Freezed DTO + cache Drift cho kitchen queue / active orders).
- **Auth**: `LoginUseCase` → `AuthRepository` gọi `POST /auth/login`; token lưu local (Drift KV) + `AuthSession`; `AuthInterceptor` trên Dio; `GoRouter` `refreshListenable` + redirect theo đăng nhập.
- **Kitchen realtime**: `WebSocketChannel` tới **`ws(s)://<API_URL host>/kitchen`**, parse JSON `event` === `order.new` | `order.updated` để invalidate queue; fallback poll mỗi 5s nếu lỗi kết nối.
- **Env**: chỉ còn `API_URL` + `APP_NAME` (bỏ `WS_URL` — cùng host với REST).
- **Test**: `widget_test` bật `authStateListenable` sau `configureDependencies()` để pump được shell MVP.
