import { NestMiddleware } from '@nestjs/common';
import { NextFunction, Request, Response } from 'express';

export function logger(req: Request, res: Response, next: NextFunction) {
    // console.log('logger: ', req.headers);
    // console.log('query: ', req.query);

    if (req.query.query) {
        // req.query.query = JSON.parse(atob(req.query.query as string));
        console.log('parse query: ', JSON.parse(atob(req.query.query as string)));
    }

    // console.log('response: ', res.statusCode);

    next();
}
