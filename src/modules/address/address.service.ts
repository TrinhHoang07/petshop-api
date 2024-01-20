import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, UpdateResult } from 'typeorm';
import { Address } from './address.entity';
import { AddressCreateDto } from './dto/address-create.req.dto';
import { AddressUpdateDto } from './dto/address.update.req.dto';

@Injectable()
export class AddressService {
    constructor(@InjectRepository(Address) private addressEntity: Repository<Address>) {}

    // create a new address
    async createCustomer(data: AddressCreateDto): Promise<Address> {
        const address = new Address();
        address.full_name = data.full_name;
        address.customer_ = data.customer_id;
        address.phone_number = data.phone_number;
        address.main_address = data.main_address;
        address.detail_address = data.detail_address;
        address.type = data.type;

        return await this.addressEntity.save(address);
    }

    // get all customers
    async getAll(): Promise<Address[]> {
        return await this.addressEntity.find();
    }

    // get all address by customer id
    async getAddressByCustomerId(customerId: number): Promise<Address[]> {
        return await this.addressEntity
            .createQueryBuilder('address')
            .addSelect('address.id', 'id')
            .addSelect('address.full_name', 'full_name')
            .addSelect('address.customer_id', 'customer_id')
            .addSelect('address.phone_number', 'phone_number')
            .addSelect('address.main_address', 'main_address')
            .addSelect('address.detail_address', 'detail_address')
            .addSelect('address.type', 'type')
            .innerJoin('customers', 'cus', 'cus.id=address.customer_id')
            .where('address.customer_id=:id', { id: customerId })
            .getRawMany();
    }

    // update address by customer id
    async updateAddressById(id: number, data: AddressUpdateDto): Promise<UpdateResult> {
        return await this.addressEntity.update(id, {
            full_name: data.full_name,
            phone_number: data.phone_number,
            main_address: data.main_address,
            detail_address: data.detail_address,
            type: data.type,
        });
    }

    // delete address by id
    async deleteAddressById(id: number): Promise<UpdateResult> {
        return await this.addressEntity.softDelete(id);
    }
}
