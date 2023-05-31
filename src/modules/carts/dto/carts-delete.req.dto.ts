import { IsNotEmpty } from 'class-validator';

export class CartsDeleteReqDto {
    @IsNotEmpty()
    id: number;
}
