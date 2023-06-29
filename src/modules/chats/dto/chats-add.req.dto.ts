import { IsNotEmpty } from 'class-validator';

export class ChatsAddDto {
    @IsNotEmpty()
    customer_id: number;

    message_emit: string;
    message_on: string;
}
