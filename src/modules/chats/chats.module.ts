import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Chats } from './chats.entity';
import { ChatsController } from './chats.controller';
import { ChatsService } from './chats.service';

@Module({
    imports: [TypeOrmModule.forFeature([Chats])],
    controllers: [ChatsController],
    providers: [ChatsService],
    exports: [ChatsService],
})
export class ChatsModule {}
