import { NestMiddleware, HttpStatus } from '@nestjs/common';
import { NextFunction, Request, Response } from 'express';

export class TestTokenMiddleware implements NestMiddleware {
    use(req: Request, res: Response, next: NextFunction) {
        const token = 'Bearer ' + process.env.ADMIN_SECRET_TOKEN;

        if (req.headers.authorization !== token) {
            return res.status(HttpStatus.UNAUTHORIZED).json({
                message: 'Unauthenticated!',
                code: HttpStatus.UNAUTHORIZED,
            });
        }

        next();
    }
}
