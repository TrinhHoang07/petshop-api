import {
    Controller,
    HttpStatus,
    Get,
    UseGuards,
    Post,
    Body,
    UsePipes,
    ValidationPipe,
    Param,
    Put,
    Delete,
} from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { AddressService } from './address.service';
import { AddressCreateDto } from './dto/address-create.req.dto';
import { AddressUpdateDto } from './dto/address.update.req.dto';

@Controller('address')
export class AddressController {
    constructor(private customerService: AddressService) {}

    @UseGuards(AuthGuard('jwt'))
    @Get('/all')
    async getAll(): Promise<Object> {
        const data = this.customerService.getAll();

        if (data) {
            return {
                message: 'success',
                statusCode: HttpStatus.OK,
                data: data,
            };
        }
    }

    @UseGuards(AuthGuard('jwt')) // yêu cầu người dùng đã đăng nhập và có token kèm theo mới có thể dùng chức năng 
    @UsePipes(new ValidationPipe()) // yêu cầu phải có data gửi lên và data gửi lên phải có format như trong "AddressCreateDto - ctrl click để "
    @Post('/create') // phương thức gửi lên server - POST 
    async createAddress(@Body() data: AddressCreateDto): Promise<Object> { // hàm xử lý tạo mới địa chỉ - trả về 1 object 
        const address = await this.customerService.createCustomer(data); // this.customerService.createCustomer - là 1 hàm xử lý tạo mới 1 trường trong database  

        if (address) { // nếu có địa chỉ (Thành ) - trả về message success kèm 
            return {
                message: 'success',
                statusCode: HttpStatus.OK,
                data: address,
            };
        }

        return { // nếu không thành công thì trả về error lỗi
            message: 'error',
            statusCode: HttpStatus.BAD_REQUEST,
        };
    }

    @UseGuards(AuthGuard('jwt')) // yêu cầu người dùng đã đăng nhập và có token kèm theo mới có thể dùng chức năng
    @Get('/address/:id') // phương thức gửi lên server - GET 
    async getAddressById(@Param('id') id: string): Promise<Object> { // hàm xử lý lấy địa chỉ theo id - người dùng truyền params id lên (https://facebook.com/profile/344 - thì 344 là params ID)
        const addresses = await this.customerService.getAddressByCustomerId(+id); // hàm lấy trong service xử lý lấy 1 trường trong database

        if (addresses) {
            return {
                message: 'success',
                statusCode: HttpStatus.OK,
                data: addresses,
            };
        }
    }

    @UseGuards(AuthGuard('jwt'))
    @UsePipes(new ValidationPipe())
    @Put('/address/update/:id')
    async updateAddressById(@Param('id') id: string, @Body() data: AddressUpdateDto): Promise<Object> {
        console.log('dataaaaa: ', data);

        const isUpdated = await this.customerService.updateAddressById(+data.id, data);

        if (isUpdated.affected === 1) {
            const customer = await this.customerService.getAddressByCustomerId(+id);

            return {
                message: 'success',
                statusCode: HttpStatus.OK,
                data: customer,
            };
        } else {
            return {
                message: 'error',
                statusCode: HttpStatus.BAD_REQUEST,
            };
        }
    }

    @UseGuards(AuthGuard('jwt'))
    @Delete('/address/delete/:id')
    async deleteAddressById(@Param('id') id: string): Promise<Object> {
        const isUpdated = await this.customerService.deleteAddressById(+id);

        if (isUpdated.affected === 1) {
            return {
                message: 'success',
                statusCode: HttpStatus.OK,
            };
        } else {
            return {
                message: 'error',
                statusCode: HttpStatus.BAD_REQUEST,
            };
        }
    }
}
