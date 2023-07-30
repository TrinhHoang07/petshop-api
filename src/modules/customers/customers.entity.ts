import {
    BaseEntity,
    Column,
    CreateDateColumn,
    DeleteDateColumn,
    Entity,
    PrimaryGeneratedColumn,
    UpdateDateColumn,
} from 'typeorm';

@Entity('customers')
export class Customers extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({
        type: 'varchar',
    })
    name: string;

    @Column({
        type: 'varchar',
    })
    email: string;

    @Column({
        type: 'varchar',
        select: false,
    })
    password: string;

    @Column({
        type: 'varchar',
        nullable: true,
    })
    address: string;

    @Column({
        type: 'varchar',
        nullable: true,
    })
    phone_number: string;

    @Column({
        nullable: true,
        type: 'varchar',
    })
    gender: string;

    @Column({
        nullable: true,
        type: 'varchar',
    })
    birth_date: string;

    @Column({
        type: 'varchar',
        nullable: true,
    })
    avatar_path: string;

    @CreateDateColumn()
    created_at: string;

    @UpdateDateColumn()
    updated_at: string;

    @DeleteDateColumn()
    deleted_at: string;
}
