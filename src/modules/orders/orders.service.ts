import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, UpdateResult } from 'typeorm';
import { Orders } from './orders.entity';
import { OrdersUpdateStatusReqDto } from './dto/orders-update-status.req.dto';
import { OrdersAddReqDto } from './dto/orders-add.req.dto';

@Injectable()
export class OrdersService {
    constructor(@InjectRepository(Orders) private ordersService: Repository<Orders>) {}

    // get all orders
    async getAllOrders(): Promise<Orders[]> {
        return await this.ordersService
            .createQueryBuilder('orders')
            .addSelect('product.name', 'product_name')
            .addSelect('product.description', 'product_description')
            .addSelect('product.price', 'product_price')
            .addSelect('product.preview_url', 'product_preview_url')
            .addSelect('product.type', 'product_type')
            .addSelect('product.rate', 'product_rate')
            .addSelect('product.color', 'product_color')
            .addSelect('customer.name', 'customer_name')
            .addSelect('customer.address', 'customer_address')
            .addSelect('customer.phone_number', 'customer_phone_number')
            .addSelect('customer.birth_date', 'customer_birth_date')
            .addSelect('customer.avatar_path', 'customer_avatar_path')
            .addSelect('customer.gender', 'customer_gender')
            .innerJoin('products', 'product', 'product.id=orders.product_id')
            .innerJoin('customers', 'customer', 'customer.id=orders.customer_id')
            .getRawMany();
    }

    // add new orders (customers)
    async addOrder(order: OrdersAddReqDto): Promise<Orders> {
        const newOrder = new Orders();
        newOrder.product_ = order.product_id;
        newOrder.customer_ = order.customer_id;
        newOrder.price = order.price;
        newOrder.quantity = order.quantity;
        newOrder.status = order.status;

        return await this.ordersService.save(newOrder);
    }

    // update status (admin, shiper)
    async updateStatus(id: number, data: OrdersUpdateStatusReqDto): Promise<UpdateResult> {
        return await this.ordersService.update(id, data);
    }

    // get orders by customer_id
    async getOrdersByCustomerId(customerId: number): Promise<Orders[]> {
        return await this.ordersService
            .createQueryBuilder('orders')
            .addSelect('product.name', 'product_name')
            .addSelect('product.description', 'product_description')
            .addSelect('product.price', 'product_price')
            .addSelect('product.preview_url', 'product_preview_url')
            .addSelect('product.type', 'product_type')
            .addSelect('product.rate', 'product_rate')
            .addSelect('product.color', 'product_color')
            .addSelect('customer.name', 'customer_name')
            .addSelect('customer.address', 'customer_address')
            .addSelect('customer.phone_number', 'customer_phone_number')
            .addSelect('customer.birth_date', 'customer_birth_date')
            .addSelect('customer.avatar_path', 'customer_avatar_path')
            .addSelect('customer.gender', 'customer_gender')
            .innerJoin('products', 'product', 'product.id=orders.product_id')
            .innerJoin('customers', 'customer', 'customer.id=orders.customer_id')
            .where(`orders.customer_id=${customerId}`)
            .getRawMany();
    }
}
