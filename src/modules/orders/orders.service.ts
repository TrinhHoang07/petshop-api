import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Orders } from './orders.entity';

@Injectable()
export class OrdersService {
    constructor(@InjectRepository(Orders) private ordersService: Repository<Orders>) {}
}
