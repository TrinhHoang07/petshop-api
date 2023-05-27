import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Customers } from './customer.entity';
import { Repository } from 'typeorm';
import { CustomerRegisterReqDto } from './dto/customer-register.req.dto';

@Injectable()
export class CustomersService {
    constructor(@InjectRepository(Customers) private customerEntity: Repository<Customers>) {}

    async register(customerData: CustomerRegisterReqDto): Promise<Customers> {
        const customer = new Customers();
        customer.name = customerData.name;
        customer.email = customerData.email;
        customer.password = customerData.password;

        return customer.save();
    }

    async getAll(): Promise<Customers[]> {
        return await this.customerEntity.find();
    }

    async checkCustomer(name: string, email: string): Promise<boolean> {
        const a = await this.customerEntity.findBy({
            name: name,
            email: email,
        });

        if (a.length > 0) {
            return false;
        }

        return true;
    }
}
