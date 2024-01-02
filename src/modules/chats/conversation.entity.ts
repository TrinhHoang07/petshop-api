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

@Entity('conversations')
export class Conversations extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({
        type: 'varchar',
        nullable: true,
    })
    conversation_name: string;

    @Column({
        type: 'varchar',
        default: 'personal',
    })
    conversation_type: string;

    @ManyToOne(() => Customers, (cus) => cus.id)
    created_by_customer_: number;

    @CreateDateColumn()
    created_at: Date;

    @UpdateDateColumn()
    updated_at: Date;

    @DeleteDateColumn()
    deleted_at: Date;
}
