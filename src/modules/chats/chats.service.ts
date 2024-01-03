import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Conversations } from './conversation.entity';
import { Messages } from './message.entity';
import { UserConversations } from './user-conversation.entity';
import { AddConversation } from './dto/add.conversation.req.dto';
import { AddUserConversation } from './dto/add.user-conversation.req.dto';

@Injectable()
export class ChatsService {
    constructor(
        @InjectRepository(Conversations) private conver: Repository<Conversations>,
        @InjectRepository(Messages) private message: Repository<Messages>,
        @InjectRepository(UserConversations) private userConver: Repository<UserConversations>,
    ) {}

    // add new conversation
    async addConversation(data: AddConversation): Promise<Conversations> {
        const conversation = new Conversations();
        conversation.conversation_name = data.conversation_name;
        conversation.conversation_type = data.conversation_type;
        conversation.created_by_customer_ = data.created_by_customer;

        return await this.conver.save(conversation);
    }

    // add new user-conversation
    async addUserConversation(data: AddUserConversation): Promise<UserConversations> {
        const userConversation = new UserConversations();
        userConversation.conversation_ = data.conversation_id;
        userConversation.customer_ = data.customer_id;

        return await this.userConver.save(userConversation);
    }

    // get id conversation by created user id
    async checkConversation(data: number) {
        return await this.conver
            .createQueryBuilder('conver')
            .addSelect('userConver.customer_id')
            .addSelect('conver.created_by_customer_')
            .innerJoin('userConversations', 'userConver', 'userConver.conversation_id=conver.id')
            .where('conver.created_by_customer_=:id', { id: data })
            .getRawOne();
    }
}
