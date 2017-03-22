#!/usr/bin/python
# -*- coding: utf-8 -*-

ORNAMENT = "\\"

import string
import getopt
import glob
import sys
import unicodedata

special_chars = {
"%": "percent",
"*": "asterisk",
".": "period",
":": "colon",
"!": "exclam",
"'": "apostrophe",
"^": "asciicircum",
"~": "asciitilde",
"_": "underscore",
"/": "slash",
"[": "bracketleft",
"]": "bracketright",
">": "greater",
"<": "less",
"=": "equal",
"(": "parenleft",
")": "parenright",
" ": "space",
"+": "plus",
"-": "minus",
"?": "question",
'"': "quotedbl",
"|": "bar",
# "`": "backtick",
}

g_hashst = {} 
pages = { }

quiet = False

def main(filenames):
    for fn in filenames or glob.glob("*.codes"):
        done = 0
        undone = 0
        ds = open(fn).read() + "\n"

        if not quiet:
            print "# %s" % fn

        p = eval("{\n" + ds + "\n}")

        for k in p.keys():
            if len(p[k]) > 1:
                print "%d codes for %s (U+%04x)" % (len(p[k]), unichr(k), k)
            
            if not p[k][0]:
                if not quiet:
                    print composeLine("u%04x" % k, k)
                undone += 1
                del p[k]
            else:
                done += 1

        pages.update(p)
        print "# %s end: %u/%u undone" % (fn, undone, done + undone)

    for code, cmds in pages.items():
        for c in cmds:
            l = composeLine(c, code)

            if not quiet:
                print l

def charname(c):
    if c in special_chars: return special_chars[c]
    else: return c

def uc(i):
    return unichr(i).encode("utf-8")

def ucname(i):
    try:
        return unicodedata.name(unichr(i))
    except:
        return ""


def composeLine(cmd, code, comment = ""):
    full = ""
    curr = g_hashst
    for c in cmd:
        if c and c[0] == "<":
            add = " %s " % c[0]
            full += add
            if add not in curr:
                curr[add] = { } 
            curr = curr[add]
        else:
            for ch in c:
                add = "<%s> " % charname(ch)
                full += add
                if add not in curr:
                    curr[add] = { } 
                curr = curr[add]
                if "result" in curr:
                    print "overlapping keys U+%04x (%s) and U+%04x (%s): '%s'" % (ord(curr["result"]), curr["result"], code, unichr(code), cmd)
                    sys.exit(1)

    if curr:
        print "underlapping keys %s and U+%04x (%s)" % (curr, code, cmd)
        sys.exit(1)

    curr["result"] = unichr(code)

    return '''<Multi_key> %s : "%s" U%04X # %s  %s''' % (full, uc(code), code, ucname(code), comment)

optlist, args = getopt.getopt(sys.argv[1:], "q")
for o, a in optlist:
    if o == "-q":
        quiet = True

main(args)
