
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
#export PS1="\[\e[1;32m\]\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export PS1="\[\e[1;32m\][\u@\h \W]\[\e[0m\]\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

export CHEF_USER=gardella
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ga='git add -A'
alias gc='git checkout'
alias gcm='git commit'
alias gd='git diff'
alias gs='git status'
alias ls='ls -GFh'
alias bekc='bundle exec knife cluster'
alias be='bundle exec'
alias la='ls -la'
export PATH="$(brew --prefix)/bin:$PATH"

# Colorized grep output
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='0;32'

#PS1='[\u@\h \W]\$ '  # Default
#PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '

# Open Mac OSX emacs
if [[ -x /usr/local/Cellar/emacs/24.3/bin ]] ; then
  alias gmacs="/usr/local/Cellar/emacs/24.5/Emacs.app/Contents/MacOS/Emacs"
  alias emacs="/usr/local/Cellar/emacs/24.5/bin/emacs"
  alias emacsclient="/usr/local/Cellar/emacs/24.5/bin/emacsclient"
fi

if [ -n "$INSIDE_EMACS" ]; then
  alias emacs="emacs-within-emacs"
fi

function emacsd() {
  emacs --daemon
}

function emacst() {
  emacsclient -t --eval "(multi-term)"
}

function emacs-within-emacs() {
  emacsclient -n "$@"
}

export PATH="/usr/local/apache-maven/apache-maven-3.2.3/bin:$PATH"
export JAVA_HOME=`/usr/libexec/java_home`
#export PATH="$JAVA_HOME:$PATH"

HISTSIZE=1000000000
HISTFILESIZE=1000000000

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
