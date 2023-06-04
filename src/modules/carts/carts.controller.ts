import {
    Controller,
    Get,
    Post,
    Body,
    UsePipes,
    ValidationPipe,
    Delete,
    Res,
    HttpStatus,
    UseGuards,
} from '@nestjs/common';
import { CartsService } from './carts.service';
import { Carts } from './carts.entity';
import { CartsAddReqDto } from './dto/carts-add.req.dto';
import { DeleteResult } from 'typeorm';
import { CartsDeleteReqDto } from './dto/carts-delete.req.dto';
import { Response } from 'express';
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
    @Post('/add-to-cart')
    @UsePipes(new ValidationPipe())
    async addToCart(@Body() data: CartsAddReqDto): Promise<Carts> {
        return await this.cartsService.createCart(data);
    }

    @UseGuards(AuthGuard('jwt'))
    @Delete('/delete-cart')
    @UsePipes(new ValidationPipe())
    async deleteToCart(@Body() data: CartsDeleteReqDto, @Res() res: Response): Promise<DeleteResult | Object> {
        const result = await this.cartsService.deleteById(data.id);

        if (result.affected === 0) {
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
