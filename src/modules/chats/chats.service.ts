import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Conversations } from './conversation.entity';
import { Messages } from './message.entity';
import { UserConversations } from './user-conversation.entity';
import { AddConversation } from './dto/add.conversation.req.dto';
import { AddUserConversation } from './dto/add.user-conversation.req.dto';
import { CheckConversation } from './dto/check.conversation.dto';
import { Customers } from '../customers/customers.entity';

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
        const subQuery = this.message
            .createQueryBuilder('message')
            .select('message.conversation_id', 'conversation_id')
            .addSelect('MAX(message.id)', 'message_id')
            .groupBy('message.conversation_id');

        const subQuerySql = subQuery.getQuery();
        const subQueryParameters = subQuery.getParameters();

        return await this.conver
            .createQueryBuilder('conver')
            .leftJoin('(' + subQuerySql + ')', 'subquery', 'conver.id = subquery.conversation_id')
            .innerJoin('userConversations', 'userConver', 'userConver.conversation_id=conver.id')
            .innerJoin('customers', 'cus', 'userConver.customer_id = cus.id')
            .addSelect(['cus.avatar_path', 'cus.id', 'cus.name'])
            .addSelect(['messages.content', 'messages.sender_id', 'messages.id'])
            .leftJoin('messages', 'messages', 'messages.id = subquery.message_id')
            .where('conver.createdByCustomer_id = :id', { id: id })
            .setParameters(subQueryParameters)
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
        const subQuery = this.message
            .createQueryBuilder('message')
            .select('message.conversation_id', 'conversation_id')
            .addSelect('MAX(message.id)', 'message_id')
            .groupBy('message.conversation_id');

        const subQuerySql = subQuery.getQuery();
        const subQueryParameters = subQuery.getParameters();

        // .createQueryBuilder('conversations')
        //     .innerJoin('(' + subQuerySql + ')', 'subquery', 'conversations.id = subquery.conversation_id')
        //     .innerJoin('customers', 'customers', 'conversations.createdByCustomer_id = customers.id')
        //     .addSelect(['customers.avatar_path', 'customers.id', 'customers.name'])
        //     .addSelect(['messages.content', 'messages.sender_id', 'messages.id'])
        //     .leftJoin('messages', 'messages', 'messages.id = subquery.message_id')
        //     .where('conversations.createdByCustomer_id = :id', { id: id })
        //     .setParameters(subQueryParameters)
        //     .getRawMany();

        return await this.userConver
            .createQueryBuilder('userConver')
            .innerJoin('(' + subQuerySql + ')', 'subquery', 'userConver.conversation_id=subquery.conversation_id')
            .innerJoin('conversations', 'conver', 'conver.id=userConver.conversation_id')
            .innerJoin('customers', 'cus', 'cus.id=conver.created_by_customer_')
            .addSelect('conver.id', 'conver_id')
            .addSelect(['cus.id', 'cus.avatar_path', 'cus.name'])
            .addSelect(['messages.content', 'messages.sender_id', 'messages.id'])
            .leftJoin('messages', 'messages', 'messages.id = subquery.message_id')
            .where(`userConver.customer_id=${id}`)
            .setParameters(subQueryParameters)
            .getRawMany();

        // .addSelect('conver.id', 'conver_id')
        // .addSelect('cus.id')
        // .addSelect('cus.avatar_path')
        // .addSelect('cus.name')
        // .innerJoin('conversations', 'conver', 'conver.id=userConver.conversation_id')
        // .innerJoin('customers', 'cus', 'cus.id=conver.created_by_customer_')
        // .where(`userConver.customer_id=${id}`)
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
