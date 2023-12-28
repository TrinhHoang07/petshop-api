import { Controller, Post, Get, Param, HttpStatus, UseGuards, ValidationPipe, Body, Put } from '@nestjs/common';
import { FriendshipService } from './friendship.service';
import { AuthGuard } from '@nestjs/passport';
import { FriendshipCreateDto } from './dto/friendship-create.req.dto';
import { FriendshipUpdateStatusDto } from './dto/friendship-update-status.req.dto';

@Controller('friendship')
export class FriendshipController {
    constructor(private friendshipService: FriendshipService) {}

    @UseGuards(AuthGuard('jwt'))
    @Get('/friendship/friended/:id')
    async getFriendshipedById(@Param('id') id: string): Promise<Object> {
        if (id) {
            const data = await this.friendshipService.getFriendshipedById(+id);

            return {
                message: 'success',
                statusCode: HttpStatus.OK,
                data,
            };
        } else {
            return {
                message: 'Bad request, not found ID!',
                statusCode: HttpStatus.BAD_REQUEST,
            };
        }
    }

    @UseGuards(AuthGuard('jwt'))
    @Post('/friendship/create')
    async addNewInviteFriend(@Body(new ValidationPipe()) data: FriendshipCreateDto): Promise<Object> {
        const fr = await this.friendshipService.addNewFriend(data);

        if (fr) {
            return {
                message: 'success',
                statusCode: HttpStatus.OK,
            };
        }

        return {
            message: 'Error!',
            statusCode: HttpStatus.BAD_REQUEST,
        };
    }

    @UseGuards(AuthGuard('jwt'))
    @Get('/friendship/invite/:id')
    async getFriendshipByIdInvite(@Param('id') id: string): Promise<Object> {
        if (id) {
            const data = await this.friendshipService.getFriendshipByIdInvite(+id);

            return {
                message: 'success',
                statusCode: HttpStatus.OK,
                data,
            };
        }

        return {
            message: 'Bad request, not found ID!',
            statusCode: HttpStatus.BAD_REQUEST,
        };
    }

    @UseGuards(AuthGuard('jwt'))
    @Get('/friendship/give-invite/:id')
    async getFriendshipByGiveInviteId(@Param('id') id: string): Promise<Object> {
        if (id) {
            const data = await this.friendshipService.getFriendshipByIdGiveInvite(+id);

            return {
                message: 'success',
                statusCode: HttpStatus.OK,
                data,
            };
        }

        return {
            message: 'Bad request, not found ID!',
            statusCode: HttpStatus.BAD_REQUEST,
        };
    }

    @UseGuards(AuthGuard('jwt'))
    @Post('/friendship/update/status')
    async handleFriendshipStatus(@Body(new ValidationPipe()) data: FriendshipUpdateStatusDto): Promise<Object> {
        const isUpdate = await this.friendshipService.handleStatusFriend(data);

        if (isUpdate.affected !== 0) {
            return {
                message: 'success',
                statusCode: HttpStatus.OK,
            };
        } else {
            return {
                message: 'error',
                statusCode: HttpStatus.BAD_REQUEST,
            };
        }
    }

    @UseGuards(AuthGuard('jwt'))
    @Put('/friendship/delete')
    async deleteFriendshipById(@Body() obj: FriendshipCreateDto): Promise<Object> {
        if (obj) {
            const data = await this.friendshipService.removeFriendshipById(obj.customer_invite, obj.customer_id);

            if (data.affected !== 0) {
                return {
                    message: 'success',
                    statusCode: HttpStatus.OK,
                };
            } else {
                return {
                    message: 'error',
                    statusCode: HttpStatus.BAD_REQUEST,
                };
            }
        }

        return {
            message: 'Bad request, not found ID!',
            statusCode: HttpStatus.BAD_REQUEST,
        };
    }
}
