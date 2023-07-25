import {
    Controller,
    Post,
    Body,
    Get,
    ValidationPipe,
    Put,
    Param,
    Res,
    UsePipes,
    HttpStatus,
    Delete,
} from '@nestjs/common';
import { AdminService } from './admin.service';
import { AdminRegisterReqDto } from './dto/admin-register.req.dto';
import { Admin } from './admin.entity';
import { BlogsService } from '../blogs/blogs.service';
import { BlogsReqDto } from '../blogs/dto/blogs.req.dto';
import { UpdateResult } from 'typeorm';
import { Response } from 'express';
import { CustomersService } from '../customers/customers.service';
import { Customers } from '../customers/customers.entity';
import { ProductsService } from '../products/products.service';
import { ProductsReqDto } from '../products/dto/products.req.dto';
import { Products } from '../products/products.entity';

@Controller('admin')
export class AdminController {
    constructor(
        private adminService: AdminService,
        private blogsService: BlogsService,
        private customerService: CustomersService,
        private productsService: ProductsService,
    ) {}

    @Get('/all')
    async getAllAdmin(): Promise<Admin[]> {
        return await this.adminService.getAllAdmin();
    }

    @Post('/create')
    async register(@Body(new ValidationPipe()) adminRegister: AdminRegisterReqDto): Promise<Admin> {
        return await this.adminService.register(adminRegister);
    }

    // BLOGS

    @Post('/blogs/create')
    @UsePipes(new ValidationPipe())
    async createBlog(@Body() data: BlogsReqDto) {
        return this.blogsService.createBlog(data);
    }

    @Put('/blogs/update/:id')
    async updateBlogById(
        @Param('id') id: string,
        @Body(new ValidationPipe()) data: BlogsReqDto,
        @Res({ passthrough: true }) res: Response,
    ): Promise<UpdateResult | Object> {
        if (id) {
            const isUpdated = await this.blogsService.updateBlogById(+id, data);

            if (isUpdated.affected === 1) {
                const data = await this.blogsService.getBlogById(+id);

                if (data)
                    return res.status(HttpStatus.CREATED).json({
                        message: 'success',
                        code: HttpStatus.CREATED,
                        data: data,
                    });

                return res.status(HttpStatus.BAD_REQUEST).json({
                    message: 'Not Found',
                    code: HttpStatus.BAD_REQUEST,
                });
            }
        }

        return res.status(HttpStatus.BAD_REQUEST).json({
            message: 'Error updating blogs',
            code: HttpStatus.BAD_REQUEST,
        });
    }

    @Delete('/blogs/delete/:id')
    async deleteBlogById(@Param('id') id: string, @Res() res: Response): Promise<UpdateResult | Object> {
        if (id) {
            const isDeleted = await this.blogsService.deleteBlogById(+id);

            if (isDeleted.affected === 1) {
                return res.status(HttpStatus.OK).json({
                    message: 'success',
                    code: HttpStatus.OK,
                });
            }
        }

        return res.status(HttpStatus.BAD_REQUEST).json({
            message: 'Error deleting blogs',
            code: HttpStatus.BAD_REQUEST,
        });
    }

    // CUSTOMERS

    @Get('/customers/all')
    async getAll(): Promise<Customers[]> {
        return await this.customerService.getAll();
    }

    @Delete('/customers/delete/:id')
    async deleteCustomerById(@Param('id') id: string, @Res() res: Response): Promise<UpdateResult | Object> {
        if (id) {
            const isDeleted = await this.customerService.deleteCustomerById(+id);

            if (isDeleted.affected === 1) {
                return res.status(HttpStatus.OK).json({
                    message: 'success',
                    code: HttpStatus.OK,
                });
            }
        }

        return res.status(HttpStatus.BAD_REQUEST).json({
            message: 'Error deleting customer',
            code: HttpStatus.BAD_REQUEST,
        });
    }

    // PRODUCTS

    @Post('products/create')
    async addProduct(@Body(new ValidationPipe()) data: ProductsReqDto): Promise<Object> {
        const product = await this.productsService.addProduct(data);

        return {
            success: true,
            statusCode: 200,
            data: {
                name: product.name,
                description: product.description,
                price: product.price,
                quantity: product.quantity,
                sub_description: product.sub_description,
                type: product.type,
                color: product.color,
                preview_url: product.preview_url,
            },
        };
    }

    @Put('products/update/:id')
    async updateProductById(
        @Param('id') id: string,
        @Body(new ValidationPipe()) data: ProductsReqDto,
        @Res({ passthrough: true }) res: Response,
    ): Promise<any> {
        if (id) {
            console.log(typeof data);

            const isUpdated = await this.productsService.updateProductById(+id, data);

            if (isUpdated.affected === 1) {
                const data = await this.productsService.getProductById(+id);

                if (data)
                    return res.status(HttpStatus.CREATED).json({
                        message: 'success',
                        code: HttpStatus.CREATED,
                        data: data,
                    });

                return res.status(HttpStatus.BAD_REQUEST).json({
                    message: 'Not Found',
                    code: HttpStatus.BAD_REQUEST,
                });
            }
        }
        return res.status(HttpStatus.BAD_REQUEST).json({
            message: 'Error update product',
            code: HttpStatus.BAD_REQUEST,
        });
    }

    @Delete('products/delete/:id')
    async deleteProductById(@Param('id') id: string, @Res() res: Response): Promise<UpdateResult | Object> {
        if (id) {
            const isDeleted = await this.productsService.deleteProductById(+id);

            if (isDeleted.affected === 1) {
                return res.status(HttpStatus.OK).json({
                    message: 'success',
                    code: HttpStatus.OK,
                });
            }
        }

        return res.status(HttpStatus.BAD_REQUEST).json({
            message: 'Error delete product',
            code: HttpStatus.BAD_REQUEST,
        });
    }
}
