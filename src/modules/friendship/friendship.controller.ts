import { Controller, Post, Get, Param, Res, HttpStatus } from '@nestjs/common';
import { Response } from 'express';
import { FriendshipService } from './friendship.service';

@Controller('friendship')
export class FriendshipController {
    constructor(private friendshipService: FriendshipService) {}
}
