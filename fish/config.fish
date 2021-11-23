if status is-interactive
  # Commands to run in interactice sessions can go here
end

set Path $HOME/.nodenv/bin $HOME/bin $Path

export DOCKER_HOST=unix:///run/user/501/docker.sock

set -x EDITOR vim

starship init fish | source

eval (nodenv init - | source)
