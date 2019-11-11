# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$HOME/Source/go/bin:$PATH"
export DOTFILES="$HOME/source/dotfiles"
export VS="$HOME/.vim-sessions"
export GOPATH="$HOME/Source/go"

# Path to your oh-my-zsh installation.
export ZSH=/Users/johnvarga/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

fpath=(/usr/local/share/zsh-completions $fpath)

# export MANPATH="/usr/local/man:$MANPATH"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_STRATEGY=tuncate_from_right

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# enable syntax highlighting in less
# `brew install source-highlight`
#
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='ls -AGFoh'
alias love='/Applications/love.app/Content/MacOS/love'
alias reloadbash='. $HOME/.bash_profile'
# color grep output
alias grep='grep --color=auto'
# easy sha1
alias sha1='openssl sha1'
# better mkdir
alias mkdir='mkdir -pv'
# quickly get headers for url
alias header='curl -I'
# resume wget by default
alias wget='wget -c'
# list directories, one per line (useful for sending to other scripts/commands)
alias directories='ls -1p | grep "/$" | sed "s/\/$//"'
# hg aliases
alias hgin='hg incoming | grep changeset | wc -l'
# helpful yarn command
alias yu='yarn upgrade-interactive'
# shortcut editors
alias ez='vim ${HOME}/.zshrc'
alias ev='vim ${HOME}/.vimrc'
alias evp='vim ${DOTFILES}/scripts/vim-plugins.sh'
# default tree showing disk usage
alias tree='tree --du -h -I node_modules'
# default du to human readable sizes
alias du='du -h'
# better settings for less
alias less='less -m -N -g -i -J --underline-special --SILENT'
# open tig stash fast
alias ts='tig stash'
alias tiga='tig --all'

# git aliases
alias lg='git lg'
alias lga='git lg --branches --remotes --tags'
alias s='git status --short --branch'
alias st='git status'
alias gs='git status'
alias gd='git diff'
alias dc='git diff --cached'
alias a='git add -u'
alias ap='git add -p'
alias ai='git add -i'
alias cm='git commit --verbose --message'
alias amend='git commit --amend --no-edit'
alias cma='git commit --amend'
alias cop='git restore --patch'
alias pull='git fetch --all --prune && git merge --ff-only'
alias push='git push'
alias gitl='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short'
alias changes='git log --oneline --graph --stat --dirstat'
alias cont='git rebase --continue'
alias mt='git mergetool'
alias ss='git stash'
alias pp='git stash pop'
alias diffdev='git diff develop..'
alias pushb='git push -u origin'
alias bd='git branch -d'
alias bD='git branch -D'
alias co='git co -'

# easier to run `npm start`
alias ns='npm start'

# quick http GET/POST
alias get='curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET $1'
alias post='curl --data "$2" $1'

# validate jenkinsfiles
validate-jenkins() {
    curl 'http://jenkins.inviewcloud.com/pipeline-model-converter/validate' -F "jenkinsfile=<Jenkinsfile"
}

# git fixup easy (fix <hash>)
git_fixup() {
    git commit --fixup="$1"
}
alias fix=git_fixup

# preview markdown files
rmd() {
    pandoc $1 | lynx -stdin
}

_dotnet_zsh_complete() {
    local dotnetPath=$words[1]
    local completions=("$(dotnet complete "$words")")
    reply=( "${(ps:\n:)completions}" )
}
compctl -K _dotnet_zsh_complete dotnet

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
