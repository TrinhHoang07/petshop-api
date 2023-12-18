import { Controller, Post, Get, Param, HttpStatus, UseGuards, ValidationPipe, Body, Delete } from '@nestjs/common';
import { FriendshipService } from './friendship.service';
import { AuthGuard } from '@nestjs/passport';
import { FriendshipCreateDto } from './dto/friendship-create.req.dto';

@Controller('friendship')
export class FriendshipController {
    constructor(private friendshipService: FriendshipService) {}

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
    @Delete('/friendship/delete/:id')
    async deleteFriendshipById(@Param('id') id: string): Promise<Object> {
        if (id) {
            const data = await this.friendshipService.removeFriendshipById(+id);

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
