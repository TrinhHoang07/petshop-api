import { Controller, Get, Param, Res, HttpStatus, Query } from '@nestjs/common';
import { ProductsService } from './products.service';
import { Products } from './products.entity';
import { Response } from 'express';

@Controller('products')
export class ProductsController {
    constructor(private productsService: ProductsService) {}

    @Get('/all')
    async getAll(): Promise<Products[]> {
        return await this.productsService.getAll();
    }

    @Get('/products/home')
    async getProductsInHome(@Query() query: { limit: number; type: string }): Promise<Products[] | Object> {
        const data = await this.productsService.getProductLimit(query.limit, query.type);

        if (data) {
            return {
                message: 'success',
                statusCode: 200,
                data: data,
            };
        }

        return {
            message: 'Not Found',
            code: HttpStatus.BAD_REQUEST,
        };
    }

    @Get('/product/:id')
    async getProduct(@Param('id') id: string): Promise<Products | Object> {
        if (id) {
            const data = await this.productsService.getProductById(+id);

            if (data) {
                return {
                    message: 'success',
                    statusCode: 200,
                    data: {
                        name: data.name,
                        description: data.description,
                        sub_description: data.sub_description,
                        preview_url: data.preview_url,
                        type: data.type,
                        price: data.price,
                        quantity: data.quantity,
                        rate: data.rate,
                        color: data.color,
                    },
                };
            }

            return {
                message: 'Not Found',
                code: HttpStatus.BAD_REQUEST,
            };
        }

        return {
            message: 'Not Found Product',
            code: HttpStatus.BAD_REQUEST,
        };
    }
}
