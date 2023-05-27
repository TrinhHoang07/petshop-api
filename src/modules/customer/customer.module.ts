import { Module } from '@nestjs/common';
import { CustomerController } from './customer.controller';
import { CustomersService } from './customer.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Customers } from './customer.entity';

@Module({
    controllers: [CustomerController],
    imports: [TypeOrmModule.forFeature([Customers])],
    exports: [CustomersService],
    providers: [CustomersService],
})
export class CustomerModule {}
