import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return '123 123 Hello World! 123 123';
  }
}
