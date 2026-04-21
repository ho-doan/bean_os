import { Logger } from '@nestjs/common';
import {
  OnGatewayConnection,
  WebSocketGateway,
  WebSocketServer,
} from '@nestjs/websockets';
import { Server, WebSocket } from 'ws';

import { Public } from '../common/decorators/public.decorator';

/** JSON frame gửi tới client: `{ "event": "order.new" | "order.updated", "data": ... }` */
@Public()
@WebSocketGateway({ path: '/kitchen' })
export class KitchenGateway implements OnGatewayConnection {
  private readonly logger = new Logger(KitchenGateway.name);

  @WebSocketServer()
  server!: Server;

  handleConnection(client: WebSocket): void {
    this.logger.debug(`kitchen ws client connected (${client.protocol})`);
  }

  emitOrderNew(payload: unknown): void {
    this.broadcast('order.new', payload);
  }

  emitOrderUpdated(payload: unknown): void {
    this.broadcast('order.updated', payload);
  }

  private broadcast(event: string, payload: unknown): void {
    let msg: string;
    try {
      msg = JSON.stringify({ event, data: payload }, this.circularReplacer());
    } catch (e) {
      this.logger.warn(`kitchen broadcast skipped: ${String(e)}`);
      return;
    }
    for (const client of this.server.clients) {
      if (client.readyState === WebSocket.OPEN) {
        client.send(msg);
      }
    }
  }

  private circularReplacer(): (key: string, value: unknown) => unknown {
    const seen = new WeakSet<object>();
    return (_key: string, value: unknown) => {
      if (typeof value === 'object' && value !== null) {
        if (seen.has(value)) {
          return undefined;
        }
        seen.add(value);
      }
      return value;
    };
  }
}
