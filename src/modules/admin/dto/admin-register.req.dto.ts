import { IsNotEmpty, IsEmail, Length, Matches } from 'class-validator';
import { MESSAGES, REGEX } from 'src/utils/app.util';

export class AdminRegisterReqDto {
    @IsNotEmpty()
    name: string;

    @IsEmail()
    email: string;

    @IsNotEmpty()
    @Length(8, 36)
    @Matches(REGEX.PASSWORD_RULES, {
        message: MESSAGES.PASSWORD_RULES_MESSAGES,
    })
    password: string;

    @IsNotEmpty()
    @Length(8, 36)
    @Matches(REGEX.PASSWORD_RULES, {
        message: MESSAGES.PASSWORD_RULES_MESSAGES,
    })
    confirm_password: string;
}
