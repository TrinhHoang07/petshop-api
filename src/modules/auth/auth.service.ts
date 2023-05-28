import { Injectable, BadRequestException } from '@nestjs/common';
import { CustomersService } from '../customers/customers.service';
import { Customers } from '../customers/customers.entity';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class AuthService {
    constructor(private customersService: CustomersService, private jwtService: JwtService) {}

    async login(userName: string, password: string) {
        const customer = await this.customersService.getCustomerByUsernameAndPassword(userName, password);

        if (!customer) throw new BadRequestException();

        return customer;
    }

    async genarateToken(customer: Customers) {
        return {
            name: customer.name,
            email: customer.email,
            phone_number: customer.phone_number,
            gender: customer.gender,
            address: customer.address,
            access_token: this.jwtService.sign({
                name: customer.name,
                email: customer.email,
                sub: 'h07',
            }),
        };
    }
}
