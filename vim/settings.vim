" Paths to directories
let pluginsdir = '~/.vim/settings/plugins' " Directory where plugin-sepecific settings are stored
let miscdir    = '~/.vim/settings/misc'    " Directory where all other settings are stored
let keymapsdir = '~/.vim/settings/keymaps' " Directory where keymaps are stored

let uname = system("uname -s")

" keymaps
for fpath in split(globpath(keymapsdir, '*.vim'), '\n')

  if (fpath == expand(keymapsdir) . "/keymap-mac.vim") && uname[:4] ==? "linux"
    continue "skip mac mappings for linux
  endif

  if (fpath == expand(keymapsdir) . "/keymap-linux.vim") && uname[:4] !=? "linux"
    continue " skip linux mappings for mac
  endif

  exe 'source' fpath

endfor


" plugins
for fpath in split(globpath(pluginsdir, '*.vim'), '\n')
  " Source each file in pluginsdir
  exe 'source' fpath
endfor


" misc
for fpath in split(globpath(miscdir, '*.vim'), '\n')
  " Source each file in miscdir
  exe 'source' fpath
endfor
