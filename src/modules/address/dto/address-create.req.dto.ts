import { IsNotEmpty } from 'class-validator';

export class AddressCreateDto {
    @IsNotEmpty()
    full_name: string;

    @IsNotEmpty()
    customer_id: number;

    @IsNotEmpty()
    phone_number: string;

    @IsNotEmpty()
    main_address: string;

    @IsNotEmpty()
    detail_address: string;

    @IsNotEmpty()
    type: string;
}
