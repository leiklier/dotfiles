" Disable the annoying hiding of $´s etc
let g:tex_conceal = ""
" Use Skim.app as default pdf-viewer
let g:vimtex_view_method = 'skim'

" Enable matchup in LaTeX files
let g:matchup_override_vimtex = 1

" Let inverse search work with neovim using neovim-remote
" (must be installed using pip)
let g:vimtex_compiler_progname = "nvr"
