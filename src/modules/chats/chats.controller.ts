import { Controller, Post, Get, Param, Res, HttpStatus, UseGuards, Body, ValidationPipe } from '@nestjs/common';
import { ChatsService } from './chats.service';
import { ChatsAddDto } from './dto/chats-add.req.dto';
import { Response } from 'express';
import { AuthGuard } from '@nestjs/passport';
import { AddConversation } from './dto/add.conversation.req.dto';
import { AddUserConversation } from './dto/add.user-conversation.req.dto';

@Controller('chats')
export class ChatsController {
    constructor(private chatsService: ChatsService) {}

    // conversations
    @Post('/conversations/create')
    @UseGuards(AuthGuard('jwt'))
    async addNewConversation(@Body(new ValidationPipe()) data: AddConversation): Promise<Object> {
        const conver = await this.chatsService.addConversation(data);

        if (conver) {
            // add user to chat conversation
            const userConver = await this.chatsService.addUserConversation({
                conversation_id: conver.id,
                customer_id: data.customer_id,
            });

            if (userConver) {
                return {
                    message: 'success',
                    statusCode: HttpStatus.OK,
                };
            }
        }

        return {
            message: 'error',
            statusCode: HttpStatus.INTERNAL_SERVER_ERROR,
        };
    }

    // test
    @Get('/conversations/test/:id')
    async checkConversation(@Param('id') id: string) {
        if (id) {
            const data = await this.chatsService.checkConversation(+id);

            return {
                message: 'success',
                data,
            };
        }

        return {
            message: 'error',
        };
    }
}
