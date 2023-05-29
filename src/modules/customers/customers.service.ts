import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Customers } from './customers.entity';
import { Repository, UpdateResult } from 'typeorm';
import { CustomersRegisterReqDto } from './dto/customers-register.req.dto';
import { CustomersReqDto } from './dto/customers.req.dto';

@Injectable()
export class CustomersService {
    constructor(@InjectRepository(Customers) private customerEntity: Repository<Customers>) {}

    // register customer
    async register(customerData: CustomersRegisterReqDto): Promise<Customers> {
        const customer = new Customers();
        customer.name = customerData.name;
        customer.email = customerData.email;
        customer.password = customerData.password;

        return customer.save();
    }

    // get all customers
    async getAll(): Promise<Customers[]> {
        return await this.customerEntity.find();
    }

    // get customer by id
    async getCustomerById(id: number): Promise<Customers> {
        return await this.customerEntity.findOneBy({
            id: id,
        });
    }

    // get customer by username and password
    async getCustomerByUsernameAndPassword(username: string, password: string) {
        console.log(username);
        console.log(password);

        return await this.customerEntity.findOneBy({
            name: username,
            password: password,
        });
    }

    // update customer by id
    async updateCustomerById(id: number, data: CustomersReqDto): Promise<UpdateResult> {
        return await this.customerEntity.update(id, data);
    }

    // delete customer by id
    async deleteCustomerById(id: number): Promise<UpdateResult> {
        return await this.customerEntity.softDelete(id);
    }

    // validate customer
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
