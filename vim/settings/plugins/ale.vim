" Let ALE integrate with Airline in a nice format
let g:airline#extensions#ale#enabled = 1

" Let ALE parse C/C++ Makefile to detect flags:
let g:ale_c_parse_makefile = 1

" Change which linters ALE should use
let g:ale_linters = {
\   'javascript': ['standard'],
\}
