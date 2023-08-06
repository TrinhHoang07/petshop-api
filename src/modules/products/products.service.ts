import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Products } from './products.entity';
import { Repository, UpdateResult } from 'typeorm';
import { ProductsReqDto } from './dto/products.req.dto';

@Injectable()
export class ProductsService {
    constructor(@InjectRepository(Products) private productsService: Repository<Products>) {}

    // get all products
    async getAll(): Promise<Products[]> {
        return await this.productsService.find();
    }

    // create a new product
    async addProduct(data: ProductsReqDto) {
        const product = new Products();
        product.name = data.name;
        product.description = data.description;
        product.sub_description = data.sub_description;
        product.color = data.color;
        product.rate = data.rate;
        product.quantity = data.quantity;
        product.price = data.price;
        product.preview_url = data.preview_url;
        product.type = data.type;

        return await product.save();
    }

    async getProductById(id: number): Promise<Products> {
        return await this.productsService.findOneBy({
            id: id,
        });
    }

    async getProductLimit(limit: number, type: string): Promise<Products[]> {
        return await this.productsService.find({
            where: {
                type: type,
            },
            take: limit,
        });
    }

    // update product by id
    async updateProductById(id: number, data: ProductsReqDto): Promise<UpdateResult> {
        return await this.productsService.update(id, data);
    }

    // delete product by id
    async deleteProductById(id: number): Promise<UpdateResult> {
        return await this.productsService.softDelete({
            id: id,
        });
    }
}
