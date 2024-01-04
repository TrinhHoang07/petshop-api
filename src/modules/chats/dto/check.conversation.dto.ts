import { IsNotEmpty } from 'class-validator';

export class CheckConversation {
    @IsNotEmpty()
    customer_id: number;

    @IsNotEmpty()
    created_id: number;

    type: string;
}
