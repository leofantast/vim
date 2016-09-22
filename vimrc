"================================================
"
" Author	:	Ycc
"
" Email		:	609918436@qq.com
"
" LastModified	:	2015-03-25 22:40
"
" Filename	:	.vimrc
"
"================================================


" =======================================================================================
" 这一堆是使用bundle所需要的配置
" =======================================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
 
Plugin 'davidhalter/jedi-vim'

" NerdTree and git Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" emmet
Plugin 'mattn/emmet-vim'

" colorschemes
Plugin 'flazz/vim-colorschemes'

" 代码检查
Plugin 'scrooloose/syntastic'

Plugin 'majutsushi/tagbar'

Plugin 'airblade/vim-gitgutter'

Plugin 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" =======================================================================================

execute pathogen#infect()


" 每次保存.vimrc文件时自动重载文件
" autocmd! bufwritepost .vimrc source %

" 使用相对路径的目录
" autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

" 去掉vi的一致性模式，我也不知道搞毛毛
set nocompatible

set backspace=indent,eol,start

" 去除启动界面
set shortmess=atI 

" 设置标签栏
set showtabline=2

" 显示行号
set number

" 检测文件类型
filetype plugin indent on

" 设置高亮
syntax enable

" 设置颜色，添加CSAPPROX的支持
set t_Co=256

" 设置utf8编码
set fileencodings=utf-8,gbk,cp936
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8

if has("win32")
    set guifont=Consola:h12
    set guifontwide=NSimsun:h12
endif

" 设置主题
colorscheme flattown

" 设置标签栏与状态栏颜色
hi TabLine ctermfg=white ctermbg=DarkGray
hi TabLineFill ctermfg=DarkGray
hi TabLineSel ctermfg=black ctermbg=Gray
hi StatusLine ctermfg=DarkGray ctermbg=white


" 这个不知道
set virtualedit=block

set laststatus=2

" set statusline=
" set statusline+=[%n]\ "buffer number
" set statusline+=%<%f\ "File+path
" set statusline+=%=%{strftime('%I:%M')}\ \ "Current time
" set statusline+=%y\ \ "FileType
" set statusline+=%{''.(&fenc!=''?&fenc:&enc).''} "Encoding
" set statusline+=%{(&bomb?\",BOM\":\"\")}/ "Encoding2
" set statusline+=%{&ff}\ "FileFormat (dos/unix..)
" set statusline+=\ row:%l/%L\ \ "Rownumber/total (%)
" set statusline+=col:%03c\ "Colnr
" set statusline+=\ %m%r%w\ %P\ \ "Modified? Readonly? Top/bot.

" 设置历史条数
set history=50

" 自动更新文件
set updatetime=10

" 设置帮助信息为中文
set helplang=cn

" 设置自动对齐
set autoindent
set smartindent

" 设置c系缩进方式
set cindent

set tabstop=4

" 空格替换Tab
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab

" 增强命令补全
set wildmenu

" 搜索设置
set hlsearch
set incsearch  " 搜索时光标跟随跳动
set magic

" 状态栏显示目前所执行的指令
set showcmd

" 列控制
" set linebreak
" set textwidth=80
set wrap
set ruler

" 自动重载文件
set autoread

" 设置鼠标可用
set mouse=""

" 共享外部剪贴板
set clipboard=unnamed

" set foldmethod=indent
" set foldnestmax=1
 
" press space to fold/unfold code
nnoremap <space> za
vnoremap <space> zf

