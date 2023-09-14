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
    // async getAllOrders(): Promise<Orders[]> {
    //     return await this.ordersService.createQueryBuilder('orders')
    //         .addSelect('product.name', 'product_name')
    //         .addSelect('product.price', 'product_price')
    //         .
    // }

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
}
