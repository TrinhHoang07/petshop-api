import {
    Body,
    Controller,
    Post,
    Get,
    ValidationPipe,
    Request,
    UseGuards,
    Res,
    HttpStatus,
    BadRequestException,
} from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { AuthService } from './auth.service';
import { CustomersRegisterReqDto } from '../customers/dto/customers-register.req.dto';
import { Customers } from '../customers/customers.entity';
import { Response } from 'express';
import { CustomersService } from '../customers/customers.service';
import { AdminLoginReqDto } from '../admin/dto/admin-login.req.dto';
import { AdminService } from '../admin/admin.service';

@Controller()
export class AuthController {
    constructor(
        private authService: AuthService,
        private customerService: CustomersService,
        private adminService: AdminService,
    ) {}

    @UseGuards(AuthGuard('local'))
    @Post('/login')
    async login(@Request() req) {
        console.log(req.user);
        return await this.authService.genarateToken(req.user);
    }

    @Post('/admin/login')
    async loginAdmin(@Body(new ValidationPipe()) data: AdminLoginReqDto) {
        const admin = await this.adminService.getAdminByUsernameAndPassword(data.username, data.password);

        if (!admin) throw new BadRequestException();
        else {
            return {
                message: 'success',
                statusCode: 200,
                data: admin,
            };
        }
    }

    @Post('/register')
    async register(@Body(new ValidationPipe()) customerData: CustomersRegisterReqDto): Promise<Customers | any> {
        if (customerData.password !== customerData.confirm_password) {
            return {
                message: 'Password is not matches',
                status_code: HttpStatus.BAD_REQUEST,
            };
        }

        if ((await this.customerService.checkCustomer(customerData.name, customerData.email)) === false) {
            return {
                message: 'Name or Email already exist',
                status_code: HttpStatus.BAD_REQUEST,
            };
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
