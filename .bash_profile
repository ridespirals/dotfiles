# prevent ctrl+d from killing the window
export IGNOREEOF=42

alias ls='ls -AGFoh --color'
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
# default tree showing disk usage
alias tree='tree --du -h'
# better settings for less
alias less='less -m -N -g -i -J --underline-special --SILENT'
alias ts='tig stash'
alias ta='tig --all'
alias stash='git stash save -p "$1"'

alias ..='cd ..'

# git aliases
alias lg='git lg'
alias lga='git lg --branches --remotes --tags'
alias lgaa='git lg --all'
alias s='git status -s --branch'
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
alias cop='git checkout --patch'
alias pull='git fetch --all --prune && git merge --ff-only'
alias push='git push'
alias gitl='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short'
alias changes='git log --oneline --graph --stat --dirstat'
alias cont='git rebase --continue'
alias mt='git mergetool'
alias ss='git stash'
alias pp='git stash pop'
alias diffdev='git diff develop..'
alias reb='git rebase -i develop'
alias pushb='git push -u origin'
alias bd='git branch -d'
alias co='git co -'

# easier to run `npm start`
alias ns='npm start'


# fixup commit

# git fixup easy (fix <hash>)
git_fixup() {
    git commit --fixup="$1"
}
alias fix=git_fixup


fastFowardBranch() {
    # this will fast-foward merge another branch without checking it out
    # Fork lets you do this by right-clicking any branch 
    git fetch origin "$1":"$1"
}
alias ff=fastFowardBranch

