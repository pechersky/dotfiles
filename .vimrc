set nocompatible

" Use Vundle for bundle management https://github.com/gmarik/Vundle.vim
" set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'embear/vim-localvimrc'
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
" Plugin 'valloric/youcompleteme'
"Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'
Plugin 'bling/vim-airline'
Plugin 'jeetsukumaran/vim-buffergator'
"Plugin 'kchmck/vim-coffee-script'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
"Plugin 'tpope/vim-haml'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'plasticboy/vim-markdown'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-surround'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tpope/vim-unimpaired'
Plugin 'Lokaltog/vim-easymotion'
"Plugin 'KabbAmine/zeavim.vim'
"Plugin 'ngmy/vim-rubocop'
Plugin 'kurkale6ka/vim-pairs'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'garbas/vim-snipmate'
Plugin 'godlygeek/tabular'
" Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/vimproc.vim'
"Plugin 'davidhalter/jedi-vim', {'branch': 'dev'}
Plugin 'yhat/vim-docstring'
Plugin 'heavenshell/vim-pydocstring'
Plugin 'junegunn/vader.vim'
"Plugin 'wilywampa/vim-ipython'
Plugin 'tell-k/vim-autopep8'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'alx741/vim-hindent'
Plugin 'tpope/vim-obsession'
Plugin 'mbbill/undotree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:localvimrc_ask = 0

let mapleader = ";" " Leader

set backspace=2   " Make backspace behave like in other programs
set nobackup
set nowritebackup
set noswapfile
set history=1000
set ruler
set showcmd
set laststatus=2
set number
set shortmess=atI
set hidden

" Tab settings
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype python setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype pyx setlocal ts=4 sts=4 sw=4 expandtab
set smartindent
set autoindent

set list
set listchars=
set listchars+=tab:»\
set listchars+=extends:›
set listchars+=precedes:‹
set listchars+=nbsp:·
set listchars+=trail:·

" Show column at 80
set textwidth=80
set colorcolumn=+1

