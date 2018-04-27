call plug#begin()
" predawn color scheme
Plug 'juanedi/predawn.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" syntax checking
Plug 'w0rp/ale'

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

" work with matching pairs of brackets or quotes
Plug 'tpope/vim-surround'

" distraction free mode
Plug 'junegunn/goyo.vim'

" focus mode
Plug 'junegunn/limelight.vim'

" Markdown support
Plug 'gabrielelana/vim-markdown'

" file tree
Plug 'scrooloose/nerdtree'

call plug#end()

" ale config
let g:ale_statusline_format = ['⨉ %d', '⚠ v%d', '⬥ ok']
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '⚠'

highlight clear ALEErrorSign
highlight clear ALEWarningSign

" airline config
let g:airline#extensions#tabline#enabled = 1

" markdown config
let g:markdown_enable_spell_checking = 0

" goyo workaround for closing and exiting
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" keyboard setup
let mapleader = "\<Space>"
map <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <C-t> :FZF -m<cr>
nnoremap <silent> <leader>, :Goyo<cr>

" syntax and colorscheme
syntax on
colorscheme predawn
set mouse=a
