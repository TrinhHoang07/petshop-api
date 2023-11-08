import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ChatsController } from './chats.controller';
import { ChatsService } from './chats.service';
import { Conversations } from './conversation.entity';
import { Messages } from './message.entity';
import { UserConversations } from './user-conversation.entity';

@Module({
    imports: [TypeOrmModule.forFeature([Conversations, Messages, UserConversations])],
    controllers: [ChatsController],
    providers: [ChatsService],
    exports: [ChatsService],
})
export class ChatsModule {}
