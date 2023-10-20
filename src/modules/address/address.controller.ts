import { Controller, HttpStatus, Get, UseGuards, Post, Body, UsePipes, ValidationPipe, Param } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { AddressService } from './address.service';
import { AddressCreateDto } from './dto/address-create.req.dto';

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

    @UseGuards(AuthGuard('jwt'))
    @UsePipes(new ValidationPipe())
    @Post('/create')
    async createAddress(@Body() data: AddressCreateDto): Promise<Object> {
        const address = await this.customerService.createCustomer(data);

        if (address) {
            return {
                message: 'success',
                statusCode: HttpStatus.OK,
                data: address,
            };
        }

        return {
            message: 'error',
            statusCode: HttpStatus.BAD_REQUEST,
        };
    }

    @UseGuards(AuthGuard('jwt'))
    @Get('/address/:id')
    async getAddressById(@Param('id') id: string): Promise<Object> {
        const addresses = await this.customerService.getAddressByCustomerId(+id);

        if (addresses) {
            return {
                message: 'success',
                statusCode: HttpStatus.OK,
                data: addresses,
            };
        }
    }
}
