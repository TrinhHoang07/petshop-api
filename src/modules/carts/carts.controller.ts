import {
    Controller,
    Get,
    Post,
    Body,
    UsePipes,
    ValidationPipe,
    Delete,
    HttpStatus,
    UseGuards,
    Param,
} from '@nestjs/common';
import { CartsService } from './carts.service';
import { Carts } from './carts.entity';
import { CartsAddReqDto } from './dto/carts-add.req.dto';
import { DeleteResult } from 'typeorm';
import { AuthGuard } from '@nestjs/passport';

@Controller('carts')
export class CartsController {
    constructor(private cartsService: CartsService) {}

    @UseGuards(AuthGuard('jwt'))
    @Get('/all')
    async getAll(): Promise<Carts[]> {
        return await this.cartsService.getAll();
    }

    @UseGuards(AuthGuard('jwt'))
    @Get('/cart-by-customer/:id')
    @UsePipes(new ValidationPipe())
    async getProductsCartsByCustomer(@Param('id') id: string) {
        const product = await this.cartsService.getProductsCartsById(+id);

        if (product) {
            return {
                message: 'success',
                statusCode: 200,
                data: product,
            };
        } else {
            return {
                message: 'Error get products in cart',
                code: HttpStatus.BAD_REQUEST,
            };
        }
    }

    @UseGuards(AuthGuard('jwt'))
    @Post('/add-to-cart')
    @UsePipes(new ValidationPipe())
    async addToCart(@Body() data: CartsAddReqDto): Promise<Carts | Object> {
        const newCart = await this.cartsService.createCart(data);

        if (newCart) {
            return {
                message: 'success',
                statusCode: 200,
                data: newCart,
            };
        } else {
            return {
                message: 'Error',
                statusCode: HttpStatus.BAD_REQUEST,
            };
        }
    }

    @UseGuards(AuthGuard('jwt'))
    @Delete('/delete-cart/:id')
    @UsePipes(new ValidationPipe())
    async deleteToCart(@Param('id') id: string): Promise<DeleteResult | Object> {
        if (id) {
            const result = await this.cartsService.deleteById(+id);

            if (result.affected !== 0) {
                return {
                    message: 'success',
                    code: HttpStatus.OK,
                };
            }
        }

        return {
            message: 'Error delete to cart',
            code: HttpStatus.BAD_REQUEST,
        };
    }
}