" =========
" AutoCmd
" =========
if has("autocmd")
    filetype plugin indent on
    " 括号自动补全
    func! AutoClose()
        :inoremap ( ()<ESC>i
        :inoremap " ""<ESC>i
        :inoremap ' ''<ESC>i
        :inoremap [ []<ESC>i
        " 输入一个花括号时自动换行缩进
        " :inoremap { {<CR>}<ESC>kA<CR>
        :inoremap { {}<ESC>i
        :inoremap [ []<ESC>i
        :inoremap ) <c-r>=ClosePair(')')<CR>
        :inoremap } <c-r>=ClosePair('}')<CR>
        :inoremap ] <c-r>=ClosePair(']')<CR>
    endf
    func! ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
            return "\<Right>"
        else
            return a:char
        endif
    endf
"""""""""""""""""""""""""""""""""""""""""""""
    augroup vimrcEx
        au!
        autocmd FileType text setlocal textwidth=80
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal g`\"" |
                    \ endif
    augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Auto close quotation marks for PHP, Javascript, etc, file
    au FileType python,php,javascript,c,cpp exe AutoClose()
    " JavaScript 语法高亮
    au FileType html,javascript let g:javascript_enable_domhtmlcss = 1
    au BufRead,BufNewFile *.js setf jquery
    " 给各语言文件添加 Dict
    if has('win32')

        let s:dict_dir = $VIM.'\vimfiles\dict\'
    else
        let s:dict_dir = $HOME."/.vim/dict/"
    endif
    let s:dict_dir = "setlocal dict+=".s:dict_dir
    au FileType php exec s:dict_dir."php_funclist.dict"
    au FileType css exec s:dict_dir."css.dict"
    au FileType javascript exec s:dict_dir."javascript.dict"
    " 格式化 JavaScript 文件
    au FileType javascript map <f12> :call g:Jsbeautify()<cr>
    au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    " 增加 ActionScript 语法支持
    au BufNewFile,BufRead,BufEnter,WinEnter,FileType *.as setf actionscript
    " CSS3 语法支持
    au BufRead,BufNewFile *.css set ft=css syntax=css3
    " 增加 Objective-C 语法支持
    au BufNewFile,BufRead,BufEnter,WinEnter,FileType *.m,*.h setf objc
    " 将指定文件的换行符转换成 UNIX 格式
    au FileType php,javascript,html,css,python,vim,vimwiki set ff=unix
    " 自动最大化窗口

    " 给py文件添加文件头信息
    autocmd BufNewFile *.py exec ":call PyHeader()"
    func PyHeader()
        call setline(1, "#!/usr/bin/env python")
        call setline(2, "# -*- coding:utf8 -*-")
        call setline(3, "")
        call setline(4, "")
        normal G
    endfunc

endif

"--ctags setting--
    " 按下F5重新生成tag文件，并更新taglist
    " map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
    " map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
    " imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
    " set tags=tags
    " set tags+=~/.vim/tags/STLTags "add current directory's generated tags file
    " set tags+=~/.vim/tags/LibTags

"-- omnicppcomplete setting --
"     set nocp
"     filetype plugin on
"     " 按下F4自动补全代码，注意该映射语句后不能有其他字符，包括tab；否则按下F4会自动补全一些乱码
"     imap <F4> <C-X><C-O>
"     " 按下F2根据头文件内关键字补全
"     imap <F2> <C-X><C-I>
"     set completeopt=menu,menuone " 关掉智能补全时的预览窗口
"     let OmniCpp_MayCompleteDot = 1 " autocomplete with .
"     let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
"     let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
"     let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
"     let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
"     let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
"     let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
"     let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
"     let OmniCpp_DefaultNamespaces=["std"]
"     let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
"     let OmniCpp_ShowAccess=1 

"-- Taglist setting --
    let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
    let Tlist_Use_Right_Window=1 "让窗口显示在右边，0的话就是显示在左边
    let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表
    let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
    let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
    "是否一直处理tags.1:处理;0:不处理
    let Tlist_Process_File_Always=1 "实时更新tags
    let Tlist_Inc_Winwidth=0
    let Tlist_GainFocus_On_ToggleOpen=1 " 打开Tlist的时候获得焦点


"-- TagBar settings --
nmap <F8> :TagbarToggle<CR>

"-- NerdTree settings --
nmap <F3> :NERDTreeFocus<CR>
let NERDTreeIgnore=['\.pyc$']

"-- syntastic setting --
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq =0

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

let g:syntastic_python_flake8_args = '--ignore=E221'

"-- airline settings --
let g:airline_theme="bubblegum"
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1

" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
" 映射<leader>num到num buffer
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

"-- jedi settings --
let g:jedi#completions_enabled = 1
" let g:jedi#use_splits_not_buffers = "right"

"-- emmet settings --
let g:user_emmet_mode='n'

"================================================
" KeyMap 键值映射
"================================================

" 全选
map <C-A> ggVG
map! <C-A> <ESC>ggVG

" 选中时复制
" vmap <C-c> yGe

" 选中缩进时不退出选中
vnoremap < <gv
vnoremap > >gv

" wrapped line goes down/up to next row, rather than next line
noremap j gj
noremap k gk

" quickfix jump
noremap <F4> :Ack -i 
noremap <F2>c :cclose<CR>
noremap <F2>n :cnext<CR>
noremap <F2>N :cprevious<CR>
