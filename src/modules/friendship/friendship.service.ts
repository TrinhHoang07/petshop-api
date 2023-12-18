import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, UpdateResult } from 'typeorm';
import { Friendship } from './friendship.entity';
import { FriendshipCreateDto } from './dto/friendship-create.req.dto';

@Injectable()
export class FriendshipService {
    constructor(@InjectRepository(Friendship) private friendshipService: Repository<Friendship>) {}

    // add new friend
    async addNewFriend(data: FriendshipCreateDto): Promise<Friendship> {
        const fr = new Friendship();
        fr.customer_invite_ = data.customer_invite;
        fr.customer_ = data.customer_id;
        fr.status = data.status;

        return await this.friendshipService.save(fr);
    }

    // get friendship invite by id
    async getFriendshipByIdInvite(id: number): Promise<Friendship[]> {
        return await this.friendshipService
            .createQueryBuilder('friendship')
            .addSelect('customer.name', 'customer_name')
            .addSelect('customer.address', 'customer_address')
            .addSelect('customer.phone_number', 'customer_phone_number')
            .addSelect('customer.birth_date', 'customer_birth_date')
            .addSelect('customer.avatar_path', 'customer_avatar_path')
            .addSelect('customer.gender', 'customer_gender')
            .innerJoin('customers', 'customer', 'customer.id=friendship.customer_id')
            .where(`friendship.customerInvite_id=${id}`)
            .andWhere(`friendship.status='waiting'`)
            .getRawMany();
    }

    // get friendship give invite by id
    async getFriendshipByIdGiveInvite(id: number): Promise<Friendship[]> {
        return await this.friendshipService
            .createQueryBuilder('friendship')
            .addSelect('customer.name', 'customer_name')
            .addSelect('customer.address', 'customer_address')
            .addSelect('customer.phone_number', 'customer_phone_number')
            .addSelect('customer.birth_date', 'customer_birth_date')
            .addSelect('customer.avatar_path', 'customer_avatar_path')
            .addSelect('customer.gender', 'customer_gender')
            .innerJoin('customers', 'customer', 'customer.id=friendship.customerInvite_id')
            .where(`friendship.customer_id=${id}`)
            .andWhere(`friendship.status='waiting'`)
            .getRawMany();
    }

    // remove friendship by id
    async removeFriendshipById(id: number): Promise<UpdateResult> {
        return await this.friendshipService.softDelete({
            customer_: id,
        });
    }
}
