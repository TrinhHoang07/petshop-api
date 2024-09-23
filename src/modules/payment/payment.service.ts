import { Injectable } from '@nestjs/common';
import { Payment } from './payment.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, UpdateResult } from 'typeorm';

@Injectable()
export class PaymentService {
    constructor(@InjectRepository(Payment) private paymentEntity: Repository<Payment>) {}

    async addNewPayment(data: any[]): Promise<Payment[]> {
        console.log('adding new payment', data);

        const arrPayment = [];
        if (data.length > 0) {
            data.forEach((item) => {
                const payment = new Payment();
                payment.state = item.state;
                payment.order_ = item.order_id;

                arrPayment.push(payment);
            });
        }

        const payments = Payment.create(arrPayment);

        return await Payment.save(payments);
    }

    async getPaymentById(paymentId: number): Promise<Payment> {
        return await this.paymentEntity
            .createQueryBuilder('payment')
            .addSelect('order.id', 'order_id')
            .addSelect('payment.id', 'id')
            .addSelect('payment.state', 'state')
            .addSelect('payment.created_at', 'created_at')
            .addSelect('payment.updated_at', 'updated_at')
            .innerJoin('orders', 'order', 'order.id=payment.order_id')
            .where('payment.id = :id', { id: paymentId })
            .getRawOne();
    }

    async updatePaymentStateById(paymentId: number, paymentState: string): Promise<UpdateResult> {
        return await this.paymentEntity.update(paymentId, {
            state: paymentState,
        });
    }
}