" Tag completion using excuberant ctags
set complete=.,t
set tags=tags;/
set wildignore+=*/tmp/*,*/.git/*,*/.bundle/*,*/coverage/*,*/public/*,*/log/*,*/vendor/*,*/.stack-work/*

" Search settings
set incsearch
set hlsearch
set ignorecase
set infercase
set smartcase

" Solarized color scheme
syntax on
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
colorscheme solarized
set background=dark
"set t_Co=8

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
" set grepprg=grep " Use Ag over Grep
" ack settings
let g:ack_default_options = " -H --nopager --nocolor --nogroup --column"
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading " Use Ripgrep over Grep
  let g:ackprg = 'rg --vimgrep --no-heading'
endif

set grepformat=%f:%l:%c:%m,%f:%l:%m

let g:ack_autoclose = 1
let g:ack_autofold_results = 1
" let g:ctrlp_user_command = 'grep %s -l""'
let g:ctrlp_use_caching = 1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_show_hidden = 1
" bind K to grep word under cursor
"nnoremap K :silent grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
"vnoremap K y:grep! "<C-R>""<CR>:cw<CR>
nnoremap K :silent Ack! "\b<C-R><C-W>\b"<CR>
vnoremap K y:silent Ack! "<C-R>""<CR>

" xclip settings
map <Leader>x :silent :w !xclip -selection clipboard<CR><CR>
" map <Leader>x :silent :w !clip.exe<CR>
vmap <Leader>x "+y
map <Leader>y "+yy
map <Leader>Y "+y$

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCompactSexyComs = 1

" Airline settings

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

set guifont=Meslo\ LG\ M\ for\ Powerline
let g:airline_powerline_fonts = 1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols = {}
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#tabline#enabled = 1     " Show buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Only show buffer file names

" Buffergator settings
let g:buffergator_viewport_split_policy = 'R'

" Move around windows with Ctrl and movement keys
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

inoremap jj <ESC> " jj quickly for escape

map <Leader>N :NERDTreeToggle<CR>" Leader-n for NERDTree

" Always use vertical diffs
set diffopt+=vertical

" Switch between the last two files
nnoremap <Leader>z <c-^>

" Switch from old to new ruby hash syntax
nmap <Leader>h :%s/:\([^=,'"]*\) =>/\1:/gc

" Clear search with 'c' followed by '/'
map c/ :let @/ = ""<CR>

" Map TAB to do %, which is go to matching bracket/paren
" TAB is important, so only regular map
" TAB is originally move to newer cursor pos, which <C-I> does anyway
map <TAB> %

" Map <Leader>' to do <C-R>" while in command mode,
" which plugs in the current register at "
" This allows easy searching etc with recently yanked things
cnoremap <Leader>' <c-r>"

" Map <Leader>r to do _:! python %<Enter>_ which runs current file using python
nnoremap <Leader>r :! python %<Enter>

" JSON.vim settings
let g:vim_json_syntax_conceal = 0

" settings from sdiehl vim page
set nowrap
set showmode
set tw=80
set smarttab
set softtabstop=2
"set mouse=a
set clipboard=unnamedplus,autoselect

set completeopt=menuone,menu,longest

set wildmode=longest,list,full
set wildmenu
set completeopt+=longest

set cmdheight=1

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
" let g:SuperTabDefaultCompletionType = "context"

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

" ALE settings
let g:ale_fixers = {
\    'python': ['yapf'],
\}
let g:ale_linters = {
\    'haskell': ['stack-ghc-mod', 'hlint'],
\}
let g:airline#extensions#ale#enabled = 1

vmap t= :Tabularize /=<CR>
vmap t; :Tabularize /::<CR>
vmap t- :Tabularize /-><CR>

" Sign Column made by solarized color is strange, clear it.
highlight clear SignColumn
" vim-gitgutter will use Sign Column to set its color, reload it.
call gitgutter#highlight#define_highlights()

let g:haskellmode_completion_ghc = 0
let g:necoghc_use_stack = 0
let g:necoghc_enable_detailed_browse = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

"imap <c-space> <c-x><c-o>
map <Leader>tw :GhcModTypeInsert<CR>
map <Leader>ts :GhcModSplitFunCase<CR>
map <Leader>tq :GhcModType<CR>
map <Leader>te :GhcModTypeClear<CR>

" python macro to "enumerate" around a word
nmap <Leader>e ienumerate(<Esc><Esc>t:a)<Esc><Esc>

let g:ctrlp_custom_ignore = 'tasks_output\|tasks_running'

" autocmd FileType python setlocal omnifunc=jedi#completions
"let g:jedi#completions_enabled = 0
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#popup_on_dot = 0
"let g:jedi#show_call_signatures = 1
""Fix E121: Undefined variable: g:neocomplete#force_omni_input_patterns
"if !exists('g:neocomplete#force_omni_input_patterns')
  "let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.python =
"\ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
 "alternative pattern: '\h\w*\|[^. \t]\.\w*'

" Indent Python in the Google way.

setlocal indentexpr=GetGooglePythonIndent(v:lnum)

let s:maxoff = 50 " maximum number of lines to look backwards.

function GetGooglePythonIndent(lnum)

  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)

endfunction

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"

"only if yhat/vim-docstring is installed
autocmd FileType python PyDocHide

nmap <silent> <Leader>i <Plug>(pydocstring)
let g:pydocstring_templates_dir="~/doctemplates/"

"turn off sound bells
set noeb vb t_vb=
if has('autocmd')
  autocmd GUIEnter * set vb t_vb=
endif

"source ~/.vim/bundle/vim-ipython/ftplugin/python/ipy.vim

" autopep8 settings
autocmd FileType python vnoremap <silent> <Leader>A j:Autopep8<CR>
let g:autopep8_indent_size=2
let g:autopep8_disable_show_diff=0
let g:autopep8_max_line_length=120

" undofile settings
if has('persistent_undo')
  set undodir=~/.undodir/
  set undofile
endif
map <Leader>U :UndotreeToggle<CR>

" neovimhaskell/haskell-vim

" Align 'then' two spaces after 'if'
let g:haskell_indent_if = 2
" Indent 'where' block two spaces under previous body
let g:haskell_indent_before_where = 2
" Allow a second case indent style (see haskell-vim README)
let g:haskell_indent_case_alternative = 1
" Only next under 'let' if there's an equals sign
let g:haskell_indent_let_no_in = 0

" hindent & stylish-haskell

" Indenting on save is too aggressive for me
let g:hindent_on_save = 0

" Helper function, called below with mappings
function! HaskellFormat(which) abort
  if a:which ==# 'hindent' || a:which ==# 'both'
    :Hindent
  endif
  if a:which ==# 'stylish' || a:which ==# 'both'
    silent! exe 'undojoin'
    silent! exe 'keepjumps %!stylish-haskell'
  endif
endfunction

" Key bindings
augroup haskellStylish
  au!
  " Just hindent
  au FileType haskell nnoremap <leader>hi :Hindent<CR>
  " Just stylish-haskell
  au FileType haskell nnoremap <leader>hs :call HaskellFormat('stylish')<CR>
  " First hindent, then stylish-haskell
  au FileType haskell nnoremap <leader>hf :call HaskellFormat('both')<CR>
augroup END

" fasta file settings
autocmd BufRead,BufNewFile *.fasta set tw=80

" toggle term styles
function! ToggleTermStyle()
  if &term ==# "xterm-256color"
    set term=xterm
  else
    set term=xterm-256color
  endif
endfunction

map <Leader>Zt :call ToggleTermStyle()<CR>
