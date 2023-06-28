import { Controller, Get, Param, Res, HttpStatus } from '@nestjs/common';
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

    @Get('/product/:id')
    async getProduct(@Param('id') id: string, @Res({ passthrough: true }) res: Response): Promise<Products | Object> {
        if (id) {
            const data = await this.productsService.getProductById(+id);

            if (data) return data;

            return res.status(HttpStatus.BAD_REQUEST).json({
                message: 'Not Found',
                code: HttpStatus.BAD_REQUEST,
            });
        }

        return res.status(HttpStatus.BAD_REQUEST).json({
            message: 'Not Found Product',
            code: HttpStatus.BAD_REQUEST,
        });
    }
}
