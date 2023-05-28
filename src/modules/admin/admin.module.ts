import { Module, NestModule, MiddlewareConsumer } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Admin } from './admin.entity';
import { AdminController } from './admin.controller';
import { AdminService } from './admin.service';
import { TestTokenMiddleware } from 'src/middleware/testToken.middleware';

@Module({
    imports: [TypeOrmModule.forFeature([Admin])],
    controllers: [AdminController],
    providers: [AdminService],
    exports: [AdminService],
})
export class AdminModule implements NestModule {
    configure(consumer: MiddlewareConsumer) {
        consumer.apply(TestTokenMiddleware).forRoutes(AdminController);
    }
}
