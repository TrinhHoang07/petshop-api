import { IsNotEmpty } from 'class-validator';

export class FriendshipUpdateStatusDto {
    @IsNotEmpty()
    customer_invite: number;

    @IsNotEmpty()
    customer_id: number;

    @IsNotEmpty()
    status: string;
}
