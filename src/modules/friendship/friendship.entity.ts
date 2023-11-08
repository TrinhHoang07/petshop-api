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

@Entity('friendship')
export class Friendship extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @ManyToOne(() => Customers, (cus) => cus.id)
    customer_1_: number;

    @ManyToOne(() => Customers, (cus) => cus.id)
    customer_2_: number;

    @Column({
        type: 'nvarchar',
    })
    status: string;

    @CreateDateColumn()
    created_at: Date;

    @UpdateDateColumn()
    updated_at: Date;

    @DeleteDateColumn()
    deleted_at: Date;
}
