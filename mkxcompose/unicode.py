#!/usr/bin/env python
# -*- coding: utf-8 -*-

import unicodedata
import sys

n = int(sys.argv[1], 16)
for _c in xrange(n, n+256):
    c = unichr(_c) 
    try:
        name = unicodedata.name(c)
    except:
        continue

    decomp = unicodedata.decomposition(c)
    norm = unicodedata.normalize("NFC", c)
    r = ""
    if norm != c:
        r = " = " + norm.encode('utf-8')

    print 'U+%04X   # %s   %s %s' % (_c, c.encode('utf-8'), name, r)
