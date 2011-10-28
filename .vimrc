"##################################################################################
" Vundle setting
" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"##################################################################################
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" original repos on github
Bundle 't9md/vim-textmanip'
Bundle 'gmarik/vundle'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'vim-scripts/python.vim'
Bundle 'thinca/vim-quickrun'
Bundle 'mattn/zencoding-vim'
Bundle 'othree/eregex.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'pix/vim-align'
Bundle 'scrooloose/nerdtree'
Bundle 'tyru/open-browser.vim'
Bundle 'tyru/urilib.vim'
Bundle 'rwfitzge/vim-bclose'
Bundle 'edsono/vim-viewoutput'
Bundle 'ujihisa/unite-colorscheme'
Bundle 'ujihisa/unite-font'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tyru/stickykey.vim'
Bundle 'thinca/vim-localrc'

" original repos on vim-scripts
Bundle 'surround.vim'
Bundle 'IndentAnything'
Bundle 'grep.vim'
Bundle 'YankRing.vim'
Bundle 'sudo.vim'
Bundle 'renamer.vim'
Bundle 'yaml.vim'
Bundle 'AutoClose'
Bundle 'mru.vim'
Bundle 'xmledit'
Bundle 'TwitVim'
" 「,w」,「,b」でキャメルケース、アンスコの変数を単語毎に移動できる
Bundle 'camelcasemotion'
Bundle 'html5.vim'
Bundle 'gtags.vim'
Bundle 'Better-Javascript-Indentation'
Bundle 'project.tar.gz'
Bundle 'javacomplete'
Bundle 'smartchr'

" colorscheme
Bundle 'desert256.vim'
Bundle 'desertEx'
Bundle 'wombat256.vim'
Bundle 'mrkn/mrkn256.vim'
Bundle 'larssmit/Lucius'
Bundle 'Wombat'

" my repo
" scala付属のvimtool http://www.scala-lang.org/
Bundle 'scala-vim'

filetype plugin indent on

"##################################################################################
" plugins setting
"##################################################################################
" minibufexpl.vim
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" unite.vim
" インサート/ノーマルどちらからでも呼び出せるようにキーマップ
nnoremap <silent> <C-r> :<C-u>Unite file_mru<CR>
" ウィンドウを水平に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-n> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-n> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')

" 入力モードで開始
let g:unite_enable_start_insert=1
""" 縦分割で開始
let g:unite_enable_split_vertically = 1
""" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
""" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
""" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
""" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
""" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
""" 全乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru<CR>

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

" neocomplcache
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

" open-browser.vim
" カーソルがURLならそのURLを開き、それ以外ならその単語でggr
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
" 別途開いてるHTMLファイルをブラウザで開く
cnoremap gx<CR> :! google-chrome %<CR>

" nerdtree
" add nerdtreegrep git://gist.github.com/414375.git
nnoremap <silent> nt  : <C-u>NERDTree<CR>
nnoremap <silent> ntt : <C-u>NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

" zen-coding
let g:user_zen_expandabbr_key = '<c-e>'
" 入力補完有効
let g:use_zen_complete_tag = 1
" jQuery用スニペット
let g:user_zen_settings = {
\ 'javascript' : {
\   'snippets' : {
\      'jq' : "$(function(){\n\t${cursor}${child}\n});",
\      'jq:each' : "$each(${cursor}, function(index, item){\n\t${child}\n});",
\      'fn' : "(function(){\n\t${cursor}\n})();",
\      'tm' : "setTimeout(function(){\n\t${cursor},\n}, 100);",
\    },
\  },
\}
" 独自ファイルタイプへの対応
let g:user_zen_settings = {
\    'php' : {
\        'extends' : 'html',
\        'filters' : 'html,c',
\    },
\}

"gtags.vim
map <C-g> :Gtags
map <C-i> :Gtags -f %<CR>
"map <C-j> :GtagsCursor<CR>


" minibufexpl.vim
nnoremap <Leader>1 :e #1<CR>
nnoremap <Leader>2 :e #2<CR>
nnoremap <Leader>3 :e #3<CR>
nnoremap <Leader>4 :e #4<CR>
nnoremap <Leader>5 :e #5<CR>
nnoremap <Leader>6 :e #6<CR>
nnoremap <Leader>7 :e #7<CR>
nnoremap <Leader>8 :e #8<CR>
nnoremap <Leader>9 :e #9<CR>

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

"##################################################################################
" 文字コード自動認識
"##################################################################################
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

"##################################################################################
" setting
"##################################################################################
"バックアップ
set backup
set backupdir=$HOME/.backup/

"カーソル行のハイライト
set cursorline
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

"ESC2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

"保存時に行末の空白を除去
autocmd BufWritePre * :%s/\s\+$//ge
"保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge

set guifont=Ricky:h12
syntax on
colorscheme desert
highlight LineNr ctermfg=darkgrey

"行の折り返し時
nnoremap j gj
nnoremap k gk
set autoread "ファイル変更されたら自動的に読み直す
set showtabline=2 "タブを常に表示
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

"ESCキーを2回押すと終了する
"パス単位で削除,ESC2回で終了
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
        imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
        nmap <silent><buffer> <ESC><ESC> q
        imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction

" HTML setting
autocmd BufNewFile *.html 0r ~/.vim/template/template.html

" Python setting
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd BufNewFile *.py 0r ~/.vim/template/template.py

" Ruby setting
autocmd FileType ruby setl autoindent
autocmd FileType ruby setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType ruby setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

" ShellScript setting
autocmd FileType shell setl autoindent
autocmd FileType shell setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd BufNewFile *.sh 0r ~/.vim/template/template.sh

" JavaScript setting
autocmd FileType javascript setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!
" Java setting
autocmd FileType java :setlocal omnifunc=javacomplete#Complete
autocmd FileType java :setlocal completefunc=javacomplete#CompleteParamsInfo
" Vim setting
autocmd FileType vim setlocal expandtab shiftwidth=2
