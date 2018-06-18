- Maintainer: [Saul Pwanson (saul.pw)](http://saul.pw)
- Platform: Linux/Ubuntu
- Updated: 2018-03-24

# Using my dotfiles

I run this command in every new unix account I get:

`curl -L saul.pw/setup.sh | sh -`

You may have to `reset` afterwards.

I use these utilities/packages/components:

`mosh tmux tmate zsh ohmyzsh vim urxvt fonts-inconsolata visidata irssi nethack`

- mosh+tmux+irssi for chat
- tmate+vim for remote pairing

I am grateful to each of the creators of these components, for their taste and devotion to quality.

Please share and enjoy my contribution [VisiData](http://visidata.org/) to the terminal lifestyle.


# Tips

  - backtick prefix for tmux
  - consistent window splitting with prefix-|\_ and moving with prefix-hjkl in all layers: vim, tmux, and i3
  - prefer dark theme for shell and light theme for editor so i can tell which is which in a split tmux session
  - use a vim package manager.  vundle works fine.


# Aspirations

I aspire to more consistently use:

- ctags/cscope
- ack/fd
- vimdiff
- vgit

# Wishlist

- tmux allowing different users to type in different panes in the same window
- tmate allowing different users to be in different windows
