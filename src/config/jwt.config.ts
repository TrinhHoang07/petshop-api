import { JwtModuleOptions } from '@nestjs/jwt';

export const jwtConfig: JwtModuleOptions = {
    privateKey: process.env.SECRET_KEY,
    secretOrPrivateKey: process.env.SECRET_KEY ?? '@@@@@@123AzzzAaax',
    secret: process.env.SECRET_KEY,

    signOptions: {
        expiresIn: '3600s',
    },
};
