import { IsNotEmpty } from 'class-validator';

export class NotiCreateDto {
    @IsNotEmpty()
    content: string;

    // @IsNotEmpty()
    customer_id?: number;

    type?: string;

    @IsNotEmpty()
    avatar_path: string;
}
