bindkey -v #vimlike
function exists { which $1 &> /dev/null }
if exists nvim; then
  alias vi='nvim'
  alias vim='nvim'
else
  alias vi='vim'
fi
# vim no plugin mode
alias suvim='vim -u NORC'
alias ls='ls -lFGha'
alias grep='grep --color'
alias hgrep='history 0 | grep '
alias l='less'
alias -g G='| grep '
alias -g L='| less'
alias du='du -h'
alias df='df -h'
autoload -Uz zmv
alias zmv='noglob zmv -W'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

## ファイル操作の確認
alias cp="cp -i"
alias mv="mv -i"

if builtin command -v hub > /dev/null; then
  eval "$(hub alias -s)"
fi

############################################################
# Util methods
############################################################
function load-if-exists() { test -e "$1" && source "$1" }

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
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "^r" history-incremental-pattern-search-backward

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
#setopt complete_aliases # aliasも補完に含める
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


############################################################
# ls hook
############################################################
typeset -ga chpwd_functions

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
                opt_ls=('-lFG')
            fi
            ;;
    esac

    local ls_result
    ls_result=$(CLICOLOR_FORCE=1 COLUMNS=$COLUMNS command $cmd_ls ${opt_ls[@]}) #| sed $'/^\e\[[0-9;]*m$/d')

    local ls_lines=$(echo "$ls_result" | wc -l | tr -d ' ')

    if [ $ls_lines -gt 20 ]; then
        echo "$ls_result" | head -n 10
        echo '...'
        echo "$ls_result" | tail -n 10
        echo "$(command ls -1 -A | wc -l | tr -d ' ') files exist"
    else
        echo "$ls_result"
    fi
}
chpwd_functions+=ls_abbrev

############################################################
# zsh library
############################################################
# z.sh
autoload -Uz is-at-least
_Z_CMD=j
_Z_DATA=~/dotfiles/zsh/.z
if is-at-least 4.3.9; then
  load-if-exists $HOME/dotfiles/zsh/z/z.sh
else
  _Z_NO_PROMPT_COMMAND=1
  load-if-exists $HOME/dotfiles/zsh/z/z.sh && {
    function precmd_z() {
      _z --add "$(pwd -P)"
    }
    precmd_functions+=precmd_z
  }
fi
test $? || unset _Z_CMD _Z_DATA _Z_NO_PROMPT_COMMAND
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'

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

# {{{ peco setting
function exists { which $1 &> /dev/null }
#if exists go; then
    export GOPATH=$HOME/go
#    export GOROOT=/usr/local/opt/go/libexec
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
#fi
if exists peco; then
    function peco-select-history() {
        local tac
        if which tac > /dev/null; then
            tac="tac"
        else
            tac="tail -r"
        fi
        BUFFER=$(history -n 1 | \
            eval $tac | \
            peco --query "$LBUFFER")
        CURSOR=$#BUFFER
        zle clear-screen
    }
    zle -N peco-select-history
    bindkey '^r' peco-select-history

    function peco-find-file() {
        if git rev-parse 2> /dev/null; then
            source_files=$(git ls-files)
        else
            source_files=$(find . -type f)
        fi
        selected_files=$(echo $source_files | peco --prompt "[find file]")

        result=''
        for file in $selected_files; do
            result="${result}$(echo $file | tr '\n' ' ')"
        done

        BUFFER="${BUFFER}${result}"
        CURSOR=$#BUFFER
        zle redisplay
    }
    zle -N peco-find-file
    bindkey '^q' peco-find-file

    if exists ghq; then
        function peco-src () {
            local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
            if [ -n "$selected_dir" ]; then
                BUFFER="cd ${selected_dir}"
                zle accept-line
            fi
            zle clear-screen
        }
        zle -N peco-src
        bindkey '^a' peco-src
    fi
fi

# }}}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
load-if-exists $HOME/dotfiles/.zshrc.git
load-if-exists $HOME/.pythonbrew/etc/bashrc
load-if-exists $HOME/.zshrc.local

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

# from:gh-r
zplug "peco/peco", as:command, from:gh-r, use:"*amd64*"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi
zplug load --verbose

export PATH="$HOME/.rbenv/bin:$PATH"
if exists rbenv; then
  eval "$(rbenv init -)"
else
  echo "not install rbenv"
fi
#brew install coreutils
if exists gdircolors; then
  eval $(gdircolors $HOME/dotfiles/dircolors-solarized/dircolors.ansi-universal)
else
  if ! exists dircolors; then
    echo "not install gdircolors, 'brew install coreutils'"
  fi
fi
if [ -n "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi
