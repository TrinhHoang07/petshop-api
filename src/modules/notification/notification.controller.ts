import { Body, Controller, Get, HttpStatus, Param, Post, Put, ValidationPipe } from '@nestjs/common';
import { NotificationService } from './notification.service';
import { NotiCreateDto } from './dto/noti-create.req.dto';

@Controller('notifications')
export class NotificationsController {
    constructor(private notiService: NotificationService) {}

    @Get('/all')
    async getAllNotifications(): Promise<Object> {
        const data = await this.notiService.getNotifications();

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

    @Get('/notifications/:id')
    async getNotificationsById(@Param('id') id: string): Promise<Object> {
        if (id) {
            const data = await this.notiService.getNotificationById(+id);

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

        return {
            message: 'not matches path',
            statusCode: HttpStatus.NOT_FOUND,
        };
    }

    @Post('/create')
    async addNewNotification(@Body(new ValidationPipe()) data: NotiCreateDto): Promise<Object> {
        const noti = await this.notiService.addNewNotification(data);

        if (noti) {
            return {
                message: 'success',
                statusCode: HttpStatus.OK,
                data: noti,
            };
        }

        return {
            message: 'error',
            statusCode: HttpStatus.BAD_REQUEST,
        };
    }

    @Get('/seen/:id')
    async updateSeen(@Param('id') id: string): Promise<Object> {
        if (id) {
            const isUpdate = await this.notiService.updateSeenById(+id);

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

        return {
            message: 'not matches path',
            statusCode: HttpStatus.NOT_FOUND,
        };
    }
}
