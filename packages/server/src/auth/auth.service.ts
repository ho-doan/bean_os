import {
  Injectable,
  OnModuleInit,
  UnauthorizedException,
} from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';
import { InjectRepository } from '@nestjs/typeorm';
import * as bcrypt from 'bcrypt';
import { Repository } from 'typeorm';
import { User } from '../database/entities/user.entity';
import { LoginDto } from './dto/login.dto';
import type { JwtPayload } from './jwt.strategy';

@Injectable()
export class AuthService implements OnModuleInit {
  constructor(
    @InjectRepository(User)
    private readonly users: Repository<User>,
    private readonly jwt: JwtService,
    private readonly config: ConfigService,
  ) {}

  async onModuleInit(): Promise<void> {
    const count = await this.users.count();
    if (count > 0) {
      return;
    }
    const username = this.config.get<string>('SEED_ADMIN_USERNAME', 'admin');
    const password = this.config.get<string>('SEED_ADMIN_PASSWORD', 'admin123');
    const passwordHash = await bcrypt.hash(password, 10);
    await this.users.save(this.users.create({ username, passwordHash }));
  }

  async login(dto: LoginDto): Promise<{
    access_token: string;
    user: { id: number; username: string };
  }> {
    const user = await this.users.findOne({
      where: { username: dto.username },
    });
    if (!user || !(await bcrypt.compare(dto.password, user.passwordHash))) {
      throw new UnauthorizedException('Invalid credentials');
    }
    const payload: JwtPayload = { sub: user.id, username: user.username };
    return {
      access_token: await this.jwt.signAsync(payload),
      user: { id: user.id, username: user.username },
    };
  }
}
