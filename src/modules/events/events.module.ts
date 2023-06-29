import { Module } from '@nestjs/common';
import { EventsGateway } from './events.gateway';
import { ChatsModule } from '../chats/chats.module';

@Module({
    imports: [ChatsModule],
    providers: [EventsGateway],
})
export class EventsModule {}
