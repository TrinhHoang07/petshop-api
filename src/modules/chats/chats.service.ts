import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Conversations } from './conversation.entity';
import { Messages } from './message.entity';
import { UserConversations } from './user-conversation.entity';

@Injectable()
export class ChatsService {
    constructor(
        @InjectRepository(Conversations) private conver: Repository<Conversations>,
        @InjectRepository(Messages) private message: Repository<Messages>,
        @InjectRepository(UserConversations) private userConver: Repository<UserConversations>,
    ) {}
}
