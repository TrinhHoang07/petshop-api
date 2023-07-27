import { IsEmail, IsNotEmpty } from 'class-validator';

export class CustomerCreateDto {
    @IsNotEmpty()
    name: string;

    @IsNotEmpty()
    @IsEmail()
    email: string;

    address: string;
    gender: string;

    @IsNotEmpty()
    password: string;

    phone_number: string;
    birth_date: string;
    avatar_path: string;
}
