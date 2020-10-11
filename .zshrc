# ターミナルのタイトル
function settitle() {
	Pwd=`pwd | sed -r "s|${HOME}|~|g"`
	case "${TERM}" in
	xterm*|kterm*|rxvt*)
		echo -ne "\033]0;${USER}: ${Pwd}\007"
		# echo -ne "\033]0;${USER}@${HOST}: ${Pwd}\007"
		;;  
	esac
}

# hook関数の利用
autoload -Uz add-zsh-hook
add-zsh-hook precmd settitle
add-zsh-hook preexec settitle
add-zsh-hook chpwd settitle

#title=[${USER}@${HOST%%.*}]$PWD

# ヒストリー関係
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=100000
alias history='history -150 | fzf'
function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

# 補完
autoload -Uz compinit
compinit

# 補完候補のハイライト
zstyle ':completion:*:default' menu select=2

# カラー
autoload -Uz colors
colors
#PROMPT="%{[38;5;197m%}%n@%m%{${reset_color}%}:%{[38;5;211m%}%~%{${reset_color}%}$ "
PROMPT="%{[38;5;152m%}%n@%m%{${reset_color}%}:%{[38;5;79m%}%~%{${reset_color}%}$ "
eval `dircolors -b ~/.colorrc`

# less
export LESSOPEN='| $HOME/.source-highlight/src-hilite-lesspipe.sh %s'
export LESS='-RFX'

# エイリアス
alias battery='upower --enumerate | grep battery | xargs upower -i | grep percentage | sed -r "s/percentage/\x1b[38;5;217m&\x1b[0m/gi"'
alias date='date | sed -r "s/([0-9][0-9]:[0-9][0-9]):[0-9][0-9]/\x1b[38;5;217m\1\x1b[0m/g"'
alias ls='ls --color=auto'
alias la='ls -a'
alias sl='ls'
alias SL='ls'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias exa='exa -l'
alias gdb='gdb -q'
alias termcolors='perl $HOME/.termcolors.pl'
alias Log='perl $HOME/.log.pl'
alias -g platex='platex -halt-on-error -interaction=nonstopmode -file-line-error'

# cdの後にlsを実行
chpwd() { ls --color=auto }

# ディレクトリ名だけでcdする
setopt auto_cd

# 高品質なワイルドカード
setopt extended_glob

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Gitのブランチ表示
#RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%{[38;5;217m%}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

# git worktree の移動
function cdworktree() {
    # カレントディレクトリがGitリポジトリ上かどうか
    git rev-parse &>/dev/null
    if [ $? -ne 0 ]; then
        echo fatal: Not a git repository.
        return
    fi

    local selectedWorkTreeDir=`git worktree list | fzf | awk '{print $1}'`

    if [ "$selectedWorkTreeDir" = "" ]; then
        # Ctrl-C.
        return
    fi

    cd ${selectedWorkTreeDir}
}

# Golang
export PATH=$PATH:/usr/local/go/bin

