import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Admin } from './admin.entity';
import { Repository } from 'typeorm';
import { AdminRegisterReqDto } from './dto/admin-register.req.dto';

@Injectable()
export class AdminService {
    constructor(@InjectRepository(Admin) private adminEntity: Repository<Admin>) {}

    async register(adminRegister: AdminRegisterReqDto): Promise<Admin> {
        const admin = new Admin();
        admin.name = adminRegister.name;
        admin.email = adminRegister.email;
        admin.password = adminRegister.password;

        return admin.save();
    }

    async getAllAdmin(): Promise<Admin[]> {
        return await this.adminEntity.find();
    }

    async getAdminByUsernameAndPassword(username: string, password: string) {
        return await this.adminEntity.findOneBy({
            name: username,
            password: password,
        });
    }
}
