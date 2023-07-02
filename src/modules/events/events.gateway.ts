import {
    MessageBody,
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
    async handleMessageUser(@MessageBody() payload) {
        this.server.socketsJoin(payload.id);
        this.server.in(`${payload.id}`).emit(`${payload.id}`, {
            id: payload.id,
            name: payload.name,
            role: payload.role,
            message: payload.message,
        });
    }

    @SubscribeMessage('messageToAdmin')
    async handleMessageAdmin(@MessageBody() payload) {
        this.server.emit(`user_sent`, {
            id: payload.id,
            name: payload.name,
            role: payload.role,
            message: payload.message,
        });

        this.server.emit(`init_user_${payload.id}`, {
            id: payload.id,
        });
    }

    @SubscribeMessage('typing_user')
    async handleTypingUser(@MessageBody() payload) {
        this.server.emit(`typing_user_${payload}`, {
            isType: payload,
        });
    }

    @SubscribeMessage('clear_typing_user')
    async handleClearTypingUser(@MessageBody() payload) {
        this.server.emit(`clear_typing_user_${payload}`, {
            isType: payload,
        });
    }

    @SubscribeMessage('typing_admin')
    async handleTypingAdmin(@MessageBody() payload) {
        this.server.socketsJoin(`typing_admin_${payload}`);
        this.server.in(`typing_admin_${payload}`).emit(`typing_admin_${payload}`, {
            isType: payload,
        });
    }

    @SubscribeMessage('clear_typing_admin')
    async handleClearTypingAdmin(@MessageBody() payload) {
        this.server.socketsJoin(`clear_typing_admin_${payload}`);
        this.server.in(`clear_typing_admin_${payload}`).emit(`clear_typing_admin_${payload}`, {
            isType: payload,
        });
    }
}