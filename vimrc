filetype off                  " required
syntax on

let mapleader=','
set nocompatible              " be iMproved, required
set ru
set incsearch
set hls
set nowrap                    " 禁止折行
set expandtab
set tabstop=4
set shiftwidth=4              " 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
set backspace=indent,eol,start
set cursorcolumn 
set cursorline
set number
set guifont=Hack:h16
set splitbelow
set splitright
set t_CO=256
set guioptions-=e
set guioptions-=r
set showcmd
set noerrorbells visualbell t_vb=
set nobackup

" vim的基本配置
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"------ 键盘映射
map <D-R> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nmap <Leader>ev :e $MYVIMRC<CR>
nmap <C-j> <C-W><C-J>
nmap <C-k> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-l> <C-W><C-L>

"------ 自动执行命令
autocmd BufWritePost .vimrc source %

"------ NERDTree
nmap <D-1> :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=0

"------ CtrlP配置
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore= 'node_modules\DS_Store\|git'
let g:ctrlp_match_window='top,order:ttb,min:1,max:30,results:30' 
nmap <D-7> :CtrlPBufTag<CR>
nmap <D-e> :CtrlPMRUFiles<CR>
nmap <D-p> :CtrlP<CR>

"----- skwp/greplace.vim
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'tpope/vim-vinegar'
Plugin 'L9'
Plugin 'scrooloose/nerdtree'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'
Plugin 'msanders/snipmate.vim'
Plugin 'tpope/vim-surround'
Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'nathanaelkane/vim-indent-guides'

"----- vim php namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')  
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>


" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
Plugin 'https://github.com/jdkanani/vim-material-theme.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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
"f::
" Put your non-Plugin stuff after this line

" 添加代码可视化缩进提示
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

