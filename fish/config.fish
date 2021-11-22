set Path $HOME/.nodenv/bin $HOME/bin $Path

export DOCKER_HOST=unix:///run/user/501/docker.sock

set -x EDITOR vim

startship init fish | source

eval (nodenv init - | source)
