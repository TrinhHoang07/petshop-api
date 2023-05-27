import { Body, Controller, Get, HttpStatus, Post, Res, ValidationPipe } from '@nestjs/common';
import { CustomersService } from './customer.service';
import { Customers } from './customer.entity';
import { CustomerRegisterReqDto } from './dto/customer-register.req.dto';
import { Response } from 'express';

@Controller('customer')
export class CustomerController {
    constructor(private customerService: CustomersService) {}

    @Get('/all')
    async getAll(): Promise<Customers[]> {
        return await this.customerService.getAll();
    }

    @Post('/create')
    async register(
        @Body(new ValidationPipe()) customerData: CustomerRegisterReqDto,
        @Res({ passthrough: true }) res: Response,
    ): Promise<Customers | any> {
        if (customerData.password !== customerData.confirm_password) {
            return res.status(HttpStatus.BAD_REQUEST).json({
                message: 'Password is not matches',
                status_code: HttpStatus.BAD_REQUEST,
            });
        }

        if ((await this.customerService.checkCustomer(customerData.name, customerData.email)) === false) {
            return res.status(HttpStatus.BAD_REQUEST).json({
                message: 'Name or Email already exist',
                status_code: HttpStatus.BAD_REQUEST,
            });
        }

        return await this.customerService.register(customerData);
    }
}
