import { Controller, Post, Body, Get, ValidationPipe } from '@nestjs/common';
import { AdminService } from './admin.service';
import { AdminRegisterReqDto } from './dto/admin-register.req.dto';
import { Admin } from './admin.entity';

@Controller('admin')
export class AdminController {
    constructor(private adminService: AdminService) {}

    @Get('/all')
    async getAllAdmin(): Promise<Admin[]> {
        return await this.adminService.getAllAdmin();
    }

    @Post('/create')
    async register(@Body(new ValidationPipe()) adminRegister: AdminRegisterReqDto): Promise<Admin> {
        return await this.adminService.register(adminRegister);
    }
}
