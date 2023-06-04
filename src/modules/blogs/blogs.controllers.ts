import {
    Body,
    Controller,
    Get,
    Post,
    ValidationPipe,
    UsePipes,
    Put,
    Delete,
    Param,
    Res,
    HttpStatus,
} from '@nestjs/common';
import { BlogsService } from './blogs.service';
import { Blogs } from './blogs.entity';
import { BlogsReqDto } from './dto/blogs.req.dto';
import { Response } from 'express';
import { UpdateResult } from 'typeorm';

@Controller('blogs')
export class BlogsController {
    constructor(private blogsService: BlogsService) {}

    @Get('/all')
    async getAll(): Promise<Blogs[]> {
        return await this.blogsService.getAll();
    }

    @Post('/create')
    @UsePipes(new ValidationPipe())
    async createBlog(@Body() data: BlogsReqDto) {
        return this.blogsService.createBlog(data);
    }

    @Put('/update/:id')
    async updateBlogById(
        @Param('id') id: string,
        @Body(new ValidationPipe()) data: BlogsReqDto,
        @Res() res: Response,
    ): Promise<UpdateResult | Object> {
        const isUpdated = await this.blogsService.updateBlogById(+id, data);

        if (isUpdated.affected === 0) {
            return res.status(HttpStatus.BAD_REQUEST).json({
                message: 'Error updating blogs',
                code: HttpStatus.BAD_REQUEST,
            });
        }

        return res.status(HttpStatus.OK).json({
            message: 'success',
            code: HttpStatus.OK,
        });
    }

    @Delete('/delete/:id')
    async deleteBlogById(@Param('id') id: string, @Res() res: Response): Promise<UpdateResult | Object> {
        const isDeleted = await this.blogsService.deleteBlogById(+id);

        if (isDeleted.affected === 0) {
            return res.status(HttpStatus.BAD_REQUEST).json({
                message: 'Error deleting customer',
                code: HttpStatus.BAD_REQUEST,
            });
        }

        return res.status(HttpStatus.OK).json({
            message: 'Success',
            code: HttpStatus.OK,
        });
    }
}
