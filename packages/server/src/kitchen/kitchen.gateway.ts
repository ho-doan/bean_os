import { WebSocketGateway, WebSocketServer } from '@nestjs/websockets';
import { Server } from 'socket.io';

@WebSocketGateway({
  namespace: '/kitchen',
  cors: { origin: '*' },
})
export class KitchenGateway {
  @WebSocketServer()
  server: Server;

  emitOrderNew(payload: unknown): void {
    this.server.emit('order.new', payload);
  }

  emitOrderUpdated(payload: unknown): void {
    this.server.emit('order.updated', payload);
  }
}
