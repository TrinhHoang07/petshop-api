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
    Response,
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
                code: HttpStatus.BAD_REQUEST,
            };
        }

        return {
            message: 'Not Found Customer',
            code: HttpStatus.BAD_REQUEST,
        };
    }

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
                        code: HttpStatus.CREATED,
                        data: data,
                    };

                return {
                    message: 'Not Found',
                    code: HttpStatus.BAD_REQUEST,
                };
            }
        }

        return {
            message: 'Not Found Customer',
            code: HttpStatus.BAD_REQUEST,
        };
    }

    ////////////////////////////// test upload => OK
    @Post('/test/upload')
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
    testUp(
        @UploadedFile()
        file: Express.Multer.File,
    ) {
        console.log('file uploaded: ', file);

        return 'OK';
    }

    //////////////////////////// test get avatar ==> OK
    @Get('/test/file')
    getFile(@Response({ passthrough: true }) res): StreamableFile {
        res.set({
            'Content-Type': 'image/webp,image/apng',
        });

        console.log('J', join(process.cwd(), 'uploads', 'girlcute.jpg'));

        const file = createReadStream(join(process.cwd(), 'uploads', 'girlcute.jpg'));

        return new StreamableFile(file);
    }
}
