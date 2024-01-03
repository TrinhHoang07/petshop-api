import { IsNotEmpty } from 'class-validator';

export class AddConversation {
    conversation_name: string;
    conversation_type: string;

    @IsNotEmpty()
    created_by_customer: number;

    @IsNotEmpty()
    customer_id: number;
}
