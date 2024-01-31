import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Notification } from './notification.entity';
import { Repository } from 'typeorm';
import { NotiCreateDto } from './dto/noti-create.req.dto';

@Injectable()
export class NotificationService {
    constructor(@InjectRepository(Notification) private notification: Repository<Notification>) {}

    async getNotifications(): Promise<Notification[]> {
        return await this.notification.find();
    }

    async getNotificationById(id: number): Promise<Notification[]> {
        return await this.notification
            .createQueryBuilder('noti')
            .addSelect('noti.id', 'id')
            .addSelect('noti.content', 'content')
            .addSelect('noti.avatar_path', 'avatar_path')
            .addSelect('noti.customer_id', 'customer_id')
            .addSelect('noti.seen', 'seen')
            .addSelect('noti.created_at', 'created_at')
            .innerJoin('customers', 'cus', 'cus.id=noti.customer_id')
            .where('noti.customer_id=:id', { id })
            .getRawMany();
    }

    async addNewNotification(data: NotiCreateDto): Promise<Notification> {
        const noti = new Notification();
        noti.content = data.content;
        noti.avatar_path = data.avatar_path;
        noti.customer_ = data.customer_id;

        return await this.notification.save(noti);
    }
}
