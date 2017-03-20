call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" syntax checking
Plug 'w0rp/ale'

" navigation between files
Plug 'ctrlpvim/ctrlp.vim'

" better git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" better status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" snippets
Plug 'vim-scripts/tlib'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'

" better indending for Python
Plug 'hynek/vim-python-pep8-indent'
Plug 'thiderman/python-syntax'

" quick commenting and uncommenting
Plug 'scrooloose/nerdcommenter'

" jump to definitions, do refactoring
" (TOO SLOW)
"Plug 'davidhalter/jedi-vim'

" work with matching pairs of brackets or quotes
Plug 'tpope/vim-surround'

call plug#end()

let g:ale_statusline_format = ['⨉ %d', '⚠ v%d', '⬥ ok']
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '⚠'

highlight clear ALEErrorSign
highlight clear ALEWarningSign
