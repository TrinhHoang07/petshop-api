import { NestMiddleware, HttpStatus } from '@nestjs/common';
import { NextFunction, Request, Response } from 'express';

export class TestTokenMiddleware implements NestMiddleware {
    use(req: Request, res: Response, next: NextFunction) {
        console.log('header token: ', req.rawHeaders);

        if (req.headers.authorization !== 'Bearer hoangtrinh07@@OK') {
            return res.status(HttpStatus.UNAUTHORIZED).json({
                message: 'Unauthenticated!',
                code: HttpStatus.UNAUTHORIZED,
            });
        }

        next();
    }
}
