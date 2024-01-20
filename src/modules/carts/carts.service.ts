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

    async getProductsCartsById(id: number) {
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
            .where(`carts.customer_id=${id}`)
            .getRawMany();
    }

    async createCart(data: CartsAddReqDto): Promise<Carts> {
        const isValid: { isHas: boolean } = await this.getProductInCartByProductId(data.product_id, data.customer_id);

        if (isValid.isHas) {
            const cart = new Carts();
            cart.customer_ = data.customer_id;
            cart.product_ = data.product_id;
            cart.quantity = data.quantity;

            return await this.cartService.save(cart);
        } else {
            return null;
        }
    }

    async getProductInCartByProductId(productId: number, customerId: number): Promise<any> {
        const product = await this.cartService
            .createQueryBuilder('carts')
            .addSelect('product.name', 'product_name')
            .addSelect('customer.name', 'customer_name')
            .innerJoin('products', 'product', 'product.id=carts.product_id')
            .innerJoin('customers', 'customer', 'customer.id=carts.customer_id')
            .where(`carts.customer_id=${customerId}`)
            .andWhere(`carts.product_id=${productId}`)
            .getOne();

        if (product) {
            return {
                isHas: false,
            };
        } else {
            return {
                isHas: true,
            };
        }
    }

    async deleteById(id: number): Promise<DeleteResult> {
        return await this.cartService.softDelete(id);
    }
}
