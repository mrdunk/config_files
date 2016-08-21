:
"
" https://github.com/tpope/vim-pathogen
" https://github.com/scrooloose/syntastic
" https://github.com/jeetsukumaran/vim-buffergator
" https://github.com/ctrlpvim/ctrlp.vim
" https://github.com/noah/vim256-color
" https://github.com/octol/vim-cpp-enhanced-highlight

" Some keys:
" <Ctrl-w> s         Split screen horizontally.
" <Ctrl-w> v         Split screen vertically.
" <Ctrl-w> =         Normalise window sizes.
" <Ctrl-w> <cursor>  Move focus to different view.
" <Ctrl-w> H/J/K/L   Move current view to left/top/bottom/right.
" <Ctrl-w> T         Move view to it's own tab.
" g t                Goto next tab.
" g b                Goto next buffer.
" \ b                Use BufferGator to select a buffer.
" \ B                Close BufferGator.
" \ to               Use BufferGator to select a tab.
" \ tc               Close BufferGator tabs.
" \ <cursor>         Split focused view in this direction.
" <Ctrl-p>           Open ctrlp.vim for opening files.

" Loader for plugins.                                                           
execute pathogen#infect()

set nocompatible                          " Prevent vim from emulating vi
syntax on                                 " Syntax highlighting
set showmatch                             " Show matching [] and {}           
set colorcolumn=80                        " Mark 80 columns with red bar
set shell=/bin/bash                       " Set shell to bash
                                           " Make tab key emmit 2 spaces.
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab cindent

set relativenumber                        " Make line numbers relative.
set number                                " Actual Line number at current pos.
autocmd WinLeave * :set norelativenumber  " Revert to regular when leave window.
autocmd WinEnter * :set relativenumber

set pastetoggle=<Insert>                  " Make Insert key toggle paste mode.

" We can save an open vim session with :mksession.
set ssop-=options           " do not store global and local values in a session
set ssop-=folds             " do not store folds

autocmd ColorScheme * call TweakColorscheme()
function TweakColorscheme()
  " Spell check on
  set spell spelllang=en
  setlocal spell spelllang=en
  " Spelling highlighting
  highlight clear SpellBad
  highlight SpellBad term=underline cterm=underline
  highlight clear SpellCap
  highlight SpellCap term=underline cterm=underline
  highlight clear SpellRare
  highlight SpellRare term=underline cterm=underline
  highlight clear SpellLocal
  highlight SpellLocal term=underline cterm=underline
endfunction

" colorscheme heroku-terminal                     " Medium contrast. Blue, Grey.
" colorscheme liquidcarbon                        " Classic.
" colorscheme cobalt2 | set background=light      " Classic looks. Colorful.
" colorscheme badwolf | set background=light      " High contrast,
colorscheme gruvbox | set background=dark       " Pretty, low contrast.
" colorscheme elflord | set background=light
" colorscheme 256-jungle | set background=light   " Medium contrast.
" colorscheme zenburn                             " Subtle.

set laststatus=2  " Always show status line.

set statusline=                              " clear the statusline for when vimrc is reloaded
set statusline+=[%n]\                        " buffer number
set statusline+=%f%m\                        " filename, modified flag
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=(%c:%l/%L)\                " right-alligned (column:line/maxlines)


" https://github.com/scrooloose/syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_compiler_options = ' -std=c++11 -Wall -Wextra -Wpedantic'
let g:syntastic_cpp_check_header = 1

let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_aggregate_errors = 1
