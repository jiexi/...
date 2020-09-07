#########################################
# Environment
#########################################
set -x PATH ~/.config/bin $PATH
set -x EDITOR vim
set -x VISUAL vim

# set -x GDK_DPI_SCALE 1.5
set -x CLUTTER_BACKEND wayland
# set -x XDG_CURRENT_DESKTOP sway
set -x XDG_CURRENT_DESKTOP Unity
set -x XDG_SESSION_TYPE wayland

#########################################
# Alias / Key Bindings
#########################################
# meta
alias config "cd ~/.config"
alias dotfiles "cd ~/.config"
alias reload "source ~/.config/fish/config.fish"

# sudo
alias please "sudo"

# fuck
thefuck --alias | source

# cd
alias ..  "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."

function cd
  builtin cd $argv
  ls -1
  echo
end


# TODO(JL): clean these up
# clipboard
# alias cbc "clipboard copy"
# alias cbp "clipboard paste"

# !! and !$ substitution
function bind_bang
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function bind_dollar
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

function fish_user_key_bindings
  bind ! bind_bang
  bind '$' bind_dollar
end

# yay
function yay
  set -l builtin_yay (which yay)
  if test "$argv"
    $builtin_yay $argv
    return
  end
  set -l news ($builtin_yay -Pw)
  if test -z "$news"
    $builtin_yay
    return
  end
  echo 'Manual intervention required:'
  echo "$news"
end

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

# TODO: Add dotfile update checker
# TODO: Add message if uncommitted dotfiles
