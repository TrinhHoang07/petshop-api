import { IsNotEmpty } from 'class-validator';

export class BlogsReqDto {
    @IsNotEmpty()
    title: string;

    @IsNotEmpty()
    description: string;

    preview_url: string;
}
