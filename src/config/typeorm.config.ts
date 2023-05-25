import { ConfigModule, ConfigService } from '@nestjs/config';
import { TypeOrmModuleOptions, TypeOrmModuleAsyncOptions } from '@nestjs/typeorm';

export default class TypeOrmConfig {
    static getOrmConfig(configService: ConfigService): TypeOrmModuleOptions {
        return {
            type: 'mysql',
            host: configService.get<string>('DB_HOST', { infer: true }),
            port: +configService.get<string>('DB_PORT', { infer: true }),
            database: configService.get<string>('DB_NAME', { infer: true }),
            username: configService.get<string>('DB_USERNAME', { infer: true }),
            password: configService.get<string>('DB_PASSWORD', { infer: true }),
            entities: [__dirname + '/../**/*.entity{.ts,.js}'],
            synchronize: true,
        };
    }
}

export const TypeOrmConfigAsync: TypeOrmModuleAsyncOptions = {
    imports: [ConfigModule],
    useFactory: async (configService: ConfigService): Promise<TypeOrmModuleOptions> => {
        return TypeOrmConfig.getOrmConfig(configService);
    },
    inject: [ConfigService],
};
