import {
    Body,
    Controller,
    Post,
    Get,
    ValidationPipe,
    UsePipes,
    BadRequestException,
    Request,
    UseGuards,
} from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { CustomersSignupReqDto } from '../customers/dto/customers-signup.req.dto';
import { AuthService } from './auth.service';

@Controller()
export class AuthController {
    constructor(private authService: AuthService) {}

    @UseGuards(AuthGuard('local'))
    @Post('/login')
    async login(@Request() req) {
        console.log(req.user);
        return await this.authService.genarateToken(req.user);
    }

    @UseGuards(AuthGuard('jwt'))
    @Get('/test/jwt')
    async getProfile(@Request() req) {
        console.log('a', req.user);
        return req.user;
    }
}
