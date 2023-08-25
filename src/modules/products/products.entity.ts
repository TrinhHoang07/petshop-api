import {
    BaseEntity,
    Column,
    CreateDateColumn,
    DeleteDateColumn,
    Entity,
    PrimaryGeneratedColumn,
    UpdateDateColumn,
} from 'typeorm';

@Entity('products')
export class Products extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({
        type: 'varchar',
    })
    name: string;

    @Column({
        type: 'text',
        nullable: true,
    })
    description: string;

    @Column({
        type: 'text',
        nullable: true,
    })
    sub_description: string;

    @Column({
        type: 'varchar',
    })
    type: string;

    @Column({
        type: 'int',
    })
    price: number;

    @Column({
        type: 'int',
    })
    quantity: number;

    @Column({
        type: 'int',
        nullable: true,
    })
    rate: number;

    @Column({
        type: 'varchar',
        nullable: true,
    })
    color: string;

    @Column({
        type: 'varchar',
    })
    preview_url: string;

    @CreateDateColumn()
    created_at: Date;

    @UpdateDateColumn()
    updated_at: Date;

    @DeleteDateColumn()
    deleted_at: Date;
}
