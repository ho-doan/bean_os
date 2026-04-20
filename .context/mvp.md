# MVP

---

## Backend — NestJS Controllers

Cấu trúc gọn theo 6 module chính:**Click vào từng controller** để đào sâu hơn. Dưới đây là breakdown chi tiết:

---

### 6 Controllers — Nhiệm vụ cụ thể

**`OrdersController`** — trái tim, phức tạp nhất:

- `POST /orders` → nhận `{ tableId, items: [{menuItemId, qty, note}] }`, tạo order + emit WebSocket tới màn bếp
- `PATCH /orders/:id/status` → `pending → preparing → ready → paid`
- `GET /orders/active` → tất cả order chưa thanh toán (dùng cho cashier view)

**`TablesController`**:

- `GET /tables` → trả về list + trạng thái (free/occupied)
- `PATCH /tables/:id/status` → tự động cập nhật khi order được tạo/đóng

**`MenuController`**:

- CRUD cơ bản, thêm field `isAvailable: boolean` → tạm ẩn món hết nguyên liệu

**`KitchenController`** + WebSocket Gateway:

- REST `GET /kitchen/queue` để load lần đầu
- `@WebSocketGateway` emit `order.new` realtime — không cần polling
- `PATCH /kitchen/:id/done` → đổi status, emit lại cho cashier

**`PaymentsController`**:

- `POST /payments` → `{ orderId, method: 'cash', amount }`, tính thối tiền, đóng order
- `PATCH /payments/:id/void` → hủy đơn (nhỡ bấm nhầm)

**`ReportsController`** — chỉ GET, không write:

- `GET /reports/daily?date=2025-01-20` → tổng tiền + số đơn trong ngày
- `GET /reports/items?date=...` → top món bán chạy

---

## Flutter UI/UX — 3 vai trò, 3 luồng---

## Nguyên tắc UX quan trọng nhất cho MVP này

**Tốc độ trên hết.** Màn chọn món là nơi nhân viên dùng nhiều nhất — thiết kế để tay không rời màn hình: item to, khoảng cách tap thoải mái (min 48px), số lượng thay đổi ngay tại chỗ, không mở dialog.

**Không có loading spinner.** Dùng optimistic UI — bấm "Gửi bếp" thì order xuất hiện ngay trên màn hình bếp, rollback nếu request fail. Nhân viên không chờ.

**Màn bếp là TV, không phải điện thoại.** Font tối thiểu 20px, card order có màu nền khác nhau theo trạng thái, ghi chú (ít đường, ít đá) bôi vàng nổi bật. Swipe để đánh dấu "xong" nhanh hơn tap.

**State management**: Dùng `Riverpod` — đủ đơn giản, không boilerplate, reactive tốt với WebSocket stream. Tránh `BLoC` ở MVP vì thêm boilerplate không cần thiết.

**WebSocket**: `web_socket_channel` package, connect 1 lần khi app khởi động, reconnect tự động. Màn bếp và màn cashier đều subscribe cùng 1 stream, khác nhau ở cách render.

---

## Tổng kết cấu trúc

| Layer | Tech | Ghi chú |
| --- | --- | --- |
| Mobile app | Flutter | 1 codebase, tablet + phone |
| API | NestJS | 6 controllers, JWT auth |
| Realtime | Socket.IO Gateway | chỉ cho Kitchen + Cashier |
| DB | PostgreSQL + TypeORM | đơn giản, dễ query báo cáo |
| Hosting MVP | Railway / Render | miễn phí, deploy nhanh |

Click vào bất kỳ screen hay controller nào trong diagram để tôi đào sâu hơn nhé.
