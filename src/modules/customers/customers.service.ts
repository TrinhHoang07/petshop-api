import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Customers } from './customers.entity';
import { Repository, UpdateResult } from 'typeorm';
import { CustomersRegisterReqDto } from './dto/customers-register.req.dto';
import { CustomersReqDto } from './dto/customers.req.dto';
import { CustomerCreateDto } from './dto/customer-create.req.dto';
import { CustomersAddressReqDto } from './dto/customers-address.req.dto';
import { CustomersPasswordReqDto } from './dto/customers-password.req.dto';
import { CustomersAvatarReqDto } from './dto/customers-avatar.req.dto';

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

    async createCustomer(data: CustomerCreateDto): Promise<Customers> {
        const customer = new Customers();
        customer.name = data.name;
        customer.password = data.password;
        customer.email = data.email;
        customer.gender = data.gender;
        customer.birth_date = data.birth_date;
        customer.avatar_path = data.avatar_path;
        customer.address = data.address;
        customer.phone_number = data.phone_number;

        return await this.customerEntity.save(customer);
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

    // search products
    async searchCustomers(query: { search: string }): Promise<Customers[]> {
        console.log('service: ', query);

        const data = await this.customerEntity
            .createQueryBuilder('customers')
            .where('customers.name like :name', { name: '%' + query.search + '%' })
            .getMany();

        return data;
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

    // get custoemr by id & password
    async getCustomerByIdAndPassword(id: number, password: string): Promise<Customers> {
        return await this.customerEntity.findOneBy({
            id: id,
            password: password,
        });
    }

    // update customer by id
    async updateCustomerById(id: number, data: CustomersReqDto): Promise<UpdateResult> {
        return await this.customerEntity.update(id, data);
    }

    // update avatar customer by id
    async updateAvatarCustomer(id: number, data: CustomersAvatarReqDto): Promise<UpdateResult> {
        return await this.customerEntity.update(id, {
            avatar_path: data.avatar_path,
        });
    }

    // update address customer by id
    async updateAddressCustomer(id: number, data: CustomersAddressReqDto): Promise<UpdateResult> {
        return await this.customerEntity.update(id, {
            address: data.address,
        });
    }

    // update password customer by id
    async updatePasswordCustomer(id: number, data: CustomersPasswordReqDto): Promise<UpdateResult> {
        return await this.customerEntity.update(id, {
            password: data.password,
        });
    }

    // delete customer by id
    async deleteCustomerById(id: number): Promise<UpdateResult> {
        return await this.customerEntity.softDelete(id);
    }

    // validate customer
    async checkCustomer(name: string, email: string): Promise<boolean> {
        const a = await this.customerEntity.findOneBy({
            email: email,
        });
        const b = await this.customerEntity.findOneBy({
            name: name,
        });

        if (a || b) {
            return false;
        }

        return true;
    }
}
