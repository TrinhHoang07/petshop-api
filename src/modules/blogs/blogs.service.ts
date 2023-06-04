import { Injectable } from '@nestjs/common';
import { Blogs } from './blogs.entity';
import { Repository, UpdateResult } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { BlogsReqDto } from './dto/blogs.req.dto';

@Injectable()
export class BlogsService {
    constructor(@InjectRepository(Blogs) private blogsService: Repository<Blogs>) {}

    async getAll(): Promise<Blogs[]> {
        return await this.blogsService.find();
    }

    async createBlog(data: BlogsReqDto) {
        const blog = new Blogs();
        blog.title = data.title;
        blog.description = data.description;
        blog.preview_url = data.preview_url;

        return blog.save();
    }

    // update customer by id
    async updateBlogById(id: number, data: BlogsReqDto): Promise<UpdateResult> {
        return await this.blogsService.update(id, data);
    }

    // delete customer by id
    async deleteBlogById(id: number): Promise<UpdateResult> {
        return await this.blogsService.softDelete(id);
    }
}
