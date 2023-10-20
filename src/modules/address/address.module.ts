import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AddressController } from './address.controller';
import { Address } from './address.entity';
import { AddressService } from './address.service';

@Module({
    controllers: [AddressController],
    imports: [TypeOrmModule.forFeature([Address])],
    exports: [AddressService],
    providers: [AddressService],
})
export class AddressModule {}
