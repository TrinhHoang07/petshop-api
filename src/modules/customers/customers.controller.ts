import { Body, Controller, HttpStatus, Res, ValidationPipe, Put, Param, Get, UseGuards } from '@nestjs/common';
import { CustomersService } from './customers.service';
import { Response } from 'express';
import { CustomersReqDto } from './dto/customers.req.dto';
import { UpdateResult } from 'typeorm';
import { Customers } from './customers.entity';
import { AuthGuard } from '@nestjs/passport';

@Controller('customers')
export class CustomersController {
    constructor(private customerService: CustomersService) {}

    @UseGuards(AuthGuard('jwt'))
    @Get('/customer/:id')
    async getCustomerById(
        @Param('id') id: string,
        @Res({ passthrough: true }) res: Response,
    ): Promise<Customers | Object> {
        if (id) {
            const data = await this.customerService.getCustomerById(+id);

            if (data) {
                return data;
            } else {
                return res.status(HttpStatus.BAD_REQUEST).json({
                    message: 'Not Found',
                    code: HttpStatus.BAD_REQUEST,
                });
            }
        }

        return res.status(HttpStatus.BAD_REQUEST).json({
            message: 'Not Found Customer',
            code: HttpStatus.BAD_REQUEST,
        });
    }

    @UseGuards(AuthGuard('jwt'))
    @Put('/update/:id')
    async updateCustomerById(
        @Param('id') id: string,
        @Body(new ValidationPipe()) data: CustomersReqDto,
        @Res() res: Response,
    ): Promise<UpdateResult | Object> {
        if (id) {
            const isUpdated = await this.customerService.updateCustomerById(+id, data);

            if (isUpdated.affected === 1) {
                return res.status(HttpStatus.OK).json({
                    message: 'success',
                    code: HttpStatus.OK,
                });
            }
        }

        return res.status(HttpStatus.BAD_REQUEST).json({
            message: 'Not Found Customer',
            code: HttpStatus.BAD_REQUEST,
        });
    }
}
