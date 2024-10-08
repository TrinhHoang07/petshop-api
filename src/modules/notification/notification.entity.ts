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
import { Admin } from '../admin/admin.entity';

@Entity('notifications')
export class Notification extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @ManyToOne(() => Customers, (cus) => cus.id)
    customer_: number;

    @Column({
        nullable: true,
        type: 'varchar',
    })
    type: string;

    @Column()
    content: string;

    @Column()
    avatar_path: string;

    @Column({
        default: false,
    })
    seen: boolean;

    @CreateDateColumn({
        type: 'timestamp',
    })
    created_at: Date;

    @UpdateDateColumn()
    updated_at: Date;

    @DeleteDateColumn()
    deleted_at: Date;
}
