import { Controller, Get, Param, Res, HttpStatus } from '@nestjs/common';
import { BlogsService } from './blogs.service';
import { Blogs } from './blogs.entity';
import { Response } from 'express';

@Controller('blogs')
export class BlogsController {
    constructor(private blogsService: BlogsService) {}

    @Get('/all')
    async getAll(): Promise<Blogs[]> {
        return await this.blogsService.getAll();
    }

    @Get('/blog/:id')
    async getBlogById(@Param('id') id: string, @Res({ passthrough: true }) res: Response): Promise<Blogs | Object> {
        console.log(typeof id);

        if (id) {
            const data = await this.blogsService.getBlogById(+id);
            if (data) return data;

            return res.status(HttpStatus.BAD_REQUEST).json({
                message: 'Not Found',
                code: HttpStatus.BAD_REQUEST,
            });
        }

        return res.status(HttpStatus.BAD_REQUEST).json({
            message: 'id not found',
            code: HttpStatus.BAD_REQUEST,
        });
    }
}
