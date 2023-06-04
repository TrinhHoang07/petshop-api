import { Body, Controller, Post, Get, ValidationPipe, Request, UseGuards, Res, HttpStatus } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { AuthService } from './auth.service';
import { CustomersRegisterReqDto } from '../customers/dto/customers-register.req.dto';
import { Customers } from '../customers/customers.entity';
import { Response } from 'express';
import { CustomersService } from '../customers/customers.service';

@Controller()
export class AuthController {
    constructor(private authService: AuthService, private customerService: CustomersService) {}

    @UseGuards(AuthGuard('local'))
    @Post('/login')
    async login(@Request() req) {
        console.log(req.user);
        return await this.authService.genarateToken(req.user);
    }

    @Post('/register')
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

        const customer = await this.customerService.register(customerData);

        return await this.authService.genarateToken(customer);
    }

    @UseGuards(AuthGuard('jwt'))
    @Get('/test/jwt')
    async getProfile(@Request() req) {
        console.log('a', req.user);
        return req.user;
    }
}
