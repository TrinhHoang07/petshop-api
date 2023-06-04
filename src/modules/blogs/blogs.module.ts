import { Module } from '@nestjs/common';
import { BlogsController } from './blogs.controllers';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Blogs } from './blogs.entity';
import { BlogsService } from './blogs.service';

@Module({
    controllers: [BlogsController],
    imports: [TypeOrmModule.forFeature([Blogs])],
    providers: [BlogsService],
    exports: [BlogsService],
})
export class BlogsModule {}
