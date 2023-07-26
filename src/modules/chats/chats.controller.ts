import { Controller, Post, Get, Param, Res, HttpStatus } from '@nestjs/common';
import { ChatsService } from './chats.service';
import { ChatsAddDto } from './dto/chats-add.req.dto';
import { Chats } from './chats.entity';
import { Response } from 'express';

@Controller('chats')
export class ChatsController {
    constructor(private chatsService: ChatsService) {}

    @Post('/create')
    async createChat(data: ChatsAddDto): Promise<Chats> {
        return await this.chatsService.createChats(data);
    }

    @Get('/chat/:id')
    async getChatById(@Param('id') id: string): Promise<Chats[] | Object> {
        if (id) {
            return await this.chatsService.getChatsByUserId(+id);
        }

        return {
            message: 'error',
            code: HttpStatus.BAD_REQUEST,
        }
    }
}
