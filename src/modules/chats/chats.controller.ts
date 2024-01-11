import { Controller, Post, Get, Param, Res, HttpStatus, UseGuards, Body, ValidationPipe } from '@nestjs/common';
import { ChatsService } from './chats.service';
import { ChatsAddDto } from './dto/chats-add.req.dto';
import { Response } from 'express';
import { AuthGuard } from '@nestjs/passport';
import { AddConversation } from './dto/add.conversation.req.dto';
import { AddUserConversation } from './dto/add.user-conversation.req.dto';
import { CheckConversation } from './dto/check.conversation.dto';

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

            // add empty message
            const message = await this.chatsService.addNewMessageByConversationId({
                conversation_id: conver.id,
                sender_id: data.created_by_customer,
                receiver_id: data.customer_id,
                content: '',
            });

            if (userConver && message) {
                return {
                    message: 'success',
                    statusCode: HttpStatus.OK,
                    data: {
                        id_conver: conver.id,
                    },
                };
            }
        }

        return {
            message: 'error',
            statusCode: HttpStatus.INTERNAL_SERVER_ERROR,
        };
    }

    @Post('/conversations/check')
    async checkConversation(@Body() obj: CheckConversation) {
        const data = await this.chatsService.checkConversation(obj);

        if (data) {
            return {
                message: 'success',
                statusCode: HttpStatus.OK,
                data,
            };
        }

        return {
            message: 'error',
            statusCode: HttpStatus.BAD_REQUEST,
        };
    }

    @Get('/conversations/info/:id')
    async getCustomerConversationByCreatedId(@Param('id') id: string): Promise<Object> {
        const data = await this.chatsService.getCustomerConversationByCreatedId(+id);

        if (data) {
            return {
                message: 'success',
                statusCode: HttpStatus.OK,
                data,
            };
        }

        return {
            message: 'error',
            statusCode: HttpStatus.BAD_REQUEST,
        };
    }

    @Post('/messages/create')
    async addNewMessage(@Body() data: any): Promise<Object> {
        const mes = await this.chatsService.addNewMessageByConversationId(data);

        if (mes) {
            return {
                message: 'success',
                statusCode: HttpStatus.OK,
                data: mes,
            };
        }

        return {
            message: 'error',
            statusCode: HttpStatus.BAD_REQUEST,
        };
    }

    @Get('/messages/all/:id')
    async getMessagesByConversationId(@Param('id') id: string): Promise<Object> {
        const data = await this.chatsService.getMessagesByConversationId(+id);

        if (data) {
            return {
                message: 'success',
                statusCode: HttpStatus.OK,
                data,
            };
        }

        return {
            message: 'error',
            statusCode: HttpStatus.BAD_REQUEST,
        };
    }

    @Get('/user-conversations/joined/:id')
    async getJoinedConversationsById(@Param('id') id: string) {
        const data = await this.chatsService.getJoinedConversationsById(+id);

        if (data) {
            return {
                message: 'success',
                statusCode: HttpStatus.OK,
                data,
            };
        }

        return {
            message: 'error',
            statusCode: HttpStatus.BAD_REQUEST,
        };
    }
}
