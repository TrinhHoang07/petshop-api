import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Orders } from './orders.entity';
import { OrdersController } from './orders.controller';
import { OrdersService } from './orders.service';
import { NotificationModule } from '../notification/notification.module';

@Module({
    imports: [TypeOrmModule.forFeature([Orders]), NotificationModule],
    controllers: [OrdersController],
    providers: [OrdersService],
    exports: [OrdersService],
})
export class OrdersModule {}
