#!/usr/bin/env python3

'''Encode date (default today) in short format: 2111 to 21cv'''

import sys
from datetime import datetime

def encode_date(dt):
    s = '123456789abcdefghijklmnopqrstuvwxyz'
    return '%02d%s%s' % (dt.year % 100, s[dt.month-1], s[dt.day-1])


if sys.argv[1:]:
    dt = datetime.fromisoformat(sys.argv[1])
else:
    dt = datetime.now()

print(encode_date(dt))
