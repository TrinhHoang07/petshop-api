import { Controller, Get, Param, HttpStatus, Query } from '@nestjs/common';
import { ProductsService } from './products.service';
import { Products } from './products.entity';

@Controller('products')
export class ProductsController {
    constructor(private productsService: ProductsService) {}

    // get all products
    @Get('/all')
    async getAll(): Promise<Products[] | Object> {
        const data = await this.productsService.getAll();

        return {
            message: 'success',
            statusCode: 200,
            data: data,
        };
    }

    // search products
    @Get('/search')
    async searchProducts(@Query() query: { query: string }) {
        console.log('query OKOKOK', query);

        return await this.productsService.searchProducts(JSON.parse(atob(query.query as string)));
    }

    // random products
    @Get('/random')
    async randomProducts(@Query() query: { limit: number }) {
        return await this.productsService.randomProducts(query.limit);
    }

    // get products from homepage
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

    // get product by ID
    @Get('/product/:id')
    async getProduct(@Param('id') id: string): Promise<Products | Object> {
        if (id) {
            const data = await this.productsService.getProductById(+id);

            if (data) {
                return {
                    message: 'success',
                    statusCode: 200,
                    data: {
                        id: data.id,
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
