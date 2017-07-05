" File-name:        cursor.vim
" Purpose of file:  Enable dynamic cursor in vim, depending
"                   on the current mode:
"                   NORMAL  MODE = Block
"                   INSERT  MODE = Line
"                   REPLACE MODE = Underline
" For more info, please read:
" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes

" =======================  CURSOR SHAPE  ==========================

" ------------  For tmux running in iTerm2 on macOS  --------------
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" =======================  CURSOR COLOR  ==========================
" TODO: Cursor should be white/grey-ish in normal mode and yellow in insert
" mode
