filetype plugin indent on
filetype on
syntax on

set nocompatible hidden laststatus=2
set backspace=indent,eol,start

let g:mapleader=" "
let g:just_installed = 0

function! InstallPlug()

  if !filereadable(expand("~/.vim/autoload/plug.vim"))
    " try to install plug using curl and wget
    " If installation succeeds, we should source vim plug.

    if !executable('git')
      echom 'git not found.'
      finish
    endif

    if executable('curl')
      let result = system('curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
      if v:shell_error == 0
        let g:just_installed = 1
        return
      endif
    endif

    echom 'curl failed, trying wget. ' . result

    if executable('wget') && executable('mkdir')
      let result = system('mkdir -p ~/.vim/autoload && wget -O ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
      if v:shell_error == 0
        let g:just_installed = 1
        return
      endif
    endif

    echom 'wget failed too. ' . result
    finish

  endif
endfu

call InstallPlug()

if g:just_installed == 1
  source ~/.vim/autoload/plug.vim
endif

call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
Plug 'bagrat/vim-buffet'

Plug 'catppuccin/vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/seoul256.vim'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

call plug#end()


" options
set nu
set rnu

set mouse+=a
set linebreak
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set shiftround
set autoindent
set textwidth=80
set colorcolumn=80
set nowrap

set undodir=~/.vim/undofiles
set undofile nohlsearch incsearch
set scrolloff=7
set wildmode=longest,list,full
set wildmenu


autocmd FileType tex,text set nosmarttab autoindent
autocmd Filetype python set textwidth=0 formatprg=autopep8 shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType c,cpp,slang set nosmarttab autoindent
autocmd Filetype markdown set nosmarttab shiftwidth=4 tabstop=4  softtabstop=4 autoindent

autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

" Remaps
nnoremap j gj
nnoremap k gk

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap <A-a> ā
inoremap <A-e> ē
inoremap <A-i> ī
inoremap <A-o> ō
inoremap <A-u> ū

nnoremap <F12> :w<BAR>:!texbld run compile<CR>
nnoremap <F5> :w<BAR>:!./test.sh<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap J mzJ`z
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

xnoremap <leader>p _dP
vnoremap <leader>y +y
nnoremap <leader>y +y
nnoremap <leader>Y +Y
nnoremap <leader>x :!chmod +x %:p<CR>
nnoremap <leader>X :!chmod -x %<CR>
nnoremap <leader>e :! %:p<CR>

nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

nnoremap <leader>c :Bw<CR>
nnoremap <leader>C :Bw!<CR>

nnoremap <leader>b :wprev<CR>
nnoremap <leader>n :wnext<CR>

" netrw
nnoremap <C-n> :20Lexplore<CR>
nnoremap <leader>pv :Explore<CR>

" tmux
let s:tmux=$TMUX
if s:tmux != ''
  nnoremap <C-f> <cmd>!tmuxs<CR>
endif

" disable accidental ex mode
nnoremap Q <nop>

" Plugin options must go at the bottom of the file.
" install plugins

if g:just_installed == 1
  echom 'Installing Plugins...'
  PlugInstall
endif

" Goyo and themes

function! Catppuccin()
  set background=dark
  colorscheme catppuccin_mocha
  let g:airline_theme = "catppuccin_mocha"
endfu

function! SolarizedLight()
  colorscheme solarized8
  set background=light
  let g:airline_theme = "solarized"
endfu

function! SolarizedDark()
  colorscheme solarized8
  set background=dark
  let g:airline_theme = "solarized"
  let g:airline_solarized_bg='dark'
endfu

function! Gruvbox()
  set background=dark
  colorscheme gruvbox
  let g:airline_theme = "gruvbox"
endfu

function! MonokaiPro()
  set background=dark
  colorscheme monokai_pro
  let g:airline_theme = "base16_monokai"
endfu

function! Nord()
  set background=dark
  colorscheme nord
  let g:airline_theme = "nord"
endfu

function! Seoul256()
  let g:seoul256_background = 234
  let g:airline_theme = "seoul256"
  set background=dark
  colorscheme seoul256
endfu

if has('termguicolors')
  set termguicolors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  call Seoul256()
else
  call Seoul256()
endif

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1

nnoremap <leader>z :Goyo <CR>
nnoremap <leader>gs :Git <CR>

nnoremap <leader>ff :Files<CR>
nnoremap <C-p> :GFiles<CR>

" lsp

set cot+=preview

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <leader>ft :LspDocumentFormat<CR>

    let g:lsp_format_sync_timeout = 1000
endfunction

if exists('*prop_add') && has('patch-9.0.0178')
  let g:lsp_diagnostics_virtual_text_enabled = 1
  let g:lsp_diagnostics_virtual_text_align = "after"
  let g:lsp_diagnostics_virtual_text_padding_left = 5
else
  let g:lsp_diagnostics_float_cursor = 1
  let g:lsp_diagnostics_float_delay = 200
endif

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

imap <c-space> <Plug>(asyncomplete_force_refresh)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
