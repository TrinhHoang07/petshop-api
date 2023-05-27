import { Body, Controller, Delete, Get, HttpStatus, Param, Post, Put, Res, ValidationPipe } from '@nestjs/common';
import { ProductsService } from './products.service';
import { Products } from './products.entity';
import { ProductsReqDto } from './dto/products.req.dto';
import { UpdateResult } from 'typeorm';
import { Response } from 'express';
import { json } from 'stream/consumers';

@Controller('products')
export class ProductsController {
    constructor(private productsService: ProductsService) {}

    @Get('/all')
    async getAll(): Promise<Products[]> {
        return await this.productsService.getAll();
    }

    @Post('/create')
    async addProduct(@Body(new ValidationPipe()) data: ProductsReqDto): Promise<Products> {
        return await this.productsService.addProduct(data);
    }

    @Put('/update/:id')
    async updateProductById(
        @Param('id') id: string,
        @Body(new ValidationPipe()) data: ProductsReqDto,
        @Res() res: Response,
    ): Promise<UpdateResult | Object> {
        const isUpdated = await this.productsService.updateProductById(+id, data);

        if (isUpdated.affected === 0) {
            return res.status(HttpStatus.BAD_REQUEST).json({
                message: 'Error updating product',
                code: HttpStatus.BAD_REQUEST,
            });
        }

        return res.status(HttpStatus.OK).json({
            message: 'Success',
            code: HttpStatus.OK,
        });
    }

    @Delete('/delete/:id')
    async deleteProductById(@Param('id') id: string, @Res() res: Response): Promise<UpdateResult | Object> {
        const isDeleted = await this.productsService.deleteProductById(+id);

        if (isDeleted.affected === 0) {
            return res.status(HttpStatus.BAD_REQUEST).json({
                message: 'Error deleting product',
                code: HttpStatus.BAD_REQUEST,
            });
        }

        return res.status(HttpStatus.OK).json({
            message: 'Success',
            code: HttpStatus.OK,
        });
    }
}
