import { Injectable } from '@nestjs/common';
import { Blogs } from './blogs.entity';
import { Repository, UpdateResult } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { BlogsReqDto } from './dto/blogs.req.dto';

@Injectable()
export class BlogsService {
    constructor(@InjectRepository(Blogs) private blogsService: Repository<Blogs>) {}

    // get all blogs
    async getAll(): Promise<Blogs[]> {
        return await this.blogsService.find();
    }

    // create new blog
    async createBlog(data: BlogsReqDto) {
        const blog = new Blogs();
        blog.title = data.title;
        blog.description = data.description;
        blog.preview_url = data.preview_url;

        return blog.save();
    }

    // get blogs by ID
    async getBlogById(id: number): Promise<Blogs> {
        return await this.blogsService.findOneBy({
            id: id,
        });
    }

    // get random blogs
    async randomBlogs(limit?: number): Promise<Blogs[] | Object> {
        const data = await this.blogsService
            .createQueryBuilder('blogs')
            .select()
            .orderBy('RAND()')
            .take(limit ?? 6)
            .getMany();

        return data;
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
