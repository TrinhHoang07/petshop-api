import { Body, Controller, HttpStatus, Res, ValidationPipe, Put, Param } from '@nestjs/common';
import { CustomersService } from './customers.service';
import { Response } from 'express';
import { CustomersReqDto } from './dto/customers.req.dto';
import { UpdateResult } from 'typeorm';

@Controller('customers')
export class CustomersController {
    constructor(private customerService: CustomersService) {}

    @Put('/update/:id')
    async updateCustomerById(
        @Param('id') id: string,
        @Body(new ValidationPipe()) data: CustomersReqDto,
        @Res() res: Response,
    ): Promise<UpdateResult | Object> {
        const isUpdated = await this.customerService.updateCustomerById(+id, data);

        if (isUpdated.affected === 0) {
            return res.status(HttpStatus.BAD_REQUEST).json({
                message: 'Error updating customer',
                code: HttpStatus.BAD_REQUEST,
            });
        }

        return res.status(HttpStatus.OK).json({
            message: 'success',
            code: HttpStatus.OK,
        });
    }
}
