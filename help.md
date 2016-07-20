
== tmux

^H/^J/^K/^L   Left/Down/Up/Right to next vim/tmux pane
` `     literal backtick (`)
` ]     resize current pane to 16 rows high
` \     resize current pane to 80 chars wide
` |     new horiz to the right
` -     new pane below
` b     break off pane into new window
` Del   kill pane
` S-Del kill window
` f     fullscreen pane

== vim
^L      clear search highlights
^\      Previous split
\ f     fullscreen pane
\ -     horiz split
\ |     vert split
\ Del   quit all


prev/next/first/last
[a  ]a  [A  ]A    file on command line
[f  ]f  [F  ]F    file in the directory of the current file
[b  ]b  [B  ]B    buffer
[l  ]l  [L  ]L    location
[q  ]q  [Q  ]Q    error
[t  ]t  [T  ]T    tag
[n  ]n  [N  ]N    conflict marker

[C-L     ]C-L     lpfile
[C-Q     ]C-Q     cpfile (Note that <C-Q> only works in a terminal if you disable flow control: stty -ixon)

[<Space> ]<Space> Add [count] blank lines above/below the cursor.
[e       ]e       Exchange the current line with [count] lines above/below it.

On	Off	Toggle	Option
[ob	]ob	cob	'background' (dark is off, light is on)
[oc	]oc	coc	'cursorline'
[od	]od	cod	'diff' (actually |:diffthis| / |:diffoff|)
[oh	]oh	coh	'hlsearch'
[oi	]oi	coi	'ignorecase'
[ol	]ol	col	'list'
[on	]on	con	'number'
[or	]or	cor	'relativenumber'
[os	]os	cos	'spell'
[ou	]ou	cou	'cursorcolumn'
[ov	]ov	cov	'virtualedit'
[ow	]ow	cow	'wrap'
[ox	]ox	cox	'cursorline' 'cursorcolumn' (x as in crosshairs)

