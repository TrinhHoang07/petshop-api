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

@Entity('messages')
export class Messages extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;

    // @Column()
    @ManyToOne(() => Customers, (cus) => cus.id)
    sender_: number;

    // @Column()
    @ManyToOne(() => Customers, (cus) => cus.id)
    receiver_: number;

    // @Column()
    @ManyToOne(() => Conversations, (conver) => conver.id)
    conversation_: number;

    @Column({
        type: 'varchar',
    })
    content: string;

    @CreateDateColumn()
    created_at: Date;

    @UpdateDateColumn()
    updated_at: Date;

    @DeleteDateColumn()
    deleted_at: Date;
}
