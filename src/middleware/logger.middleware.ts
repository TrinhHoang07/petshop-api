import { NestMiddleware } from '@nestjs/common';
import { NextFunction, Request, Response } from 'express';

export function logger(req: Request, res: Response, next: NextFunction) {
    console.log('logger: ', req.rawHeaders);
    console.log('response: ', res.statusCode);

    next();
}
