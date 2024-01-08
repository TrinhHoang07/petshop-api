import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Conversations } from './conversation.entity';
import { Messages } from './message.entity';
import { UserConversations } from './user-conversation.entity';
import { AddConversation } from './dto/add.conversation.req.dto';
import { AddUserConversation } from './dto/add.user-conversation.req.dto';
import { CheckConversation } from './dto/check.conversation.dto';

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

    // get customer conversation by created id
    async getCustomerConversationByCreatedId(id: number) {
        return await this.conver
            .createQueryBuilder('conver')
            .addSelect('cus.id')
            .addSelect('cus.name')
            .addSelect('cus.avatar_path')
            .innerJoin('userConversations', 'userConver', 'userConver.conversation_id=conver.id')
            .innerJoin('customers', 'cus', 'cus.id=userConver.customer_id')
            .where('conver.created_by_customer_=:id', { id: id })
            .getRawMany();
    }

    // get id conversation by created user id
    async checkConversation(data: CheckConversation) {
        if (data.type) {
            return await this.conver
                .createQueryBuilder('conver')
                .addSelect('userConver.customer_id')
                .addSelect('conver.created_by_customer_')
                .innerJoin('userConversations', 'userConver', 'userConver.conversation_id=conver.id')
                .where('conver.created_by_customer_=:id', { id: data.created_id })
                .andWhere('userConver.customer_id=:customer_id', { customer_id: data.customer_id })
                .getRawMany();
        }

        return await this.conver
            .createQueryBuilder('conver')
            .addSelect('userConver.customer_id')
            .addSelect('conver.created_by_customer_')
            .innerJoin('userConversations', 'userConver', 'userConver.conversation_id=conver.id')
            .where(`conver.created_by_customer_=${data.created_id} AND userConver.customer_id=${data.customer_id}`)
            .orWhere(`conver.created_by_customer_=${data.customer_id} AND userConver.customer_id=${data.created_id}`)
            .getRawOne();
    }

    // get joined conversations by id customer
    async getJoinedConversationsById(id: number) {
        return await this.userConver
            .createQueryBuilder('userConver')
            .addSelect('conver.id', 'conver_id')
            .addSelect('cus.id')
            .addSelect('cus.avatar_path')
            .addSelect('cus.name')
            .innerJoin('conversations', 'conver', 'conver.id=userConver.conversation_id')
            .innerJoin('customers', 'cus', 'cus.id=conver.created_by_customer_')
            .where(`userConver.customer_id=${id}`)
            .getRawMany();
    }

    // add new message by conversation id
    async addNewMessageByConversationId(data: any): Promise<Messages> {
        const message = new Messages();
        message.conversation_ = data.conversation_id;
        message.content = data.content;
        message.sender_ = data.sender_id;
        message.receiver_ = data.receiver_id;

        return await this.message.save(message);
    }

    // get messages by conversation id
    async getMessagesByConversationId(conversationId: number): Promise<Messages[]> {
        return await this.message
            .createQueryBuilder('message')
            .addSelect('cus.avatar_path')
            .innerJoin('customers', 'cus', 'cus.id=message.sender_id')
            .where(`message.conversation_id=${conversationId}`)
            .orderBy('message.id')
            .getRawMany();
    }
}
