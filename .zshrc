# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$HOME/Source/go/bin:$HOME/bin:$PATH"
export DOTFILES="$HOME/source/dotfiles"
export VS="$HOME/.vim-sessions"
export GOPATH="$HOME/Source/go"

# Path to your oh-my-zsh installation.
export ZSH=/Users/johnvarga/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-vim-mode
)

source $ZSH/oh-my-zsh.sh

# User configuration

fpath=(/usr/local/share/zsh-completions $fpath)

# export MANPATH="/usr/local/man:$MANPATH"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_from_right

MODE_CURSOR_VIINS="#ffffff steady underline"
MODE_CURSOR_VICMD="#ffffff steady block"

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
alias ta='tig --all'
# shortcut for stashing in patch mode
alias stash='git stash save -p "$1"'

# git aliases
alias lg='git lg'
alias lga='git lg --branches --remotes --tags'
alias s='git status --short --branch'
alias st='git status'
alias gs='git status'
alias gd='git diff'
# diff cached and staged are synonyms. ds is much easier to type but dc 
# is in my muscle memory... so use both for transition
alias dc='git diff --cached'
alias ds='git diff --staged'

alias a='git add -u'
alias ap='git add --patch'
alias ai='git add --interactive'
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
alias delb='git push --delete origin'
alias bd='git branch -d'
alias bD='git branch -D'
alias co='git co -'
alias branch='git rev-parse --abbrev-ref HEAD'

# open reflog in tig
alias refs='git reflog --pretty=raw | tig --pretty=raw'

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
alias fix='f() { git commit --fixup="$1"; }; f'
# fast-foward arbitrary branch without checking it out
alias ff='f() { git fetch origin "$1":"$1"; }; f'

alias react-tags='!f() { ctags --map-javascript=.jsx -R "$1" }; f'
# create an empty commit (for demos)
alias mc='f() { git commit --allow-empty -m "$1"; }; f'

# preview markdown files
rmd() {
    pandoc $1 | lynx -stdin
}

# load completions
[[ -f $HOME/.completions ]] && . $HOME/.completions

