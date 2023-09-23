import { Controller, UseGuards, UsePipes, ValidationPipe, Post, HttpStatus, Body, Get, Param } from '@nestjs/common';
import { OrdersService } from './orders.service';
import { AuthGuard } from '@nestjs/passport';
import { OrdersAddReqDto } from './dto/orders-add.req.dto';

@Controller('orders')
export class OrdersController {
    constructor(private ordersService: OrdersService) {}

    @UseGuards(AuthGuard('jwt'))
    @Post('/create')
    @UsePipes(new ValidationPipe())
    async createOrder(@Body() data: OrdersAddReqDto): Promise<Object> {
        const result = await this.ordersService.addOrder(data);

        if (result) {
            return {
                message: 'success',
                statusCode: HttpStatus.CREATED,
                data: result,
            };
        } else {
            return {
                message: 'error',
                statusCode: HttpStatus.BAD_REQUEST,
            };
        }
    }

    @UseGuards(AuthGuard('jwt'))
    @Get('/get-order-id/:id')
    @UsePipes(new ValidationPipe())
    async getOrderByCustomerId(@Param('id') id: string): Promise<Object> {
        const result = await this.ordersService.getOrdersByCustomerId(+id);

        if (result) {
            return {
                message: 'success',
                statusCode: HttpStatus.OK,
                data: result,
            };
        } else {
            return {
                message: 'error',
                statusCode: HttpStatus.BAD_REQUEST,
            };
        }
    }
}
