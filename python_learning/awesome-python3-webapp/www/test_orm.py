# !/usr/bin/env python3
# -*- coding: utf-8 -*-
from orm import create_pool
from models import User, Blog, Comment
import asyncio
import aiomysql

loop = asyncio.get_event_loop()

@asyncio.coroutine
def test():
    yield from create_pool(loop, user='root', password='P@ssw0rd',
                               db='awesome')
    u = User(name='Test', email='test@example.com', passwd='qwe123',
             image='about:blank')
    yield from u.save()


loop.run_until_complete(test())
