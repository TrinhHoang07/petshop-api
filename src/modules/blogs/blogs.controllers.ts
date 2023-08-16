import { Controller, Get, Param, Res, HttpStatus, Query } from '@nestjs/common';
import { BlogsService } from './blogs.service';
import { Blogs } from './blogs.entity';
import { Response } from 'express';

@Controller('blogs')
export class BlogsController {
    constructor(private blogsService: BlogsService) {}

    // get all blogs
    @Get('/all')
    async getAll(): Promise<Blogs[]> {
        return await this.blogsService.getAll();
    }

    @Get('/random')
    async getRandomBlogs(@Query() query: { limit: number }) {
        return await this.blogsService.randomBlogs(query.limit);
    }

    // get blog by ID
    @Get('/blog/:id')
    async getBlogById(@Param('id') id: string): Promise<Blogs | Object> {
        console.log(typeof id);

        if (id) {
            const data = await this.blogsService.getBlogById(+id);
            if (data) return data;

            return {
                message: 'Not Found',
                code: HttpStatus.BAD_REQUEST,
            };
        }

        return {
            message: 'id not found',
            code: HttpStatus.BAD_REQUEST,
        };
    }
}
