import { HttpStatus, Injectable } from '@nestjs/common';
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
    async addOrder(order: OrdersAddReqDto[]): Promise<Orders[]> {
        const arrOrder = [];
        if (order.length > 0) {
            order.forEach((item) => {
                const orderItem = new Orders();
                orderItem.product_ = item.product_id;
                orderItem.customer_ = item.customer_id;
                orderItem.price = item.price;
                orderItem.quantity = item.quantity;
                orderItem.status = item.status;

                arrOrder.push(orderItem);
            });
        }

        const orders = Orders.create(arrOrder);

        return await Orders.save(orders);
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

    // delete order by id
    async deleteOrderById(orderId: number): Promise<UpdateResult> {
        return await this.ordersService.softDelete(orderId);
    }

    // test API
    async testApi(year: number) {
        return {
            dataSetChart: [
                {
                    data: await this.ordersService
                        .createQueryBuilder('q')
                        .where(`MONTH(q.created_at) = 1 AND YEAR(q.created_at) = ${year}`)
                        .getRawMany(),
                },
                {
                    data: await this.ordersService
                        .createQueryBuilder('q')
                        .where(`MONTH(q.created_at) = 2 AND YEAR(q.created_at) = ${year}`)
                        .getRawMany(),
                },
                {
                    data: await this.ordersService
                        .createQueryBuilder('q')
                        .where(`MONTH(q.created_at) = 3 AND YEAR(q.created_at) = ${year}`)
                        .getRawMany(),
                },
                {
                    data: await this.ordersService
                        .createQueryBuilder('q')
                        .where(`MONTH(q.created_at) = 4 AND YEAR(q.created_at) = ${year}`)
                        .getRawMany(),
                },
                {
                    data: await this.ordersService
                        .createQueryBuilder('q')
                        .where(`MONTH(q.created_at) = 5 AND YEAR(q.created_at) = ${year}`)
                        .getRawMany(),
                },
                {
                    data: await this.ordersService
                        .createQueryBuilder('q')
                        .where(`MONTH(q.created_at) = 6 AND YEAR(q.created_at) = ${year}`)
                        .getRawMany(),
                },
                {
                    data: await this.ordersService
                        .createQueryBuilder('q')
                        .where(`MONTH(q.created_at) = 7 AND YEAR(q.created_at) = ${year}`)
                        .getRawMany(),
                },
                {
                    data: await this.ordersService
                        .createQueryBuilder('q')
                        .where(`MONTH(q.created_at) = 8 AND YEAR(q.created_at) = ${year}`)
                        .getRawMany(),
                },
                {
                    data: await this.ordersService
                        .createQueryBuilder('q')
                        .where(`MONTH(q.created_at) = 9 AND YEAR(q.created_at) = ${year}`)
                        .getRawMany(),
                },
                {
                    data: await this.ordersService
                        .createQueryBuilder('q')
                        .where(`MONTH(q.created_at) = 10 AND YEAR(q.created_at) = ${year}`)
                        .getRawMany(),
                },
                {
                    data: await this.ordersService
                        .createQueryBuilder('q')
                        .where(`MONTH(q.created_at) = 11 AND YEAR(q.created_at) = ${year}`)
                        .getRawMany(),
                },
                {
                    data: await this.ordersService
                        .createQueryBuilder('q')
                        .where(`MONTH(q.created_at) = 12 AND YEAR(q.created_at) = ${year}`)
                        .getRawMany(),
                },
            ],
            dataSetWeek: await this.ordersService
                .createQueryBuilder('q')
                .addSelect('product.name', 'product_name')
                .addSelect('product.description', 'product_description')
                .addSelect('product.price', 'product_price')
                .addSelect('product.preview_url', 'product_preview_url')
                .addSelect('product.type', 'product_type')
                .addSelect('product.rate', 'product_rate')
                .addSelect('product.color', 'product_color')
                .innerJoin('products', 'product', 'product.id=q.product_id')
                .where('YEARWEEK(q.created_at, 1) = YEARWEEK(CURDATE(), 1)')
                .getRawMany(),
            totalOrdersaToday: await this.ordersService
                .createQueryBuilder('q')
                .where('DATE(q.created_at) = CURDATE()')
                .getRawMany(),
        };
    }
}
