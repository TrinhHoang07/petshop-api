import { IsNotEmpty } from 'class-validator';

export class OrdersAddReqDto {
    @IsNotEmpty()
    price: number;

    @IsNotEmpty()
    customer_id: number;

    @IsNotEmpty()
    product_id: number;

    @IsNotEmpty()
    quantity: number;

    status: string;
}
