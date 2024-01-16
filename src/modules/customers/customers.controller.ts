import {
    Body,
    Controller,
    HttpStatus,
    ValidationPipe,
    Put,
    Param,
    Get,
    UseGuards,
    Post,
    UseInterceptors,
    UploadedFile,
    Res,
    Req,
    Query,
    StreamableFile,
} from '@nestjs/common';
import { CustomersService } from './customers.service';
import { CustomersReqDto } from './dto/customers.req.dto';
import { UpdateResult } from 'typeorm';
import { Customers } from './customers.entity';
import { AuthGuard } from '@nestjs/passport';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
import { join } from 'path';
import { createReadStream } from 'fs';
import { CustomersAddressReqDto } from './dto/customers-address.req.dto';
import { CustomersPasswordReqDto } from './dto/customers-password.req.dto';

@Controller('customers')
export class CustomersController {
    constructor(private customerService: CustomersService) {}

    @UseGuards(AuthGuard('jwt'))
    @Get('/customer/:id')
    async getCustomerById(@Param('id') id: string): Promise<Customers | Object> {
        if (id) {
            const data = await this.customerService.getCustomerById(+id);

            if (data) return data;

            return {
                message: 'Not Found',
                statusCode: HttpStatus.BAD_REQUEST,
            };
        }

        return {
            message: 'Not Found Customer',
            statusCode: HttpStatus.BAD_REQUEST,
        };
    }

    // search products
    @UseGuards(AuthGuard('jwt'))
    @Get('/search')
    async searchProducts(@Query() query: { query: string }) {
        console.log('query customers: ', query);

        const data = await this.customerService.searchCustomers(JSON.parse(atob(query.query as string)));

        console.log('data: ', data);

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

    // update customer
    @UseGuards(AuthGuard('jwt'))
    @Put('/update/:id')
    async updateCustomerById(
        @Param('id') id: string,
        @Body(new ValidationPipe()) data: CustomersReqDto,
    ): Promise<UpdateResult | Object> {
        if (id) {
            const isUpdated = await this.customerService.updateCustomerById(+id, data);

            if (isUpdated.affected === 1) {
                const data = await this.customerService.getCustomerById(+id);

                if (data)
                    return {
                        message: 'success',
                        statusCode: HttpStatus.CREATED,
                        data: data,
                    };

                return {
                    message: 'Not Found',
                    statusCode: HttpStatus.BAD_REQUEST,
                };
            }
        }

        return {
            message: 'Not Found Customer',
            statusCode: HttpStatus.BAD_REQUEST,
        };
    }

    // update address
    @UseGuards(AuthGuard('jwt'))
    @Put('/update/address/:id')
    async updateAddressCustomerById(
        @Param('id') id: string,
        @Body(new ValidationPipe()) data: CustomersAddressReqDto,
    ): Promise<UpdateResult | Object> {
        if (id) {
            const isUpdated = await this.customerService.updateAddressCustomer(+id, data);

            if (isUpdated.affected === 1) {
                const data = await this.customerService.getCustomerById(+id);

                if (data)
                    return {
                        message: 'success',
                        statusCode: HttpStatus.CREATED,
                        data: data,
                    };

                return {
                    message: 'Not Found',
                    statusCode: HttpStatus.BAD_REQUEST,
                };
            }
        }

        return {
            message: 'Not Found Customer',
            statusCode: HttpStatus.BAD_REQUEST,
        };
    }

    // update password
    @UseGuards(AuthGuard('jwt'))
    @Put('/update/password/:id')
    async updatePasswordCustomerById(
        @Param('id') id: string,
        @Body(new ValidationPipe()) data: CustomersPasswordReqDto,
    ): Promise<UpdateResult | Object> {
        if (id) {
            const customer = await this.customerService.getCustomerByIdAndPassword(+id, data.oldPassword);

            if (customer) {
                const isUpdated = await this.customerService.updatePasswordCustomer(+id, data);

                if (isUpdated.affected === 1) {
                    return {
                        message: 'success',
                        statusCode: HttpStatus.CREATED,
                    };
                } else {
                    return {
                        message: 'success',
                        statusCode: HttpStatus.FAILED_DEPENDENCY,
                    };
                }
            } else {
                return {
                    message: 'mismatched',
                    detail: 'password is not matches, try again',
                    statusstatusCode: HttpStatus.NOT_FOUND,
                };
            }
        }

        return {
            message: 'Not Found Customer',
            statusCode: HttpStatus.BAD_REQUEST,
        };
    }

    ////////////////////////////// test upload => OK
    @Post('/test/upload/:id')
    @UseInterceptors(
        FileInterceptor('file', {
            storage: diskStorage({
                destination: './uploads',
                filename(_, file, callback) {
                    const fileName = `${file.originalname}`;

                    callback(null, fileName);
                },
            }),
        }),
    )
    async uploadAvatar(
        @UploadedFile()
        file: Express.Multer.File,
        @Param('id') id: string,
        @Req() req: Request,
    ) {
        const isUpdated = await this.customerService.updateAvatarCustomer(+id, {
            avatar_path: `http://${req.headers['host']}/images/uploads/${file.originalname}`,
        });

        if (isUpdated.affected === 1) {
            return {
                message: 'success',
                linkAvatar: `http://${req.headers['host']}/images/uploads/${file.originalname}`,
            };
        }

        return {
            message: 'error',
        };
    }

    //////////////////////////// test get avatar ==> OK
    @Get('/test/file/:id')
    async getFile(@Res({ passthrough: true }) res, @Param('id') id: string): Promise<StreamableFile | Object> {
        const customer = await this.customerService.getCustomerById(+id);

        console.log('id', id);

        console.log('customer', customer);

        if (customer.avatar_path) {
            res.set({
                'Content-Type': 'image/webp,image/apng',
            });
            const file = createReadStream(join(process.cwd(), customer.avatar_path));
            return new StreamableFile(file);
        }

        return {
            message: 'no image available',
        };

        // console.log('J', join(process.cwd(), 'uploads', 'girlcute.jpg'));

        // const file = createReadStream(join(process.cwd(), 'uploads', 'atccccc.jpg'));

        // console.log(file.path);

        // return new StreamableFile(file);
    }
}
