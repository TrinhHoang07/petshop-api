import { Controller, Get, Param } from '@nestjs/common';
import { ProductsService } from './products.service';
import { Products } from './products.entity';

@Controller('products')
export class ProductsController {
    constructor(private productsService: ProductsService) {}

    @Get('/all')
    async getAll(): Promise<Products[]> {
        return await this.productsService.getAll();
    }

    @Get('/product/:id')
    async getProduct(@Param('id') id: string): Promise<Products> {
        return await this.productsService.getProductById(+id);
    }
}
