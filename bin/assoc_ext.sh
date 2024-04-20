#!/usr/bin/env bash

# Usage: $0 <cmd> <fn.ext>

#  Associate terminal command <cmd> to run with files of type <ext> via xdg-open.  Discovers mimetype from <fn.ext>

CMD=$1
SAMPLEFN=$2

EXT="${SAMPLEFN##*.}"
DESKTOPFN=~/.local/share/applications/$EXT.desktop

MIMETYPE=$(mimetype -b "$SAMPLEFN")

cat > $DESKTOPFN <<-EOF
[Desktop Entry]
Type=Application
Name=$CMD
Exec=$CMD %f
Icon=epr
Terminal=true
Categories=Utility;
MimeType=text/plain;$MIMETYPE
EOF

chmod +x $DESKTOPFN
update-desktop-database `dirname $DESKTOPFN`
xdg-mime default $EXT.desktop $MIMETYPE

echo Created $DESKTOPFN
echo open anyfile.$EXT
