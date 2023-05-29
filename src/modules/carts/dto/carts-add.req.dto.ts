import { IsNotEmpty } from 'class-validator';

export class CartsAddReqDto {
    @IsNotEmpty()
    customer_id: number;

    @IsNotEmpty()
    product_id: number;

    quantity: number;
}
