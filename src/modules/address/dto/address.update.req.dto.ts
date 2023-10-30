import { IsNotEmpty } from 'class-validator';

export class AddressUpdateDto {
    @IsNotEmpty()
    id: string;

    @IsNotEmpty()
    full_name: string;

    @IsNotEmpty()
    phone_number: string;

    @IsNotEmpty()
    main_address: string;

    @IsNotEmpty()
    detail_address: string;

    @IsNotEmpty()
    type: string;
}
