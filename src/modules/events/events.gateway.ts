import {
    OnGatewayConnection,
    OnGatewayDisconnect,
    SubscribeMessage,
    WebSocketGateway,
    WebSocketServer,
} from '@nestjs/websockets';
import { Server } from 'socket.io';
import { ChatsService } from '../chats/chats.service';

@WebSocketGateway(3008, { cors: true })
export class EventsGateway implements OnGatewayConnection, OnGatewayDisconnect {
    @WebSocketServer()
    server: Server;

    constructor(private chatsService: ChatsService) {}

    async handleConnection(client: any) {
        console.log('connected ID: ', client.id);
    }

    async handleDisconnect(client: any) {
        console.log('disconnect ID: ', client.id);
    }

    @SubscribeMessage('messageToUser')
    async handleMessageUser(client: any, payload: any) {
        this.server.socketsJoin(payload.id);
        this.server.in(payload.id).emit(`${payload.id}`, {
            name: payload.name,
        });
    }

    @SubscribeMessage('messageToAdmin')
    async handleMessageAdmin(client: any, payload: any) {
        this.server.socketsJoin(payload.id);
        this.server.in(payload.id).emit(`${payload.id}`, {
            name: payload.name,
        });
    }
}
