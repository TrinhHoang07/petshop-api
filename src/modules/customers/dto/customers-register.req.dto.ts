import { IsEmail, IsNotEmpty, Length, Matches } from 'class-validator';
import { MESSAGES, REGEX } from 'src/utils/app.util';

export class CustomersRegisterReqDto {
    @IsNotEmpty()
    name: string;

    @IsNotEmpty()
    @IsEmail()
    email: string;

    @IsNotEmpty()
    @Length(8, 32)
    @Matches(REGEX.PASSWORD_RULES, {
        message: MESSAGES.PASSWORD_RULES_MESSAGES,
    })
    password: string;

    @IsNotEmpty()
    @Length(8, 32)
    @Matches(REGEX.PASSWORD_RULES, {
        message: MESSAGES.PASSWORD_RULES_MESSAGES,
    })
    confirm_password: string;
}
