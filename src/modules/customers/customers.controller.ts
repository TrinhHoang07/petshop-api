import { Body, Controller, Delete, Get, HttpStatus, Param, Post, Put, Res, ValidationPipe } from '@nestjs/common';
import { CustomersService } from './customers.service';
import { Customers } from './customers.entity';
import { CustomersRegisterReqDto } from './dto/customers-register.req.dto';
import { Response } from 'express';
import { CustomersReqDto } from './dto/customers.req.dto';
import { UpdateResult } from 'typeorm';

@Controller('customers')
export class CustomersController {
    constructor(private customerService: CustomersService) {}

    @Get('/all')
    async getAll(): Promise<Customers[]> {
        return await this.customerService.getAll();
    }

    @Post('/create')
    async register(
        @Body(new ValidationPipe()) customerData: CustomersRegisterReqDto,
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

    @Put('/update/:id')
    async updateCustomerById(
        @Param('id') id: string,
        @Body(new ValidationPipe()) data: CustomersReqDto,
        @Res() res: Response,
    ): Promise<UpdateResult | Object> {
        const isUpdated = await this.customerService.updateCustomerById(+id, data);

        if (isUpdated.affected === 0) {
            return res.status(HttpStatus.BAD_REQUEST).json({
                message: 'Error updating customer',
                code: HttpStatus.BAD_REQUEST,
            });
        }

        return res.status(HttpStatus.OK).json({
            message: 'success',
            code: HttpStatus.OK,
        });
    }

    @Delete('/delete/:id')
    async deleteCustomerById(@Param('id') id: string, @Res() res: Response): Promise<UpdateResult | Object> {
        const isDeleted = await this.customerService.deleteCustomerById(+id);

        if (isDeleted.affected === 0) {
            return res.status(HttpStatus.BAD_REQUEST).json({
                message: 'Error deleting customer',
                code: HttpStatus.BAD_REQUEST,
            });
        }

        return res.status(HttpStatus.OK).json({
            message: 'Success',
            code: HttpStatus.OK,
        });
    }
}
