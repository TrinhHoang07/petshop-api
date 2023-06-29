import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Chats } from './chats.entity';
import { ChatsAddDto } from './dto/chats-add.req.dto';

@Injectable()
export class ChatsService {
    constructor(@InjectRepository(Chats) private chatsService: Repository<Chats>) {}

    async getChatsByUserId(userId: number): Promise<Chats[]> {
        return await this.chatsService.findBy({
            customer_id: userId,
        });
    }

    async createChats(data: ChatsAddDto): Promise<Chats> {
        const chat = new Chats();
        chat.customer_id = data.customer_id;
        chat.message_emit = data.message_emit;
        chat.message_on = data.message_on;

        return chat.save();
    }
}
