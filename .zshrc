############################################################
# キーバインド
############################################################
bindkey -v #vimlike
# tmux起動
#if [ $SHLVL = 1 ];then
#    tmux
#fi

############################################################
# エイリアス
############################################################

case ${OSTYPE} in
    darwin*)
        alias vim="/usr/bin/vim"
        ;;
    linux*)
        alias vim="/usr/local/bin/vim"
        ;;
esac
alias vi='vim'
alias ls='ls -lFG'
alias la='ls -lhAF --color=auto'
#alias ps='ps -fU$(whoami) --forest'
alias gh='history 0 | grep --color '
alias l='less'
alias -g G='| grep --color'
alias -g L='| less'
alias du='du -h'
alias df='df -h'
autoload -Uz zmv
alias zmv='noglob zmv -W'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
eval "$(hub alias -s)"

## ファイル操作の確認
alias cp="cp -i"
alias mv="mv -i"

# 拡張子にコマンドを対応付ける
alias -s zip=zipinfo
alias -s tgz=gzcat
alias -s sh=vim
alias -s py=vim
alias -s js=vim
alias -s xml=lv
alias -s html=iron
alias -s xhtml=iron
alias -s gif=display
alias -s jpg=display
alias -s png=display
alias -s bmp=display

############################################################
# プロンプト、色関係
############################################################
source ~/dotfiles/.zshrc.color

############################################################
# 履歴関係
############################################################
HISTFILE=~/.zsh_history # ヒストリファイル指定
HISTSIZE=100000 # ヒストリに保存するコマンド数
SAVEHIST=100000 # ヒストリファイルに保存するコマンド数
setopt hist_ignore_all_dups # 重複するコマンド行は古い方を削除
setopt share_history # コマンド履歴ファイルを共有する
setopt append_history # 履歴を追加
setopt inc_append_history # 各端末でコマンドを実行した順番にヒストリへ追加
setopt hist_ignore_space # 先頭がスペースの場合、ヒストリに追加しない
setopt auto_pushd # cd -<TAB>でディレクトリの移動履歴表示
setopt pushd_ignore_dups # 移動履歴の重複を削除
setopt hist_no_store # historyコマンドを記録しない
setopt hist_reduce_blanks # 余分な空白を削除して記録

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both

bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^R" history-incremental-pattern-search-backward

############################################################
# 補完関係
############################################################
# 標準補完
autoload -Uz compinit
compinit

setopt auto_cd # ディレクトリ名を入力するだけでディレクトリ変更
setopt auto_list # 自動的に候補一覧を表示
setopt auto_menu #自動的に補完工をを表示する
setopt correct # 間違ったコマンドを修正
setopt list_packed # 補完候補をまとめて表示
setopt list_rows_first #補完の表示を水平方向に
setopt nolistbeep # 補完時ビープなし
setopt complete_aliases # aliasも補完に含める
setopt complete_in_word # 語の途中でもカーソル位置で補完
setopt always_last_prompt #補完のときプロンプトの位置を変えない
setopt list_types # 補完候補の表示を親切に

# 今いるディレクトリを補完候補から外す
zstyle ':completion:*' ignore-parents parent pwd ..
# 補完候補に色を付ける
# "": 空文字列はデフォルト値
zstyle ':completion:*:default' list-colors ""
# 補完方法毎にグループ化する
# %B...%b:「...」を太字にする
# %d: 補完方法のラベル
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''
# 補完候補をメニューから選択する
zstyle ':completion:*:default' menu select=2
# 補完候補がなければあいまい検索
# m:{a-z}={A-Z}:小文字を大文字に変えて検索
# r:|[._-]=*: ._-の前にワイルドカードがあるものとして補完
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'

# 設定した時間以上処理が掛かった場合詳細を表示
REPORTTIME=3
# 補完方法の設定
# _oldlist 前回の補完結果の再利用
# _complete 補完する
# _match globを展開しないで候補の一覧から補完
# _history ヒストリのコマンドも補完候補とする
# _ignored 補完候補にださないと指定したものを補完候補
# _approximate 似ている補完候補も補完候補とする
# _prefix カーソル以降を無視してカーソル位置までで補完
zstyle ':completion:*' completer _oldlist _complete _match _history _ignored  _prefix
# 補完候補をキャッシュ
zstyle ':completion:*' use-cache yes
# 詳細な情報を使う
zstyle ':completion:*' verbose yes
zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"
# globを展開しないで候補の一覧から補完
zstyle ':completion:*' glob_complete
# 補完時ヒストリ展開
setopt hist_expand

# PCRE 互換の正規表現を使う
setopt re_match_pcre

# カレントディレクトリ中に指定されたディレクトリがみつからなかった場合に
# 移動先を検索するリスト
cdpath=(~)

# URLを自動エスケープする
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

############################################################
# その他の標準設定
############################################################
## keep background processes at full speed
setopt NOBGNICE
## restart running processes on exit
setopt HUP
setopt NO_BEEP # ビープを鳴らさない
# jobsでプロセスIDも出力する
setopt long_list_jobs

