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
import { Products } from '../products/products.entity';
import { Customers } from '../customers/customers.entity';

@Entity('orders')
export class Orders extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @ManyToOne(() => Products, (pro) => pro.id)
    product_: number;

    @ManyToOne(() => Customers, (cus) => cus.id)
    customer_: number;

    @Column({
        type: 'int',
    })
    quantity: number;

    @Column()
    price: number;

    @Column({
        type: 'nvarchar',
        default: 'processing',
    })
    status: string;

    @CreateDateColumn()
    created_at: Date;

    @UpdateDateColumn()
    updated_at: Date;

    @DeleteDateColumn()
    deleted_at: Date;
}
