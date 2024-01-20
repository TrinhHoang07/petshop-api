import {
    BaseEntity,
    Column,
    CreateDateColumn,
    DeleteDateColumn,
    Entity,
    ManyToOne,
    PrimaryGeneratedColumn,
    UpdateDateColumn,
} from 'typeorm';
import { Customers } from '../customers/customers.entity';
import { Conversations } from './conversation.entity';

@Entity('userConversations')
export class UserConversations extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;

    // @Column()
    @ManyToOne(() => Customers, (cus) => cus.id)
    customer_: number;

    // @Column()
    @ManyToOne(() => Conversations, (conver) => conver.id)
    conversation_: number;

    @CreateDateColumn()
    created_at: Date;

    @UpdateDateColumn()
    updated_at: Date;

    @DeleteDateColumn()
    deleted_at: Date;
}
