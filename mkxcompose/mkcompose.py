#!/usr/bin/env python3

import fileinput

g_hashst = {}

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

def charname(c):
    if c in special_chars:
        return special_chars[c]

    return c

def composeLine(cmd, replstr, code=None, comment = ""):
    full = ""
    curr = g_hashst

    if code is None:
        code = ord(replstr[0])

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
                    raise Exception("overlapping keys U+%04x (%s) and U+%04x (%s): '%s'" % (ord(curr["result"]), curr["result"], code, chr(code), cmd))

    if curr:
        print("underlapping keys %s and U+%04x (%s)" % (curr, code, cmd))
        sys.exit(1)

    curr["result"] = chr(code)

    return '<Multi_key> %s : "%s" U%s # %s' % (full, replstr, code, comment)

def stringuc(s):
    return " ".join(("<" + c + ">") for c in s)

for L in fileinput.input():
    L, pound, comment = L.partition("#")
    L = L.strip()
    if not L:
        continue

    if L[0] == 'U':
        uhex, seq = L.split()
        assert uhex[:2] == 'U+', uhex

        comment = comment.strip()
        replstr = chr(int(uhex[2:], 16))
        replch = uhex[2:]
        print(composeLine(seq, replstr, replch, comment))
    elif L[0].startswith("0x"):
        uhex, seqcode = L.split(':')



