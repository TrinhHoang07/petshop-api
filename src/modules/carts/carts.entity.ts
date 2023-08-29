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
import { Products } from '../products/products.entity';

@Entity('carts')
export class Carts extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;

    // @Column()
    @ManyToOne(() => Customers, (cus) => cus.id)
    customer_: number;

    // @Column()
    @ManyToOne(() => Products, (pro) => pro.id)
    product_: number;

    @Column({
        type: 'int',
        default: 1,
    })
    quantity: number;

    @CreateDateColumn()
    created_at: Date;

    @UpdateDateColumn()
    updated_at: Date;

    @DeleteDateColumn()
    deleted_at: Date;
}
