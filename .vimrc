" Vim Settings
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  if !has('python3')
    echo "you require to install pynvim. `pip3 install --user pynvim`"
  endif
  let g:deoplete#enable_at_startup = 1
  " for syntax
  call dein#add('thinca/vim-quickrun')
  call dein#add('osyo-manga/shabadou.vim')

  call dein#add('t9md/vim-textmanip')

  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#add('Shougo/vimproc.vim', {'build': 'make'})

  call dein#add('Shougo/neobundle.vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('w1mvy/vim-denite-tab')

  " git関連
  "call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')
  call dein#add('gregsexton/gitv')
  call dein#add('rhysd/committia.vim')
  call dein#add('idanarye/vim-merginal')
  " }}}

  call dein#add('Shougo/vimfiler')
  call dein#add('vim-scripts/Jinja')
  call dein#add('mattn/zencoding-vim')
  call dein#add('othree/eregex.vim')
  call dein#add('tyru/open-browser.vim')
  call dein#add('tyru/urilib.vim')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('thinca/vim-localrc')
  call dein#add('thinca/vim-ref')
  call dein#add('fuenor/qfixhowm')
  call dein#add('vim-scripts/csharp.vim')
  call dein#add('hail2u/vim-css3-syntax')
  " 検索後のハイライトを変更する
  call dein#add('daisuzu/rainbowcyclone.vim')
  " underscore,camelcase文字列をテキストオブジェ化
  " call dein#add('h1mesuke/textobj-wiw')
  " JavaScript コーディング規約チェック
  " sudo pip install http://closure-linter.googlecode.com/files/closure_linter-latest.tar.gz
  " Ctrl+A,Ctrl+Xで数値、日付のインクリメントデクリメント
  call dein#add('tpope/vim-speeddating')
  " <C+_><C+_>でコメントアウト
  call dein#add('tomtom/tcomment_vim')
  " 単語へのカーソル移動
  call dein#add('Lokaltog/vim-easymotion')
  " インデント量の違いをハイライト表示
   call dein#add('Yggdroot/indentLine')
  let g:indentLine_char = '|'
  "call dein#add('nathanaelkane/vim-indent-guides')
  " 括弧の自動補完
  "call dein#add('vim-scripts/AutoClose--Alves')
  call dein#add('Townk/vim-autoclose')
  call dein#add('taku-o/vim-toggle')
  call dein#add('nvie/vim-pep8')
  call dein#add('h1mesuke/vim-alignta')
  call dein#add('mattn/benchvimrc-vim')
  call dein#add('petdance/vim-perl')
  call dein#add('hotchpotch/perldoc-vim')
  " vim用w3m
  " call dein#add('yuratomo/w3m.vim')
  call dein#add('lambdalisue/vim-python-virtualenv')
  " Python用構文チェック
  " call dein#add('mitechie/pyflakes-pathogen')
  call dein#add('glidenote/memolist.vim')
  call dein#add('plasticboy/vim-markdown')

  " リファクタ
  " call dein#add('python-rope/ropevim')
  " call dein#add('mitechie/pyflakes-pathogen')
  call dein#add('pekepeke/titanium-vim')
  call dein#add('vim-scripts/PHP-correct-Indenting')

  " original repos on vim-scripts
  call dein#add('vim-scripts/surround.vim')
  call dein#add('vim-scripts/TwitVim')
  call dein#add('vim-scripts/IndentAnything')
  call dein#add('vim-scripts/grep.vim')
  "call dein#add('YankRing.vim')
  call dein#add('vim-scripts/sudo.vim')
  call dein#add('vim-scripts/renamer.vim')
  "call dein#add('yaml.vim')
  call dein#add('vim-scripts/mru.vim')
  call dein#add('vim-scripts/xmledit')
  " '%' で対応する括弧に飛ぶ機能を強化
  call dein#add('vim-scripts/matchit.zip')
  " 「,w」,「,b」でキャメルケース、アンスコの変数を単語毎に移動できる
  call dein#add('vim-scripts/camelcasemotion')
  call dein#add('othree/html5.vim')
  call dein#add('vim-scripts/Better-Javascript-Indentation')
  call dein#add('vim-scripts/project.tar.gz')
  call dein#add('vim-scripts/javacomplete')
  call dein#add('vim-scripts/smartchr')
  " taglist, Source-Explorer-srcexpl, ctags用プラグイン
  call dein#add('vim-scripts/Source-Explorer-srcexpl.vim')
  call dein#add('vim-scripts/taglist.vim')
  call dein#add('vim-scripts/buftabs')
  call dein#add('vim-scripts/JSON.vim')

  " ruby
  "call dein#add('vim-ruby/vim-ruby')
  call dein#add('pocke/dicts')
  let g:neocomplete#sources#dictionary#dictionaries = {
  \   'ruby': $HOME . '.vim/bundle/dicts/ruby.dict',
  \ }

  call dein#add('Keithbsmiley/rspec.vim')
  call dein#add('AndrewRadev/switch.vim')
  nnoremap - :Switch<cr>
  autocmd FileType eruby let b:switch_custom_definitions =
      \ [
      \   ['if', 'unless'],
      \   ['while', 'until'],
      \   ['.blank?', '.present?'],
      \   ['include', 'extend'],
      \   ['class', 'module'],
      \   ['.inject', '.delete_if'],
      \   ['.map', '.map!'],
      \   ['attr_accessor', 'attr_reader', 'attr_writer'],
      \   [
      \     {
      \       ':\(\k\+\)\s\+=>': '\1:',
      \       '\<\(\k\+\):':     ':\1 =>',
      \     }
      \   ]
      \ ]
  autocmd FileType rspec let b:switch_custom_definitions =
      \ [
      \   ['describe', 'context', 'it'],
      \   ['before', 'after'],
      \   ['get', 'post', 'put', 'delete'],
      \   ['\.to_not', '\.to'],
      \   ['==', 'eql', 'equal'],
      \   { '\([^. ]\+\)\.should\(_not\|\)': 'expect(\1)\.to\2' },
      \   { 'expect(\([^. ]\+\))\.to\(_not\|\)': '\1.should\2' },
      \ ]
  "}}}

  "go
  call dein#add('fatih/vim-go')

  "swift
  call dein#add('toyamarinyon/vim-swift')

  call dein#add('vim-scripts/progressbar-widget')

  call dein#add('koron/codic-vim')
  call dein#add('aereal/vim-colors-japanesque')

  " colorscheme : {{{
  call dein#add('nanotech/jellybeans.vim')
  " }}}
  " statusline : {{{
  call dein#add('itchyny/lightline.vim')
  " }}}

  call dein#add("bkad/vim-terraform")
  call dein#add("jceb/vim-hier")
  call dein#add("osyo-manga/vim-watchdogs")

  call dein#add('glidenote/serverspec-snippets')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
