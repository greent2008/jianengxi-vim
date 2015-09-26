syntax on
filetype off

" format and user interface
set nocompatible
set number
set softtabstop=4 tabstop=4 shiftwidth=4
set expandtab
set autoindent
set hlsearch
set mouse=a 
set cursorline 
set laststatus=2
set backspace=2

" initialize vundle
if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
    !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" feature bundles
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'mattn/emmet-vim'
" file type bundles
Bundle 'kchmck/vim-coffee-script'
Bundle 'derekwyatt/vim-scala'
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'sophacles/vim-bundle-mako'
Bundle 'othree/html5.vim'
Bundle 'sprsquish/thrift.vim'
Bundle 'tonyseek/rust.vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'wavded/vim-stylus'
Bundle 'jansenm/vim-cmake'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tfnico/vim-gradle'
Bundle 'cespare/vim-toml'
Bundle 'evanmiller/nginx-vim-syntax'
" theme bundles
Bundle 'tomasr/molokai'

" indent bundles
Bundle 'Yggdroot/indentLine'

" YCM bundle
Bundle "Valloric/YouCompleteMe"

" key mapping
let mapleader=","
imap jk <ESC>
imap Jk <ESC>
imap JK <ESC>
imap jK <ESC>
nmap 1 ^
nmap 0 $
nmap <Leader>tb :TagbarToggle<CR>
nmap <Leader>tt :NERDTreeToggle<CR>
nmap <Leader>nt :tabnew<CR>
nmap <TAB> :tabn<CR>
nmap <C-J> <C-W>j<C-W>_
nmap <C-K> <C-W>k<C-W>_
nmap <C-L> <C-W>l<C-W>_
nmap <C-H> <C-W>h<C-W>_
nmap ;ntr :NERDTree<CR>
vmap <c-c> "+y

" custom commands
com! FormatJSON %!python -m json.tool

" configurations of plugins
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'
let NERDTreeIgnore = ['\.py[oc]$', '__pycache__', '\.egg-info']
let g:ctrlp_custom_ignore = 'node_modules\|pyc\|git\|__pycache__'
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:ctrlp_use_caching = 1
let g:ctrlp_working_path_mode = 0
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_java_javac_config_file_enabled = 1
let g:loaded_syntastic_rst_rst2pseudoxml_checker = 1
let g:jinja_syntax_html = 1
let g:indentLine_clolor_term = 239
let g:indentLine_char = '|'

" configurations of YCM
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" nnoremap <leader>lo :lopen<CR>	"open locationlist
" nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" 不显示开启vim时检查ycm_extra_conf文件的信息  
let g:ycm_confirm_extra_conf=0
" 开启基于tag的补全，可以在这之后添加需要的标签路径  
let g:ycm_collect_identifiers_from_tags_files=1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1	
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}
"youcompleteme  默认tab  s-tab 和 ultisnips 冲突
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
let g:ycm_key_invoke_completion = '<M-;>'
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>

"以上配置YCM
if filereadable('/usr/local/bin/ctags')
    let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
endif
function! FiletypeHook(config)
    if has_key(a:config, 'language')
        let &filetype = a:config['language']
    endif
    return 0   " Return 0 to show no error happened
endfunction
"call editorconfig#AddNewHook(function('FiletypeHook'))

" display style
if &term == 'linux' || &term == 'ansi'
    set t_Co=8
else
    set t_Co=256
endif
let base16colorspace=256
set background=dark
"colorscheme molokai

" indent
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
autocmd Filetype stylus setlocal ts=2 sts=2 sw=2

filetype plugin on
filetype indent on

"set encodings
set fileencodings=utf8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
