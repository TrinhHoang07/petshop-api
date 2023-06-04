import { IsNotEmpty } from 'class-validator';

export class ProductsReqDto {
    @IsNotEmpty()
    name: string;

    @IsNotEmpty()
    price: number;

    @IsNotEmpty()
    preview_url: string;

    @IsNotEmpty()
    type: string;

    @IsNotEmpty()
    quantity: number;

    color: string;
    rate: number;
    description: string;
    sub_description: string;
}