"}}}

" Plugins Setting:"{{{

" denite {{{
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> <TAB>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction
nnoremap <silent> <C-t><C-t> :<C-u>Denite buffer:no-current<CR>
if executable('ag')
  call denite#custom#var('file/rec', 'command',
  \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif
" }}}

" gitv {{{
autocmd FileType git :setlocal foldlevel=99
" }}}

" textmanip.vim:"{{{
" 行の複製
"xmap <Space>d <Plug>(textmanip-duplicate-down)
"nmap <Space>d <Plug>(textmanip-duplicate-down)
"xmap <Space>D <Plug>(textmanip-duplicate-up)
"nmap <Space>D <Plug>(textmanip-duplicate-up)
" 選択したテキストの移動
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-j> <Plug>(textmanip-move-down)
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
"}}}

" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"
let g:neosnippet#snippets_directory="~/dotfiles/.vim/snippet"
" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

"}}}

" alignta: {{{
xnoremap <silent> a= :Alignta =>\=<CR>
xnoremap <silent> a: :Alignta  01 :<CR>
xmap <silent><expr> as mode() !=# 'v' ? ':Alignta \S\+'."\<CR>" : 'as'
xnoremap al :Alignta<Space>
" }}}

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

" memolist
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>

autocmd FileType quickrun AnsiEsc
let g:quickrun_config = {
\  "ruby.rspec/watchdogs_checker" : {
\      "type" : "watchdogs_checker/rubocop"
\  },
\  "rspec/watchdogs_checker" : {
\      "type" : "watchdogs_checker/rubocop"
\  },
\  "ruby/watchdogs_checker" : {
\      "type" : "watchdogs_checker/rubocop"
\  },
\  "watchdogs_checker/rubocop" : {
\      "cmdopt" : "--format emacs"
\  },
\  "watchdogs_checker/_" : {
\      "outputter/quickfix/open_cmd": "",
\      "hook/echo/enable" : 1,
\      "hook/echo/output_success": "> No Errors Found."
\  },
\  "runner/vimproc/updatetime": 10,
\  "ruby.rspec": {
\    "command": "rspec",
\    "exec": "bundle exec %c",
\    "cmdopt": "-cfd"
\  },
\  "markdown": {
\    "outputter": "browser"
\  }
\}
let g:watchdogs_check_BufWritePost_enables = {
\  "ruby"     : 1,
\  "rspec"     : 1,
\  "ruby.rspec"     : 1,
\  "rspec.ruby"     : 1
\}

augroup QRunRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

nnoremap [quickrun] <Nop>
nmap <Space>k [quickrun]
nnoremap <silent> [quickrun]r :call QRunRspecCurrentLine()<CR>
fun! QRunRspecCurrentLine()
  let line = line(".")
  exe ":QuickRun -exec 'bundle exec %c %s%o' -cmdopt ':" . line . " -cfd'"
endfun
autocmd BufReadPost *_spec.rb call RSpecQuickrun()

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
" ファイル拡張子をmkdにする
let howm_filename = '%Y/%m/%Y-%m-%d-%H%M%S.mkd'
" ファイルタイプをmarkdownにする
let QFixHowm_FileType = 'markdown'
" タイトル記号
let QFixHowm_Title = '#'
"}}}
"{{{ vim-python-virtualenv
" Apply g:pythonworkon to statusline
if exists('g:pythonworkon')
    let &statusline='%F%m%r%h%w [FORMAT=%{&ff}][ENC=%{&fileencoding}][TYPE=%Y] [ASCII=\%03.3b] [HEX=\%02.2B] [POS=%04l,%04v][%p%%] [LEN=%L] %= [WORKON=%{pythonworkon}][Git=%{fugitive#statusline()}]'
endif
"}}}
"{{{ easymotion

" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「'」 + 何かにマッピング
let g:EasyMotion_leader_key="'"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue
"}}}

"{{{ rainbowcyclone
nmap c/ <Plug>(rc_search_forward)
nmap c? <Plug>(rc_search_backward)
nmap c* <Plug>(rc_search_forward_with_cursor)
nmap c# <Plug>(rc_search_backward_with_cursor)
nmap cn <Plug>(rc_search_forward_with_last_pattern)
nmap cN <Plug>(rc_search_backward_with_last_pattern)
nmap cc <Plug>(rc_highlight)
"}}}

" AnySetting:"{{{
" バックアップ
set backup
if !isdirectory($HOME.'/.backup/')
    call mkdir($HOME.'/.backup/')
endif
set backupdir=$HOME/.backup/
if !isdirectory($HOME.'/.swp/')
    call mkdir($HOME.'/.swp/')
endif
set swapfile
set directory=$HOME/.swp/
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

syntax on
colorscheme jellybeans
let g:lightline = {
\  'colorscheme':'jellybeans'
\  }
highlight LineNr ctermfg=darkgrey
" Ctrl+Pで連続ペースト
vnoremap <silent> <C-p> "0p<CR>"

"{{{ :バッファ切り替え
nnoremap 1, 1gt<CR>
nnoremap 2, 2gt<CR>
nnoremap 3, 3gt<CR>
nnoremap 4, 4gt<CR>
nnoremap 5, 5gt<CR>
nnoremap 6, 6gt<CR>
nnoremap 7, 7gt<CR>
nnoremap 8, 8gt<CR>
nnoremap 9, 9gt<CR>
"}}}

" 単語移動 : {{{
nnoremap <C-h> b
nnoremap <C-l> w
nnoremap <S-h> ge
nnoremap <S-l> e
nnoremap <C-j> *
nnoremap <C-k> #
"}}}

" 行の折り返し時
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" ウィンドウの移動 : {{{
nmap gh <C-w>h
nmap gl <C-w>l
nmap gj <C-w>j
nmap gk <C-w>k
"}}}

set autoread "ファイル変更されたら自動的に読み直す
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
if !has('nvim')
  set antialias
  set clipboard=unnamed,autoselect
else
  set clipboard+=unnamed
endif
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
set foldmethod=marker " 折りたたみ
set wildignorecase " :e でファイル開くとき大文字小文字区別しないで候補を探sす
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
"{{{ : tab shortcut
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

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

" {{{ : function
" {{{: formatjson
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq \"" . l:arg . "\""
endfunction
" }}}
" }}}

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

autocmd Filetype cs setl dictionary=~/.vim/dict/unity.dict
"}}}
" Go setting:"{{{
autocmd FileType go setl tabstop=8 expandtab shiftwidth=8
let g:go_highlight_functions = 1
let g:go_highlight_methods   = 1
let g:go_highlight_structs   = 1
" }}}
" Ruby setting:"{{{
autocmd BufReadPost,BufNewFile *_spec.rb set filetype=rspec.ruby
autocmd BufReadPost,BufNewFile .pryrc set filetype=ruby
autocmd FileType ruby setl autoindent
autocmd FileType ruby setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType ruby setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
"}}}
" Terraform setting: "{{{
autocmd BufReadPost,BufNewFile *.tf set filetype=terraform
autocmd FileType terraform setl autoindent
autocmd FileType terraform setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
" }}}
" ShellScript setting:"{{{
autocmd FileType shell setl autoindent
autocmd FileType shell setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd BufNewFile *.sh 0r ~/.vim/template/template.sh
"}}}
" JavaScript setting:"{{{
autocmd FileType javascript setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et
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
" Java setting {{{
au BufReadPost,BufNewFile *.bsh :setl filetype=java
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
autocmd FileType java setl tabstop=8 expandtab shiftwidth=4 tabstop softtabstop=4 smarttab nosmartindent cindent textwidth=80 colorcolumn=80 autoindent
" }}}
autocmd FileType xml  setl tabstop=8 expandtab shiftwidth=4 tabstop softtabstop=4 smarttab nosmartindent cindent textwidth=80 colorcolumn=80 autoindent
" Vim setting
autocmd FileType vim setlocal expandtab shiftwidth=2
" Markdown setting
autocmd BufRead,BufNewFile *.mkd setfiletype mkd
autocmd BufRead,BufNewFile *.md setfiletype mkd
autocmd BufNewFile,BufRead *.yml,*.yaml setfiletype yaml
autocmd FileType yaml setlocal expandtab shiftwidth=2

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

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
