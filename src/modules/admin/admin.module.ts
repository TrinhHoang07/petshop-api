import { Module, NestModule, MiddlewareConsumer } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Admin } from './admin.entity';
import { AdminController } from './admin.controller';
import { AdminService } from './admin.service';
import { TestTokenMiddleware } from 'src/middleware/testToken.middleware';
import { BlogsModule } from '../blogs/blogs.module';
import { CustomersModule } from '../customers/customers.module';
import { ProductsModule } from '../products/products.module';
import { OrdersModule } from '../orders/orders.module';

@Module({
    imports: [TypeOrmModule.forFeature([Admin]), BlogsModule, CustomersModule, ProductsModule, OrdersModule],
    controllers: [AdminController],
    providers: [AdminService],
    exports: [AdminService],
})
export class AdminModule implements NestModule {
    configure(consumer: MiddlewareConsumer) {
        consumer.apply(TestTokenMiddleware).forRoutes(AdminController);
    }
}
