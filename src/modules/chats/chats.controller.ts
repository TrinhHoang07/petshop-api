import { Controller, Post, Get, Param, Res, HttpStatus } from '@nestjs/common';
import { ChatsService } from './chats.service';
import { ChatsAddDto } from './dto/chats-add.req.dto';
import { Response } from 'express';

@Controller('chats')
export class ChatsController {
    constructor(private chatsService: ChatsService) {}
}
