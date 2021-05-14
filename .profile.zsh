export EMACS_SERVER=$(basename $PWD)

if ! test -S /tmp/emacs$(id -u)/$EMACS_SERVER; then
  echo "$(tput setaf 2)~$(tput sgr0) Starting Emacs session $(tput setaf 7)$EMACS_SERVER$(tput sgr0)"
  emacs --daemon=$EMACS_SERVER
fi

# Rename first tab.
if test $(tmux display-message -p '#I') = "1"; then
  tmux rename-window "E:$EMACS_SERVER"
fi

e() { (test "$#" -eq 0) && emacsclient -s $EMACS_SERVER README.org || emacsclient -s $EMACS_SERVER $@ }

mkpost() {
  test "$#" -eq 1 || (echo "Usage: mkpost hello-world" && return 1)
  mkdir "posts/$(date +%y-%m-%d)-$1"
  touch "posts/$(date +%y-%m-%d)-$1/$1.org"
  echo "posts/$(date +%y-%m-%d)-$1/$1.org"
}

echo "\n  $(tput setaf 2)Functions: $(tput setaf 7)mkpost$(tput sgr0)."
