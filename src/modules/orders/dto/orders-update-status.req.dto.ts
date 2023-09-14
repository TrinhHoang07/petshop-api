import { IsNotEmpty } from 'class-validator';

export class OrdersUpdateStatusReqDto {
    @IsNotEmpty()
    status: string;
}
