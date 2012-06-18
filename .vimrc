" Vim Settings
" Bundle Setting:"{{{
" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle'))
endif

" original repos on github
NeoBundle 't9md/vim-textmanip'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-snippets-complete'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-ssh'
" :Unite grep:target:options:pattern
NeoBundle 'kmnk/vim-unite-giti.git'
NeoBundle 'Sixeight/unite-grep'
NeoBundle 't9md/vim-unite-ack'
NeoBundle 'taka84u9/unite-git'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'motemen/git-vim'
NeoBundle 'vim-scripts/python.vim'
NeoBundle 'vim-scripts/pythoncomplete'
NeoBundle 'vim-scripts/Jinja'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'othree/eregex.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tyru/urilib.vim'
NeoBundle 'rwfitzge/vim-bclose'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-font'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'thinca/vim-ref'
NeoBundle 'hail2u/vim-css3-syntax'
" JavaScript コーディング規約チェック
" sudo pip install http://closure-linter.googlecode.com/files/closure_linter-latest.tar.gz
NeoBundle 'scrooloose/syntastic'
" Ctrl+A,Ctrl+Xで数値、日付のインクリメントデクリメント
NeoBundle 'tpope/vim-speeddating'
" <C+_><C+_>でコメントアウト
NeoBundle 'tomtom/tcomment_vim'
" 単語へのカーソル移動
NeoBundle 'Lokaltog/vim-easymotion'
" インデント量の違いをハイライト表示
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/AutoClose--Alves'
NeoBundle 'taku-o/vim-toggle'
NeoBundle 'nvie/vim-pep8'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'mattn/benchvimrc-vim'
NeoBundle 'petdance/vim-perl'
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'lambdalisue/vim-python-virtualenv'
" Python用構文チェック
NeoBundle 'mitechie/pyflakes-pathogen'

" リファクタ
NeoBundle 'sontek/rope-vim'
NeoBundle 'mitechie/pyflakes-pathogen'
NeoBundle 'pekepeke/titanium-vim'
NeoBundle 'PHP-correct-Indenting'

" original repos on vim-scripts
NeoBundle 'surround.vim'
NeoBundle 'TwitVim'
NeoBundle 'IndentAnything'
NeoBundle 'grep.vim'
NeoBundle 'YankRing.vim'
NeoBundle 'sudo.vim'
NeoBundle 'renamer.vim'
NeoBundle 'yaml.vim'
NeoBundle 'mru.vim'
NeoBundle 'xmledit'
NeoBundle 'matchit.zip'
" 「,w」,「,b」でキャメルケース、アンスコの変数を単語毎に移動できる
NeoBundle 'camelcasemotion'
NeoBundle 'othree/html5.vim'
NeoBundle 'Better-Javascript-Indentation'
NeoBundle 'project.tar.gz'
NeoBundle 'javacomplete'
NeoBundle 'smartchr'
" taglist, Source-Explorer-srcexpl, ctags用プラグイン
NeoBundle 'Source-Explorer-srcexpl.vim'
NeoBundle 'taglist.vim'
NeoBundle 'buftabs'
NeoBundle 'JSON.vim'

" colorscheme
NeoBundle 'Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'dante.vim'
NeoBundle 'jellybeans.vim'
filetype plugin indent on
"}}}

" Plugins Setting:"{{{

" unite.vim:"{{{
" unite start settings
let g:unite_enable_start_insert=1
let g:unite_split_rule="botright"
let g:unite_enable_split_vertically = 0
nnoremap [unite] <Nop>
nmap f [unite]
" 通常使用
nnoremap <silent> [unite]u :<C-u>Unite -profile-name=files buffer_tab file_mru file<CR>
" show all buffers
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" show all tabs
nnoremap <silent> <C-t><C-t> :<C-u>Unite tab:no-current<CR>
" 最近使ったファイル
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" ファイル一覧
nnoremap <silent> [unite]f :<C-u>UniteWithCurrentDir file -buffer-name=files<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"uniteを開いている間のキーマッピング
augroup vimrc
  autocmd FileType unite call s:unite_my_settings()
augroup END
function! s:unite_my_settings()
  "入力モードのときjjでノーマルモードに移動
  imap <buffer> jj <Plug>(unite_insert_leave)
  "入力モードのときctrl+wでバックスラッシュも削除
  imap <buffer> <C-j> <Plug>(unite_delete_backward_path)
  "sでsplit
  nnoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
  inoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
  "vでvsplit
  nnoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
  inoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
  "fでvimfiler
  nnoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
  inoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
endfunction

"}}}

" unite.vim:"{{{
let g:vimfiler_as_default_explorer=1
" }}}

" textmanip.vim:"{{{
" 行の複製
"xmap <Space>d <Plug>(textmanip-duplicate-down)
"nmap <Space>d <Plug>(textmanip-duplicate-down)
"xmap <Space>D <Plug>(textmanip-duplicate-up)
"nmap <Space>D <Plug>(textmanip-duplicate-up)
" 選択したテキストの移動
xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)
"}}}

" YankRing.vim:"{{{
let g:yankring_history_dir = expand('$HOME')
let g:yankring_history_file = '.yankring_history'
nnoremap  <silent> <F7> :YRShow<CR>
let g:yankring_max_history = 10
let g:yankring_window_height = 13
"}}}

" buftabs:"{{{
" ステータスラインに表示
" Ctrl+^で直前のバッファへ
let g:buftabs_in_statusline=1
" ファイル名のみ表示
let g:buftabs_only_basename=1
" 現在のバッファをハイライト
let g:buftabs_active_highlight_group="Visual"
" ステータスライン
set statusline=%=\ [%{(&fenc!=''?&fenc:&enc)}/%{&ff}]\[%Y]\[%04l,%04v][%p%%]
" Space,Ctrl+Spaceでバッファ切り替え
nmap <Space> :bnext<CR>
nmap <Nul> :bprev<CR>
"}}}

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
    \ 'vimshell'   : $HOME.'/.vim/dict/vim.dict',
    \ 'perl'       : $HOME.'/.vim/dict/perl.dict'
    \}
" スニペット補完
imap <expr><C-k> neocomplecache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"
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
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"}}}

" Enable omni completin
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" open-browser.vim:"{{{
" カーソルがURLならそのURLを開き、それ以外ならその単語でggr
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
" 別途開いてるHTMLファイルをブラウザで開く
cnoremap gx<CR> :! iron %<CR>
"}}}

" nerdtree:"{{{
" add nerdtreegrep git://gist.github.com/414375.git
nnoremap <silent> nt  : <C-u>NERDTree<CR>
nnoremap <silent> ntt : <C-u>NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
"}}}

" toggle.vim normal is + insert is Ctrl+T
let g:toggle_pairs = { 'and': 'or', 'or': 'and'}

" zen-coding:"{{{
let g:user_zen_expandabbr_key = '<c-e>'
" 入力補完有効
" スニペットは<C-e>で展開
let g:use_zen_complete_tag = 1
setlocal omnifunc=zencoding#CompleteTag
let g:user_zen_settings = {
\  'lang' : 'ja',
\  'indentation' : '    ',
\  'html' : {
\    'filters' : 'html',
\  },
\  'css' : {
\    'filters' : 'html, fc',
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
"}}}

" quickrun
let g:quickrun_config = {}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}
let g:quickrun_config['markdown'] = {
    \'outputter':'browser'}

" project.vim:"{{{
" カレントディレクトリに管理ファイルがあったら読み込む
if getcwd() != $HOME
    if filereadable(getcwd(). '/.vimprojects')
      Project .vimprojects
    endif
endif
" ファイルが選択されたら、ウィンドウを閉じる
let g:proj_flags = "imstc"
" <Leader>Pでプロジェクトとぐる開閉
nmap <silent> <Leader>P <Plug>ToggleProject
" <Leader>pで、デフォルトのプロジェクトを開く
nmap <silent> <Leader>p :Project<CR>
" プロジェクト開いたときにフォールディングを展開した状態にする
autocmd BufAdd .vimprojects silent! %foldopen!
"}}}

" smartchr:"{{{
inoremap <expr> = smartchr#loop('=',' = ',' == ',' === ')
inoremap <expr> , smartchr#loop(',', ', ')
"}}}

" indent-guides:"{{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1
"}}}

" QFix Hown{{{
set runtimepath+=~/.vim/plugin/qfixapp
let QFixHowm_Key = 'g'
let howm_dir='~/Dropbox/howm'
let homm_fileencoding='utf-8'
let hown_fileformat='unix'
"}}}

"{{{ vim-python-virtualenv
" Apply g:pythonworkon to statusline
if exists('g:pythonworkon')
    let &statusline='%F%m%r%h%w [FORMAT=%{&ff}] [ENC=%{&fileencoding}] [TYPE=%Y] [ASCII=\%03.3b] [HEX=\%02.2B] [POS=%04l,%04v][%p%%] [LEN=%L] %= [WORKON=%{pythonworkon}]'
endif
"}}}


"}}}

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

syntax on
colorscheme desert
highlight LineNr ctermfg=darkgrey

" 行の折り返し時
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" ウィンドウの移動
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
set autoread "ファイル変更されたら自動的に読み直す
set showtabline=2 "タブを常に表示
set guioptions-=e
set noerrorbells "エラーベル利用しない
set visualbell
set ttyfast
set wildchar=<TAB> "補完を<Tab>で行う
set laststatus=2 "常にステータスライン表示
set showcmd "コマンドをステータスラインに表示
set cmdheight=1
set showmatch "対応する括弧を表示
set hlsearch "検索結果をハイライト
set expandtab "タブをスペースに置き換える
set antialias
set autoindent "オートインデント
set textwidth=0 " 勝手な改行をふせぐ
set list listchars=tab:>-,trail:_ " 不可視文字の表示
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
set clipboard+=unnamed,unnamedplus "ビジュアルモードで選択したテキストがクリップボードに入る
set foldmethod=marker " 折りたたみ
set wildignorecase " :e でファイル開くとき大文字小文字区別しないで候補を探sす
" 選択した文字列を"*"で検索する
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>
nnoremap y "+y
vnoremap y "+y
" 日本語入力:"{{{
let IM_CtrlMode = 1
inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
function! IMCtrl(cmd)
  let cmd = a:cmd
  if cmd == 'On'
    let res = system('xvkbd -text "\[Henkan]" > /dev/null 2>&1')
  elseif cmd == 'Off'
    let res = system('xvkbd -text "\[Muhenkan]" > /dev/null 2>&1')
  elseif cmd == 'Toggle'
    let res = system('xvkbd -text "\[Control]\[space]" > /dev/null 2>&1')
  endif
  return ''
endfunction
"}}}

" change StatusLineColor Insert and Normal:"{{{
au InsertEnter * hi StatusLine guifg=DarkBlue guibg=DarkYellow gui=none ctermfg=Blue ctermbg=DarkRed cterm=none
au InsertLeave * hi StatusLine guifg=DarkBlue guibg=DarkGray   gui=none ctermfg=Blue ctermbg=DarkGray cterm=none
"}}}

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
"autocmd FileType unite call s:unite_my_settings()
"function! s:unite_my_settings()
"        imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
"        nmap <silent><buffer> <ESC><ESC> q
"        imap <silent><buffer> <ESC><ESC> <ESC>q
"endfunction
" create dir auto
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
          \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END
"}}}

" AnyLanguagesSetting:"{{{
" HTML setting
autocmd BufNewFile *.html 0r ~/.vim/template/template.html
" Python setting:"{{{
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4 smarttab nosmartindent cindent textwidth=80 colorcolumn=80 autoindent
" Folding
autocmd FileType python setl foldmethod=indent
autocmd FileType python setl foldlevel=99
autocmd BufNewFile *.py 0r ~/.vim/template/template.py
function! AddPyEncoding()
  for line in readfile(expand("%"))
      if line =~ 'Date'
          echo line
      endif
  endfor
endfunction
autocmd BufReadPost *.py :call AddPyEncoding()

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
" Perl setting{{{
autocmd BufNewFile *.pl 0r ~/.vim/template/template.pl
autocmd BufNewFile *.pm 0r ~/.vim/template/template.pm
autocmd BufNewFile,BufRead *.psgi set filetype=perl
autocmd BufRead,BufNewFile *.t,*.pm set filetype=perl
autocmd FileType perl,cgi :compiler perl
autocmd FileType perl setl autoindent
autocmd FileType perl setl cinkeys=0{,0},:,!^F,o,O,e
autocmd FileType perl setl formatoptions=tcqr
autocmd FileType perl setl tabstop=4 shiftwidth=4 softtabstop=4 cindent expandtab
"}}}
" PHP setting {{{
au BufReadPost,BufNewFile *.ctp :setl filetype=php
autocmd FileType php setl autoindent
autocmd FileType php setl tabstop=4 shiftwidth=4 softtabstop=4 cindent expandtab
" }}}
" Java setting
autocmd FileType java :setlocal omnifunc=javacomplete#Complete
autocmd FileType java :setlocal completefunc=javacomplete#CompleteParamsInfo
" Vim setting
autocmd FileType vim setlocal expandtab shiftwidth=2
" Markdown setting
autocmd BufRead,BufNewFile *.mkd setfiletype mkd
autocmd BufRead,BufNewFile *.md setfiletype mkd

"{{{: JSON setting use JSON.vim
au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END
"}}}
"}}}

" Encoding:"{{{
set fileencodings=utf-8,iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,ucs-bom,euc-jp,eucjp-ms,cp932
set encoding=utf-8
" 改行コードの自動認識
set fileformats=unix,dos,mac
if exists('&ambiwidth')
  set ambiwidth=double
endif
"}}}
