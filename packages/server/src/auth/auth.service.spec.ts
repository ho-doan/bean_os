import { UnauthorizedException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';
import { Test, TestingModule } from '@nestjs/testing';
import { getRepositoryToken } from '@nestjs/typeorm';
import * as bcrypt from 'bcrypt';
import { User } from '../database/entities/user.entity';
import { AuthService } from './auth.service';

jest.mock('bcrypt', () => ({
  compare: jest.fn(),
  hash: jest.fn(),
}));

describe('AuthService', () => {
  let service: AuthService;
  const usersRepo = {
    findOne: jest.fn(),
    count: jest.fn(),
    save: jest.fn(),
    create: jest.fn((v: unknown) => v),
  };
  const jwt = { signAsync: jest.fn() };
  const config = {
    get: jest.fn((_: string, def?: string) => def),
    getOrThrow: jest.fn(() => 'secret'),
  };

  beforeEach(async () => {
    jest.clearAllMocks();
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        AuthService,
        { provide: getRepositoryToken(User), useValue: usersRepo },
        { provide: JwtService, useValue: jwt },
        { provide: ConfigService, useValue: config },
      ],
    }).compile();

    service = module.get<AuthService>(AuthService);
  });

  it('login rejects invalid password', async () => {
    usersRepo.findOne.mockResolvedValue({
      id: 1,
      username: 'admin',
      passwordHash: 'hash',
    });
    (bcrypt.compare as jest.Mock).mockResolvedValue(false);
    await expect(
      service.login({ username: 'admin', password: 'wrong' }),
    ).rejects.toBeInstanceOf(UnauthorizedException);
  });

  it('login returns token on success', async () => {
    usersRepo.findOne.mockResolvedValue({
      id: 1,
      username: 'admin',
      passwordHash: 'hash',
    });
    (bcrypt.compare as jest.Mock).mockResolvedValue(true);
    jwt.signAsync.mockResolvedValue('jwt-token');
    const res = await service.login({ username: 'admin', password: 'ok' });
    expect(res.access_token).toBe('jwt-token');
    expect(res.user.username).toBe('admin');
  });
});
