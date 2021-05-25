load ~/.zsh/environments/helpers.zsh && save-function-list
load ~/.zsh/environments/basic.zsh

start-emacs-session
rename-first-tab

# Custom functions & aliases.
mkpost() {
  test "$#" -eq 1 || (echo "Usage: mkpost hello-world" && return 1)
  mkdir "posts/$(date +%y-%m-%d)-$1"
  touch "posts/$(date +%y-%m-%d)-$1/$1.org"
  echo "posts/$(date +%y-%m-%d)-$1/$1.org"
}
        
report-custom-functions
