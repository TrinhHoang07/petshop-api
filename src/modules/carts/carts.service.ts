import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Carts } from './carts.entity';
import { DeleteResult, Repository } from 'typeorm';
import { CartsAddReqDto } from './dto/carts-add.req.dto';

@Injectable()
export class CartsService {
    constructor(@InjectRepository(Carts) private cartService: Repository<Carts>) {}

    async getAll(): Promise<Carts[]> {
        return await this.cartService
            .createQueryBuilder('carts')
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
            .innerJoin('products', 'product', 'product.id=carts.product_id')
            .innerJoin('customers', 'customer', 'customer.id=carts.customer_id')
            .getRawMany();
    }

    async createCart(data: CartsAddReqDto): Promise<Carts> {
        const cart = new Carts();
        cart.customer_id = data.customer_id;
        cart.product_id = data.product_id;
        cart.quantity = data.quantity;

        return cart.save();
    }

    async deleteById(id: number): Promise<DeleteResult> {
        return await this.cartService.delete(id);
    }
}
