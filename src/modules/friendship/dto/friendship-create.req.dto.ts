import { IsNotEmpty } from 'class-validator';

export class FriendshipCreateDto {
    @IsNotEmpty()
    customer_invite: number;

    @IsNotEmpty()
    customer_id: number;

    status: string;
}
