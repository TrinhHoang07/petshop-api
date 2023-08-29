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

@Entity('chats')
export class Chats extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    @ManyToOne(() => Customers, (cus) => cus.id)
    customer_: number;

    @Column({
        type: 'varchar',
        nullable: true,
    })
    message_emit: string;

    @Column({
        type: 'varchar',
        nullable: true,
    })
    message_on: string;

    @CreateDateColumn()
    created_at: Date;

    @UpdateDateColumn()
    updated_at: Date;

    @DeleteDateColumn()
    deleted_at: Date;
}
