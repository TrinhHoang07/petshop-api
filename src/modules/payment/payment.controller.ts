import { Body, Controller, Get, Header, HttpStatus, Param, Post, Put, Redirect, Req } from '@nestjs/common';
import { Request, Response } from 'express';
import * as moment from 'moment';
import { sortObject } from 'src/utils/app.util';
import * as querystring from 'qs';
import * as crypto from 'crypto';
import { PaymentService } from './payment.service';

@Controller('/payment')
export class PaymentController {
    constructor(private paymentService: PaymentService) {}

    @Post('/order/create')
    async test(@Body() data: any[]) {
        const payment = await this.paymentService.addNewPayment(data);

        if (payment) {
            return {
                message: 'success',
                statusCode: HttpStatus.OK,
                data: payment,
            };
        }

        return {
            message: 'error',
            statusCode: HttpStatus.BAD_REQUEST,
        };
    }

    @Get('/order/:id')
    async testGet(@Param('id') id: string) {
        const data = await this.paymentService.getPaymentById(+id);

        if (data.id) {
            return {
                message: 'success',
                statusCode: HttpStatus.OK,
                data,
            };
        }

        return {
            message: 'error',
            statusCode: HttpStatus.BAD_REQUEST,
        };
    }

    @Put('/order/update/:id')
    async testPut(@Param('id') id: string, @Body() data: any) {
        console.log('updatreahgafdahdsfdfsafdfgsad: ', id);
        const update = await this.paymentService.updatePaymentStateById(+id, data.state);

        if (update.affected !== 0) {
            const data = await this.paymentService.getPaymentById(+id);

            return {
                message: 'success',
                statusCode: HttpStatus.OK,
                data,
            };
        }

        return {
            message: 'error',
            statusCode: HttpStatus.BAD_REQUEST,
        };
    }

    @Post('/create')
    async createNewPayment(@Body() data: any, @Req() req: Request, res: Response) {
        const date = new Date();
        const createDate = moment(date).format('YYYYMMDDHHmmss');
        const ipAddr =
            req.headers['x-forwarded-for'] ||
            req.connection.remoteAddress ||
            req.socket.remoteAddress ||
            (req.connection as any).socket.remoteAddress;
        const tmnCode = process.env.VNP_TMNCODE;
        const secretKey = process.env.VNP_HASHSECRET;
        let vnpUrl = process.env.VNP_URL;
        const returnUrl = process.env.VNP_RETURNURL;
        const orderId = moment(date).format('DDHHmmss');
        const amount = data.amount;
        // const bankCode = data.bankCode;
        const currCode = 'VND';
        let vnp_Params = {};
        // vnp_Params['pay_id'] = data.pay_id;
        vnp_Params['vnp_Version'] = '2.1.0';
        vnp_Params['vnp_Command'] = 'pay';
        vnp_Params['vnp_TmnCode'] = tmnCode;
        vnp_Params['vnp_Locale'] = 'vn';
        vnp_Params['vnp_CurrCode'] = currCode;
        vnp_Params['vnp_TxnRef'] = orderId;
        vnp_Params['vnp_OrderInfo'] = JSON.stringify(data.pay_id);
        vnp_Params['vnp_OrderType'] = 'other';
        vnp_Params['vnp_Amount'] = amount * 100;
        vnp_Params['vnp_ReturnUrl'] = returnUrl;
        vnp_Params['vnp_IpAddr'] = ipAddr;
        vnp_Params['vnp_CreateDate'] = createDate;

        // if (bankCode !== null && bankCode !== '') {
        //     vnp_Params['vnp_BankCode'] = bankCode;
        // }

        vnp_Params = sortObject(vnp_Params);
        const signData = querystring.stringify(vnp_Params, { encode: false });
        const hmac = crypto.createHmac('sha512', secretKey);
        const signed = hmac.update(new Buffer(signData, 'utf-8')).digest('hex');
        vnp_Params['vnp_SecureHash'] = signed;
        vnpUrl += '?' + querystring.stringify(vnp_Params, { encode: false });

        return {
            url: vnpUrl,
            id: data.pay_id,
        };
    }

    @Get('/vnpay_return')
    async returnPayment(@Req() req: Request) {
        console.log('callled');
        let vnp_Params = req.query;
        const secureHash = vnp_Params['vnp_SecureHash'];
        delete vnp_Params['vnp_SecureHash'];
        delete vnp_Params['vnp_SecureHashType'];
        vnp_Params = sortObject(vnp_Params);

        const tmnCode = process.env.VNP_TMNCODE;
        const secretKey = process.env.VNP_HASHSECRET;
        const signData = querystring.stringify(vnp_Params, { encode: false });
        const hmac = crypto.createHmac('sha512', secretKey);
        const signed = hmac.update(new Buffer(signData, 'utf-8')).digest('hex');

        if (secureHash === signed) {
            const ids = JSON.parse(decodeURIComponent(vnp_Params['vnp_OrderInfo'] as string));
            let message = '';
            if (ids?.length > 0) {
                ids?.forEach(async (item) => {
                    if (vnp_Params['vnp_ResponseCode'] === '00') {
                        const updated = await this.paymentService.updatePaymentStateById(item, '00');

                        if (updated.affected !== 0) {
                            message = 'Thanh toan thanh cong!';
                        } else {
                            await this.paymentService.updatePaymentStateById(item, '03');
                            message = 'Thanh toan that bai';
                        }
                    }
                });

                return message;
            }
        } else {
            await this.paymentService.updatePaymentStateById(+vnp_Params['vnp_OrderInfo'][0], '97');
            return {
                message: 'That bai, check sum failed',
            };
        }
    }
}
