import { IsNotEmpty } from 'class-validator';

export class AddUserConversation {
    @IsNotEmpty()
    customer_id: number;

    @IsNotEmpty()
    conversation_id: number;
}
