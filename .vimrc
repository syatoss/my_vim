syntax on


"nerdtree setters:
set encoding=UTF-8
set mouse=a
set statusline=%f
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set cursorline
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set scrolloff=8
set relativenumber
set rnu
set undodir=~/.vim/undodir
set undofile
set incsearch
set t_Co=256
"syntastic setters:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set nocompatible

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'jremmen/vim-ripgrep'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'szw/vim-maximizer'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
"syntax highliter for tsx
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'


call plug#end()

set background=dark
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
highlight LineNr ctermfg=NONE ctermbg=NONE
hi Pmenu ctermbg=242 ctermfg=255

"colloring for tsx---------------------------

" dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic
"---------------------------------------------


if executable('rg')
    let g:rg_derive_root = 'true'
endif

let g:ctrlp_user_command = ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standatd']
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:ctrlp_use_caching=0
let g:rg_command = 'rg --vimgrep -S'
"syntastic lets:
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:coc_global_extensions = [ 'coc-tsserver' ]
let g:coc_global_extensions = [ 'coc-clangd' ]
let g:polyglot_disabled = ['typescript']
let g:polyglot_disabled = ['python']
let g:polyglot_disabled = ['jsx']
let g:polyglot_disabled = ['json']
let g:polyglot_disabled = ['javascript']
let g:polyglot_disabled = ['html5']
let g:polyglot_disabled = ['c/c++']
let g:polyglot_disabled = ['scss']
"let g:syntastic_javascript_checkers = ['eslint'] //causing preformance issues


nnoremap <leader>h :wincmd h  <CR>
nnoremap <leader>j :wincmd j  <CR>
nnoremap <leader>k :wincmd k  <CR>
nnoremap <leader>l :wincmd l  <CR>
nnoremap <leader>m :MaximizerToggle  <CR>
nnoremap <leader>s :w <CR>
nnoremap <leader>u :UndotreeShow  <CR>
nnoremap <leader>pv :NERDTreeToggle <CR>
nnoremap <Leader>ps :Rg <SPACE>
nnoremap <silent>  <Leader>+ :vertical resize +5<CR>
nnoremap <silent>  <Leader>- :vertical resize -5<CR>
nnoremap gc +y
nnoremap gv +p
vnoremap gc +y
vnoremap gv +p
nnoremap ge $
vnoremap ge $
nnoremap dge d$
nnoremap -0 o<ESC>
nnoremap <leader>qq :q <CR>
nnoremap <leader>qf :q! <CR>
nnoremap <leader>qw :wq! <CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>


map  <leader>gd <Plug>(coc-definition)
nmap  <leader>gy <Plug>(coc-type-definition)
nmap  <leader>gi <Plug>(coc-implementation)
nmap  <leader>gr <Plug>(coc-references)
nnoremap  <leader>cr :CocRestart


map ./ :call Comment()<CR>
map /. :call Uncomment()<CR>

function! Comment()
	let ft = &filetype
	if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl'
		silent s/^/\#/
	elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go'
		silent s:^:\/\/:g
	elseif ft == 'tex'
		silent s:^:%:g
	elseif ft == 'vim'
		silent s:^:\":g
	endif
endfunction

function! Uncomment()
	let ft = &filetype
	if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl'
		silent s/^\#//
	elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go'
		silent s:^\/\/::g
	elseif ft == 'tex'
		silent s:^%::g
	elseif ft == 'vim'
		silent s:^\"::g
	endif
endfunction


function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end











