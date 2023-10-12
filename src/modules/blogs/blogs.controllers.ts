import { Controller, Get, Param, HttpStatus, Query } from '@nestjs/common';
import { BlogsService } from './blogs.service';
import { Blogs } from './blogs.entity';

@Controller('blogs')
export class BlogsController {
    constructor(private blogsService: BlogsService) {}

    // get all blogs
    @Get('/all')
    async getAll(): Promise<Blogs[] | Object> {
        const data = await this.blogsService.getAll();

        if (data) {
            return {
                message: 'success',
                statusCode: 200,
                data: data,
            };
        } else {
            return {
                message: 'error',
                statusCode: 404,
            };
        }
    }

    @Get('/random')
    async getRandomBlogs(@Query() query: { limit: number }) {
        const data = await this.blogsService.randomBlogs(query.limit);

        if (data) {
            return {
                message: 'success',
                statusCode: 200,
                data: data,
            };
        } else {
            return {
                message: 'error',
                statusCode: 404,
            };
        }
    }

    // get blog by ID
    @Get('/blog/:id')
    async getBlogById(@Param('id') id: string): Promise<Blogs | Object> {
        console.log(typeof id);

        if (id) {
            const data = await this.blogsService.getBlogById(+id);

            console.log(data);

            if (data) {
                return {
                    message: 'success',
                    code: HttpStatus.OK,
                    data: data,
                };
            }

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