ls_abbrev() {
    # -a : Do not ignore entries starting with ..
    # -C : Force multi-column output.
    # -F : Append indicator (one of */=>@|) to entries.
    local cmd_ls='ls'
    local -a opt_ls
    opt_ls=('-aCF' '--color=always')
    case "${OSTYPE}" in
        freebsd*|darwin*)
            if type gls > /dev/null 2>&1; then
                cmd_ls='gls'
            else
                # -G : Enable colorized output.
                opt_ls=('-aCFG')
            fi
            ;;
    esac

    local ls_result
    ls_result=$(CLICOLOR_FORCE=1 COLUMNS=$COLUMNS command $cmd_ls ${opt_ls[@]} | sed $'/^\e\[[0-9;]*m$/d')

    local ls_lines=$(echo "$ls_result" | wc -l | tr -d ' ')

    if [ $ls_lines -gt 10 ]; then
        echo "$ls_result" | head -n 5
        echo '...'
        echo "$ls_result" | tail -n 5
        echo "$(command ls -1 -A | wc -l | tr -d ' ') files exist"
    else
        echo "$ls_result"
    fi
}

############################################################
# zshライブラリ的な
############################################################
# z.sh
_Z_CMD=j
source ~/dotfiles/zsh/z/z.sh
precmd() {
    _z --add "$(pwd -P)"
}

# cdd 他のウィンドウのディレクトリに移動できる
autoload -Uz compinit
compinit
. $HOME/dotfiles/zsh/cdd/cdd

# ディレクトリ変更した際呼ぶ関数
chpwd() {
    _cdd_chpwd
    ls_abbrev
    _reg_pwd_screennum
}
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'

# zaw.zsh
# insert modeで Ctrl+x ; プレフィックスキー
source $HOME/dotfiles/zsh/zaw/zaw.zsh
zstyle ':filter-select' case-insensitive yes # 絞り込みをcase-insensitiveに
bindkey '^@' zaw-cdr # zaw-cdrをbindkey
# zaw.zshでディレクトリスタック絞り込み
zmodload zsh/parameter
function zaw-src-dirstack() {
    : ${(A)candidates::=$dirstack}
    actions=("zaw-callback-execute" "zaw-callback-replace-buffer" "zaw-callback-append-to-buffer")
    act_descriptions=("execute" "replace edit buffer" "append to edit buffer")
}
zaw-register-src -n dirstack zaw-src-dirstack

#{{{ : define any function
# url: $1, delimiter: $2, prefix: $3, words: $4..
function web_search {
  local url=$1       && shift
  local delimiter=$1 && shift
  local prefix=$1    && shift
  local query

  while [ -n "$1" ]; do
    if [ -n "$query" ]; then
      query="${query}${delimiter}${prefix}$1"
    else
      query="${prefix}$1"
    fi
    shift
  done
  if [ `uname` = "Darwin" ]; then
    open -a "/Applications/Google Chrome.app" ${url}${query}
  elif [ `uname` = "Linux" ]; then
    chrome ${url}${query}
  fi
}

function qiita () {
  web_search "http://qiita.com/search?utf8=✓&q=" "+" "" $*
}

function google () {
  web_search "https://www.google.co.jp/search?&q=" "+" "" $*
}

function zman() {
    PAGER="less -g -s '+/^       "$1"'" man zshall
}
#}}}
#{{{ : if press enter, ls and git status
function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    ls
    # ↓おすすめ
    # ls_abbrev
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        echo
        echo -e "\e[0;33m--- git status ---\e[0m"
        gst
    fi
    zle reset-prompt
    return 0
}
zle -N do_enter
bindkey '^m' do_enter
#}}}

source $HOME/dotfiles/.zshrc.git

#################################
# {{{  養成ギブス
#################################

net_tools_deprecated_message () {
  echo -n 'net-tools コマンドはもう非推奨ですよ？おじさんなんじゃないですか？ '
}

case ${OSTYPE} in
    linux*) # not found command ip & ss in os x
        arp () {
          net_tools_deprecated_message
          echo 'Use `ip n`'
        }
        ifconfig () {
          net_tools_deprecated_message
          echo 'Use `ip a`, `ip link`, `ip -s link`'
        }
        iptunnel () {
          net_tools_deprecated_message
          echo 'Use `ip tunnel`'
        }
        iwconfig () {
          echo -n 'iwconfig コマンドはもう非推奨ですよ？おじさんなんじゃないですか？ '
          echo 'Use `iw`'
        }
        nameif () {
          net_tools_deprecated_message
          echo 'Use `ip link`, `ifrename`'
        }
        netstat () {
          net_tools_deprecated_message
          echo 'Use `ss`, `ip route` (for netstat -r), `ip -s link` (for netstat -i), `ip maddr` (for netstat -g)'
        }
        route () {
          net_tools_deprecated_message
          echo 'Use `ip r`'
        }
    ;;
esac
# }}}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# for mac settings
[[ -s $HOME/.zshrc.local ]] && source $HOME/.zshrc.local ]]
[[ -s $HOME/dotfiles/.zshrc.antigen ]] && source $HOME/dotfiles/.zshrc.antigen ]]
[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc ]]
eval "$(fasd --init auto)"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
#brew install coreutils
eval $(gdircolors $HOME/dotfiles/dircolors-solarized/dircolors.ansi-universal)
if [ -n "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi
