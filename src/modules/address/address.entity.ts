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

@Entity('address')
export class Address extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;

    // @Column()
    @ManyToOne(() => Customers, (cus) => cus.id)
    customer_: number;

    @Column()
    full_name: string;

    @Column()
    phone_number: string;

    @Column()
    main_address: string;

    @Column()
    detail_address: string;

    @Column()
    type: string;

    @CreateDateColumn()
    created_at: string;

    @UpdateDateColumn()
    updated_at: string;

    @DeleteDateColumn()
    deleted_at: string;
}
