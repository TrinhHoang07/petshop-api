import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { TypeOrmConfigAsync } from './config/typeorm.config';
import { AdminModule } from './modules/admin/admin.module';
import { CustomersModule } from './modules/customers/customers.module';
import { ProductsModule } from './modules/products/products.module';
import { AuthModule } from './modules/auth/auth.module';
import { CartsModule } from './modules/carts/carts.module';
import { BlogsModule } from './modules/blogs/blogs.module';
import { ChatsModule } from './modules/chats/chats.module';
import { EventsModule } from './modules/events/events.module';
import { OrdersModule } from './modules/orders/orders.module';
import { AddressModule } from './modules/address/address.module';
import { ServeStaticModule } from '@nestjs/serve-static';
import { join } from 'path';
import { FriendshipModule } from './modules/friendship/friendship.module';
import { PaymentModule } from './modules/payment/payment.module';
import { NotificationModule } from './modules/notification/notification.module';

@Module({
    imports: [
        ConfigModule.forRoot({ isGlobal: true }),
        TypeOrmModule.forRootAsync(TypeOrmConfigAsync),
        ServeStaticModule.forRoot({
            rootPath: join(__dirname, '..', 'uploads'),
            serveRoot: '/images/uploads',
        }),
        AuthModule,
        AdminModule,
        CustomersModule,
        ProductsModule,
        CartsModule,
        BlogsModule,
        ChatsModule,
        EventsModule,
        OrdersModule,
        AddressModule,
        FriendshipModule,
        PaymentModule,
        NotificationModule,
    ],
    controllers: [AppController],
    providers: [AppService],
})
export class AppModule {}
