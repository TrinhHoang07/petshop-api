import { Strategy } from 'passport-local';
import { PassportStrategy } from '@nestjs/passport';
import { Injectable, UnauthorizedException } from '@nestjs/common';
import { AuthService } from './auth.service';
import { Customers } from '../customers/customers.entity';

@Injectable()
export class LocalStrategy extends PassportStrategy(Strategy) {
    constructor(private authService: AuthService) {
        super();
    }

    async validate(username: string, password: string): Promise<Customers> {
        const customer = await this.authService.login(username, password);

        if (!customer) {
            throw new UnauthorizedException();
        }
        return customer;
    }
}
