import {
    BaseEntity,
    Column,
    CreateDateColumn,
    DeleteDateColumn,
    Entity,
    PrimaryGeneratedColumn,
    UpdateDateColumn,
} from 'typeorm';

@Entity('chats')
export class Chats extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    customer_id: number;

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
