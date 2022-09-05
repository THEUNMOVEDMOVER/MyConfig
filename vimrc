set nocompatible
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8 
set encoding=utf-8 


"+----------------------------------+
"|          For Vundle              | 
"+----------------------------------+
filetype off 
set shellslash 
set rtp+=~/vimfiles/bundle/Vundle.vim 
call vundle#begin('~/vimfiles/bundle')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' 
Plugin 'vim-airline/vim-airline'
"Plugin 'iamcco/markdown-preview.vim' 
Plugin 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': 'markdown' }
Plugin 'plasticboy/vim-markdown' 
Plugin 'dhruvasagar/vim-table-mode' 
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'junegunn/vim-peekaboo'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"Plugin 'mattn/emmet-vim'
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"Twice space to jump to the next target postion target by <:)>
map <LEADER><LEADER> <Esc>/<:)><CR>:nohlsearch<CR>c4l

"+----------------------------------+
"|
"+----------------------------------+
"displaying Chinese characters.
"displaying Chinese characters in the menu bar.
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"hiding the menu bar.
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=b

"my personal settings.
let mapleader = ' '
set number 
set relativenumber
set cursorline
set scrolloff=25      "always remains five lines below or up your censor
set noerrorbells
set visualbell
color evening 
set guifont=Courier_new:h14
syntax enable
syntax on


noremap <LEADER><CR> :nohlsearch<CR> 
noremap n nzz
noremap N Nzz

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i

noremap J 5j
noremap K 5k

map Q :q<CR>
map S :w<CR>
map R :source $MYVIMRC<CR>

set cursorline
highlight CursorLine   cterm=NONE ctermbg=white ctermfg=black guibg=NONE guifg=NONE
set wrap
set showcmd
set wildmenu
set ignorecase
set smartcase

" show the space in the end of a line.
"set list
"iset listchars=tab:▸\ ,trail:▫


"change the tap to suit python better.
set tabstop=2
set shiftwidth=2
set softtabstop=2

"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set laststatus=2


"create a tabe and switch between them.
map tu :tabe<CR>
map tn :-tabnext<CR>
map ti :+tabnext<CR>

"+----------------------------------+
"|           vim-airline            |
"+----------------------------------+
let g:airline#extensions#tabline#enabled = 1 "display: 'tab' and 'buffer' in the window.

"+----------------------------------+
"|           vim-markdown           |
"+----------------------------------+
set conceallevel=2 "enable concealing for some syntax.
let g:vim_markdown_folding_disabled = 1 "disable default folding.

"autocmd Filetype markdown inoremap ;l --------<Enter>

"+----------------------------------+
"|          For UltiSnips           |
"+----------------------------------+
let g:UltiSnipsExpandTrigger="<c-w>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsSnippetDirectories=["vim-snippets"]


"+----------------------------------+
"|          vim-table-mode          |
"+----------------------------------+
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'



"+----------------------------------+
"|            coc-yank              |
"+----------------------------------+
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>







"+----------------------------------+
"|         Compile function         |
"+----------------------------------+
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc



"+----------------------------------+
"|           Call figlet            |
"+----------------------------------+
" maybe using for product some big text word.
map tx :r !figlet 






if has('python3')
  silent! python3 1
endif


"+----------------------------------+
"|     Only for windows uses
"+----------------------------------+

set pythonthreedll=C:/Users/HsinChang/AppData/Local/Programs/Python/Python37-32/python37.dll
"let &pythonthreedll = 'C:\set pythonthreedll=C:/Users/13317/AppData/Local/Programs/Python/Python37/python37.dll '




"set the windowsize.
set lines=112 columns=66
"set the start position.
winpos 1500 0
"enable backspace.
set backspace=2


" ctrl x s   拼写检查，如何改成英文
" ctrl o i   之前输入的位置
" w 指定保存路径（在没有当前目录权限时
" : !表面使用终端指令
" w !sudo tee %
" 强行保存非sudo权限打开的文件
" https://phoenixnap.com/kb/linux-tee#:~:text=What%20Does%20tee%20Command%20Do,can%20precede%20or%20follow%20it.
"
" 寻找下一个目标字符并删除并进入写入模式<:)>
" : normal :(<:)>)
"
"
" figlet
"
"var a = 9;
" ctrl + a
