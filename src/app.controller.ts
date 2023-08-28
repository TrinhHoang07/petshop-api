import { Controller, Get, Post, UploadedFile, UseInterceptors } from '@nestjs/common';
import { AppService } from './app.service';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';

@Controller()
export class AppController {
    constructor(private readonly appService: AppService) {}

    @Get()
    getHello(): string {
        return this.appService.getHello();
    }

    // test upload avatar => OK
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
}
