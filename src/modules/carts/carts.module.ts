import { Module } from '@nestjs/common';
import { CartsController } from './carts.controller';
import { CartsService } from './carts.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Carts } from './carts.entity';
import { CustomersModule } from '../customers/customers.module';
import { ProductsModule } from '../products/products.module';

@Module({
    imports: [TypeOrmModule.forFeature([Carts]), CustomersModule, ProductsModule],
    controllers: [CartsController],
    providers: [CartsService],
    exports: [CartsService],
})
export class CartsModule {}
