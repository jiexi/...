#########################################
# Environment
#########################################
set -x PATH ~/.config/bin $PATH
set -x EDITOR vim


#########################################
# Alias
#########################################
# cd
alias ..  "cd .."
alias ... "cd ../.."

# TODO(JL): clean these up
# git
# alias gp  "git pull"
# alias gpp "git pullpush"
# alias gs  "git st"

# utilities
# alias f "vifm ."
# alias t "tmux"
# alias v "nvim"
# alias todol "todo list --sort priority,-due"

# clipboard
# alias cbc "clipboard copy"
# alias cbp "clipboard paste"

# docker
# alias dc   "docker-compose"
# alias dcub "docker-compose up --build"


#########################################
# Etc
#########################################
set fish_greeting ""

function fish_title
  prompt_pwd
  echo -n " - Fish"
end

if [ (tty) = "/dev/tty1" ]
  exec sway 
end