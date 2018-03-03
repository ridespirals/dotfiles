export PATH="/usr/local/sbin:$PATH"
export VS="$HOME/.vim-sessions"

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
# hg aliases
alias hgin='hg incoming | grep changeset | wc -l'

# git aliases
alias s='git status -s'
alias st='git status'
alias gs='git status'
alias gd='git diff'
alias dc='git diff --cached'
alias a='git add -u'
alias ap='git add -p'
alias cm='git commit --verbose -m $1'
alias amend='git commit --amend --no-edit'
alias pull='git pull'
alias push='git push'
alias gitl='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short'
alias changes='git log --oneline --graph --stat --dirstat'

# lua love
alias love="/Applications/love.app/Contents/MacOS/love"

# ctags alias for better javascript ctags
#alias jtags=”ctags -R app config lib && sed -i '' -E '/^(if|switch|function|module\.exports|it|describe).+language:js$/d' tags”

# generate sublime project
alias sublimeproject="echo '{\"folders\":[{\"path\":\".\"}]}' > '$1.sublime-project'"

# find current ip address
alias myip="curl ipecho.net/plain ; echo"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# git branch PS1 bash prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

source $HOME/.bash-powerline.sh

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
# screensaver. call pipes.sh if it exists
if [[ $(which pipes.sh | wc -c) -ne 0 ]]; then
    # TODO: chose a random pipe char (including none for thd defaults
    RANGE=5
    number=$RANDOM
    let "number %= $RANGE"
    alias ss="pipes.sh -t c################ -p 2"
fi

# when using zenburn, use bright blue for directories (like ls)
#LSCOLORS=$LSCOLORS:'d=0;35:' ; export LSCOLORS
