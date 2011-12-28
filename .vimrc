" Vim Settings
" ---------------------------------------------------------------------------------
" Vundle Setting:"{{{
" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim.git/
  call neobundle#rc(expand('~/.bundle'))
endif

" original repos on github
NeoBundle 't9md/vim-textmanip'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-ssh'
NeoBundle 'Sixeight/unite-grep'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'vim-scripts/python.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'othree/eregex.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tyru/urilib.vim'
NeoBundle 'rwfitzge/vim-bclose'
NeoBundle 'edsono/vim-viewoutput'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-font'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tyru/stickykey.vim'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'thinca/vim-ref'
" <C+_><C+_>でコメントアウト
NeoBundle 'tomtom/tcomment_vim'
" 単語へのカーソル移動
NeoBundle 'Lokaltog/vim-easymotion'
" インデント量の違いをハイライト表示
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/AutoClose--Alves'
NeoBundle 'taku-o/vim-toggle'

" original repos on vim-scripts
NeoBundle 'surround.vim'
NeoBundle 'IndentAnything'
NeoBundle 'grep.vim'
NeoBundle 'YankRing.vim'
NeoBundle 'sudo.vim'
NeoBundle 'renamer.vim'
NeoBundle 'yaml.vim'
NeoBundle 'mru.vim'
NeoBundle 'xmledit'
NeoBundle 'TwitVim'
NeoBundle 'Align'
"NeoBundle 'ManPageView'
" 「,w」,「,b」でキャメルケース、アンスコの変数を単語毎に移動できる
NeoBundle 'camelcasemotion'
NeoBundle 'html5.vim'
NeoBundle 'Better-Javascript-Indentation'
NeoBundle 'project.tar.gz'
NeoBundle 'javacomplete'
NeoBundle 'smartchr'
NeoBundle 'Source-Explorer-srcexpl.vim'
NeoBundle 'taglist.vim'
NeoBundle 'buftabs'

" colorscheme
NeoBundle 'desert256.vim'
NeoBundle 'desertEx'
NeoBundle 'wombat256.vim'
NeoBundle 'mrkn/mrkn256.vim'
NeoBundle 'larssmit/Lucius'
NeoBundle 'Wombat'

" my repo
" scala付属のvimtool http://www.scala-lang.org/
NeoBundle 'scala-vim'

filetype plugin indent on
"}}}

" --------------------------------------------------------------------------------
" Plugins Setting:"{{{

" unite.vim:"{{{
" インサート/ノーマルどちらからでも呼び出せるようにキーマップ
nnoremap <silent> <C-r> :<C-u>Unite file_mru<CR>
" ウィンドウを水平に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-n> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-n> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
" 縦分割で開始
let g:unite_enable_split_vertically = 1
" useally
nnoremap <silent> ,uu :<C-u>Unite -buffer-name=files buffer_tab file_rec file file_mru<CR>
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 全乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru<CR>
"}}}

" textmanip.vim
" 行の複製
xmap <Space>d <Plug>(textmanip-duplicate-down)
nmap <Space>d <Plug>(textmanip-duplicate-down)
xmap <Space>D <Plug>(textmanip-duplicate-up)
nmap <Space>D <Plug>(textmanip-duplicate-up)

" 選択したテキストの移動
xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)

" YankRing.vim
let g:yankring_history_dir = expand('$HOME')
let g:yankring_history_file = '.yankring_history'
nnoremap  <silent> <F7> :YRShow<CR>
let g:yankring_max_history = 10
let g:yankring_window_height = 13

" vim-align
let g:Align_xstrlen = 3
let g:DrChipTopLv1Menu = ''

" buftabs
" ステータスラインに表示
" Ctrl+^で直前のバッファへ
let g:buftabs_in_statusline=1
let g:buftabs_only_basename=1
" Space,Shift+Spaceでバッファ切り替え
noremap <Space> :bnext<CR>
noremap <S-Space> :bprev<CR>
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

" neocomplcache:"{{{
" neocomplcache有効化
let g:neocomplcache_enable_at_startup = 1
" use smartcase
let g:neocomplcache_enable_smart_case = 1
" use underbar completion
let g:neocomplcache_enable_underbar_completion = 1
" set minimum syntax keyword length
let g:neocomplcache_min_syntax_length = 4
" set manual completion length
let g:neocomplcache_manual_completion_start_length = 1
" define dict
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'    : '',
    \ 'scala'      : $HOME.'/.vim/dict/scala.dict',
    \ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
    \ 'vimshell'   : $HOME.'/.vim/dict/vim.dict'
    \}
" スニペット補完
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
" 前回行われた補完のキャンセル
inoremap <expr><C-g> neocomplcache#undo_completion()
" 補完候補から共通部分を補完
inoremap <expr><C-l> neocomplcache#complete_common_string()
" 選択している候補を確定
inoremap <expr><C-y> neocomplcache#close_popup()
" ファイル名補完
inoremap <expr><C-x><C-f> neocomplcache#manual_filename_complete()
""imap <C-k>     <Plug>(neocomplcache_snippets_expand)
""smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
""inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
"}}}

" open-browser.vim:"{{{
" カーソルがURLならそのURLを開き、それ以外ならその単語でggr
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
" 別途開いてるHTMLファイルをブラウザで開く
cnoremap gx<CR> :! google-chrome %<CR>
"}}}

" nerdtree
" add nerdtreegrep git://gist.github.com/414375.git
nnoremap <silent> nt  : <C-u>NERDTree<CR>
nnoremap <silent> ntt : <C-u>NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

" toggle.vim
let g:toggle_pairs = { 'and': 'or', 'or': 'and'}

" zen-coding
let g:user_zen_expandabbr_key = '<c-e>'
" 入力補完有効
" スニペットは<C-e>で展開
let g:use_zen_complete_tag = 1
let g:user_zen_settings = {
\  'lang' : 'ja',
\  'indentation' : '\t',
\  'html' : {
\    'indentation' : ' ',
\  },
\  'css' : {
\    'filters' : 'fc',
\  },
\  'javascript' : {
\    'snippets' : {
\       'jq' : "$(function(){\n\t${cursor}${child}\n});",
\       'jq:each' : "$each(${cursor}, function(index, item){\n\t${child}\n});",
\       'fn' : "(function(){\n\t${cursor}\n})();",
\       'tm' : "setTimeout(function(){\n\t${cursor},\n}, 100);",
\     },
\  },
\  'php' : {
\    'extends' : 'html',
\    'filters' : 'html,c',
\  },
\}

" quickrun
let g:quickrun_config = {}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}

" project.vim
" ファイルが選択されたら、ウィンドウを閉じる
let g:proj_flags ="imstc"
" <Leader>Pでプロジェクトとぐる開閉
nmap <silent> <Leader>P <Plug>ToggleProject

" <Leader>pで、デフォルトのプロジェクトを開く
nmap <silent> <Leader>p :Project<CR>
" プロジェクト開いたときにフォールディングを展開した状態にする
autocmd BufAdd .vimprojects silent! %foldopen!
" カレントディレクトリに管理ファイルがあったら読み込む
if getcwd() != $HOME
    if filereadable(getcwd().  '/.vimprojects')
        Project .vimprojects
    endif
endif

" smartchr
inoremap <expr> = smartchr#loop('=',' = ',' == ',' === ')
inoremap <expr> , smartchr#loop(',', ', ')

" indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1
"}}}

" ------------------------------------------------
" AnySetting:"{{{
" バックアップ
set backup
set backupdir=$HOME/.backup/

"カーソル行のハイライト
set cursorline
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

"ESC2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

"保存時に行末の空白を除去
autocmd BufWritePre * :%s/\s\+$//ge
"保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge

""set guifont=Ricky:h12
syntax on
colorscheme desert
highlight LineNr ctermfg=darkgrey

"行の折り返し時
nnoremap j gj
nnoremap k gk
set autoread "ファイル変更されたら自動的に読み直す
set showtabline=2 "タブを常に表示
set guioptions-=e
set noerrorbells "エラーベル利用しない
set visualbell
set ttyfast "早い端末を利用
set wildchar=<TAB> "補完を<Tab>で行う
set laststatus=2 "常にステータスライン表示
set showcmd "コマンドをステータスラインに表示
set cmdheight=1
set showmatch "対応する括弧を表示
set hlsearch "検索結果をハイライト
set expandtab "タブをスペースに置き換える
"set columns=80
"set lines=40
set antialias
set autoindent "オートインデント
" Tabの画面上での幅
set tabstop=4
set shiftwidth=4
set number "行数表示
set ruler "右下に行,列表示
set incsearch "インクリメンタルサーチ
set ignorecase "大文字小文字区別しない
set smartcase "検索で小文字なら大文字を無視、大文字なら無視しない
set wrapscan "循環検索
set history=1000
set infercase "挿入モードの単語補完で小文字で打った単語でも大文字で補完できるように
set wildmenu "補完候補表示
set helplang=ja
set title "タイトルを表示
set backspace=2 "バックスペースでインデント、改行削除
set clipboard+=unnamed "ビジュアルモードで選択したテキストがクリップボードに入る
set foldmethod=marker
nnoremap y "+y
vnoremap y "+y

"qqq: でコマンド履歴を開く
"qqq/キーで検索履歴を開く
nnoremap qqq: <Esc>q:
nnoremap qqq/ <Esc>q/
"q:,q/,q?を無効化
nnoremap q: <Nop>
nnoremap q/ <Nop>
nnoremap q? <Nop>

set virtualedit=block

" 連続でインデントサイズを変更
vnoremap < <gv
vnoremap > >gv
"ESCキーを2回押すと終了する
"パス単位で削除,ESC2回で終了
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
        imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
        nmap <silent><buffer> <ESC><ESC> q
        imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction
"}}}

" AnyLanguagesSetting:"{{{
" HTML setting
autocmd BufNewFile *.html 0r ~/.vim/template/template.html
" Python setting:"{{{
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd BufNewFile *.py 0r ~/.vim/template/template.py
"}}}
" Ruby setting:"{{{
autocmd FileType ruby setl autoindent
autocmd FileType ruby setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType ruby setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
"}}}
" ShellScript setting:"{{{
autocmd FileType shell setl autoindent
autocmd FileType shell setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd BufNewFile *.sh 0r ~/.vim/template/template.sh
"}}}
" JavaScript setting:"{{{
autocmd FileType javascript setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!
"}}}
" Java setting
autocmd FileType java :setlocal omnifunc=javacomplete#Complete
autocmd FileType java :setlocal completefunc=javacomplete#CompleteParamsInfo
" Vim setting
autocmd FileType vim setlocal expandtab shiftwidth=2
"}}}

"-------------------------------------------------------------------------
" Encoding:"{{{
set fileencodings=iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,utf-8,ucs-bom,euc-jp,eucjp-ms,cp932
set encoding=utf-8
" 改行コードの自動認識
set fileformats=unix,dos,mac
if exists('&ambiwidth')
  set ambiwidth=double
endif
"}}}
