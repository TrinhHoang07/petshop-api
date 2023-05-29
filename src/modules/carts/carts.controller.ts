import { Controller, Get, Post, Body, UsePipes, ValidationPipe } from '@nestjs/common';
import { CartsService } from './carts.service';
import { Carts } from './carts.entity';
import { CartsAddReqDto } from './dto/carts-add.req.dto';

@Controller('carts')
export class CartsController {
    constructor(private cartsService: CartsService) {}

    @Get('/all')
    async getAll(): Promise<Carts[]> {
        return await this.cartsService.getAll();
    }

    @Post('/add-to-cart')
    @UsePipes(new ValidationPipe())
    async addToCart(@Body() data: CartsAddReqDto): Promise<Carts> {
        return await this.cartsService.createCart(data);
    }
}
