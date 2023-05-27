import { Module } from '@nestjs/common';
import { CustomersController } from './customers.controller';
import { CustomersService } from './customers.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Customers } from './customers.entity';

@Module({
    controllers: [CustomersController],
    imports: [TypeOrmModule.forFeature([Customers])],
    exports: [CustomersService],
    providers: [CustomersService],
})
export class CustomersModule {}
