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
    Param,
} from '@nestjs/common';
import { CartsService } from './carts.service';
import { Carts } from './carts.entity';
import { CartsAddReqDto } from './dto/carts-add.req.dto';
import { DeleteResult } from 'typeorm';
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
    @Delete('/delete-cart/:id')
    @UsePipes(new ValidationPipe())
    async deleteToCart(@Param('id') id: string, @Res() res: Response): Promise<DeleteResult | Object> {
        if (id) {
            const result = await this.cartsService.deleteById(+id);

            if (result.affected === 1) {
                return res.status(HttpStatus.OK).json({
                    message: 'success',
                    code: HttpStatus.OK,
                });
            }
        }

        return res.status(HttpStatus.BAD_REQUEST).json({
            message: 'Error delete to cart',
            code: HttpStatus.BAD_REQUEST,
        });
    }
}
