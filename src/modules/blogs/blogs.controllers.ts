import { Controller, Get, Param } from '@nestjs/common';
import { BlogsService } from './blogs.service';
import { Blogs } from './blogs.entity';

@Controller('blogs')
export class BlogsController {
    constructor(private blogsService: BlogsService) {}

    @Get('/all')
    async getAll(): Promise<Blogs[]> {
        return await this.blogsService.getAll();
    }

    @Get('/blog/:id')
    async getBlogById(@Param('id') id: string): Promise<Blogs> {
        return await this.blogsService.getBlogById(+id);
    }
}
