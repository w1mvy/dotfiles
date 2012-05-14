############################################################
# キーバインド
############################################################
bindkey -v

# tmux起動
if [ $SHLVL = 1 ];then
    tmux
fi

############################################################
# エイリアス
############################################################
alias vi='vim'
alias ls='ls -FG --color'
alias la='ls -lhAF --color=auto'
alias ps='ps -fU$(whoami) --forest'
alias gh='history 0 | grep --color '
alias l='less'
alias g='grep --color'
alias -g G='| grep --color'
alias -g L='| less'
alias where='command -v'
alias du='du -h'
alias df='df -h'
alias vz='vim ~/.zshrc && . ~/.zshrc'
alias vv='vim ~/.vimrc'
alias vs='vim ~/.screenrc'
autoload -Uz zmv
alias zmv='noglob zmv -w'

## ファイル操作の確認
# alias rm="rm -i"
alias cp="cp -i"
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

#Titanium Develop
alias titanium="/home/w1mvy/.titanium/mobilesdk/linux/1.5.1/titanium.py"

############################################################
# プロンプト、色関係
############################################################
autoload -U colors
colors

#autoload promptinit
#promptinit
#prompt adam2
#PROMPT="%n%% "
#PROMPT="[${USER}@${HOST%%.*} %1~]%(!.#.$) "
#RPROMPT="[%~]"
#SPROMPT="correct: %R -> %r ? "

# 256色生成用関数
### red: 0-5
### green: 0-5
### blue: 0-5
color256(){
    local red=$1; shift
    local green=$2; shift
    local blue=$3; shift

    echo -n $[$red * 36 + $green * 6 + $blue + 16]
}

fg256(){
    echo -n $'\e[38;5;'$(color256 "$@")"m"
}

bg256(){
    echo -n $'\e[48;5;'$(color256 "$@")"m"
}

PROMPT="%{${fg[yellow]}%}[%n@%m]# %{${reset_color}%}" #左側
PROMPT2="%{${fg[yellow]}%}}->: %{${reset_color}%}" #2行以上のプロンプトの表示
SPROMPT="%{${fg[yellow]}%}correct:%R -> %r [n y a e]? %{${reset_color}%}" #入力を間違えたときの表示
RPROMPT="%{${fg[cyan]}%}[%~]%{${reset_color}%}" #右側

#ターミナルのタイトル[ユーザ@ホスト:カレントディレクトリ]
case "${TERM}" in
kterm*|xterm)
    precmd(){
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

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

bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

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

# カレントディレクトリ中に指定されたディレクトリがみつからなかった場合に
# 移動先を検索するリスト
cdpath=(~)
# ディレクトリが変わったらディレクトリスタックを表示
chpwd_functions=($chpwd_functions dirs)

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

# pythonbrew
if [ -s "$HOME/.pythonbrew/etc/bashrc" ]; then
  source "$HOME/.pythonbrew/etc/bashrc"
  alias mkvirtualenv="pythonbrew venv create"
  alias rmvirtualenv="pythonbrew venv delete"
  alias workon="pythonbrew venv use"
fi

# オレオレzshrc
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine


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
compinit
. $HOME/dotfiles/zsh/cdd/cdd
chpwd() {
    _cdd_chpwd
}
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'

# zaw.zsh
source $HOME/dotfiles/zsh/zaw/zaw.zsh
bindkey '^R' zaw-history
# zaw.zshでディレクトリスタック絞り込み
zmodload zsh/parameter
function zaw-src-dirstack() {
    : ${(A)candidates::=$dirstack}
    actions=("zaw-callback-execute" "zaw-callback-replace-buffer" "zaw-callback-append-to-buffer")
    act_descriptions=("execute" "replace edit buffer" "append to edit buffer")
}
zaw-register-src -n dirstack zaw-src-dirstack

# auto-fu.zsh
setopt   auto_list auto_param_slash list_packed rec_exact
unsetopt list_beep
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors 'di=1;34'
zstyle ':completion:*' format '%F{white}%d%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' remote-access false
zstyle ':completion:*' completer _oldlist _complete _match _ignored \
    _list _history

# precompiled source
function () { # precompile
    local A
    A=~/dotfiles/zsh/auto-fu/auto-fu.zsh
    [[ -e "${A:r}.zwc" ]] && [[ "$A" -ot "${A:r}.zwc" ]] ||
    zsh -c "source $A; auto-fu-zcompile $A ${A:h}" >/dev/null 2>&1
}
source ~/dotfiles/zsh/auto-fu/auto-fu; auto-fu-install
# initialization and options

zstyle ':auto-fu:highlight' input bold
zstyle ':auto-fu:highlight' completion fg=white,dim
zstyle ':auto-fu:highlight' completion/one fg=blue,dim
zstyle ':auto-fu:var' postdisplay ''
zstyle ':auto-fu:var' track-keymap-skip opp

function zle-line-init () { auto-fu-init }; zle -N zle-line-init

# afu+cancel
function afu+cancel () {
    afu-clearing-maybe
    ((afu_in_p == 1)) && { afu_in_p=0; BUFFER="$buffer_cur"; }
}
zle -N afu+cancel
function bindkey-advice-before () {
    local key="$1"
    local advice="$2"
    local widget="$3"
    [[ -z "$widget" ]] && {
        local -a bind
        bind=(`bindkey -M main "$key"`)
        widget=$bind[2]
    }
    local fun="$advice"
    if [[ "$widget" != "undefined-key" ]]; then
        local code=${"$(<=(cat <<"EOT"
            function $advice-$widget () {
                zle $advice
                zle $widget
            }
            fun="$advice-$widget"
EOT
        ))"}
        eval "${${${code//\$widget/$widget}//\$key/$key}//\$advice/$advice}"
    fi
    zle -N "$fun"
    bindkey -M afu "$key" "$fun"
}
bindkey-advice-before "^G" afu+cancel
bindkey-advice-before "^[" afu+cancel
bindkey-advice-before "^J" afu+cancel afu+accept-line
