#!/usr/bin/env sh

WORKSPACES=${WORKSPACES:-$HOME/Documents:$HOME/docs/prg}

IFS=':' findargs=$WORKSPACES

while test $# -gt 0; do
  case "$1" in
    -d|--depth)
      shift
      if test -z "$1"; then
        echo "No appropriate option given after depth"
        exit 1
      else
        depth="$1"
      fi
      shift;
      ;;
    -*)
      echo "Invalid option $1"
      exit 1
      ;;
    *)
      sessiondir="$1"
      shift;
      ;;
  esac
done

if test -z "$sessiondir"; then
  if ! test -z "$depth" && test "$depth" -eq 0; then
  sessiondir="$(find $findargs\
    \! -name '*.git*'\
    \! -name '*.vscode*'\
    \! -name '*.idea*'\
    \! -name '*node_modules*'\
    \! -name '*__pycache__*'\
    \! -name '*venv*'\
    -type d 2>/dev/null | fzf)"
  else
  sessiondir="$(find $findargs -maxdepth ${depth:-2}\
    \! -name '*.git*'\
    \! -name '*.vscode*'\
    \! -name '*.idea*'\
    \! -name '*node_modules*'\
    \! -name '*__pycache__*'\
    \! -name '*venv*'\
    -type d 2>/dev/null | fzf)"
  fi
fi

if test -z "$sessiondir" || ! test -d "$sessiondir"; then
  echo "$sessiondir is not a directory. Aborting..."
  exit 0
fi

name="$(realpath "$sessiondir" | tr '.' '_')"

if test -z "$TMUX" && test -z "$(pgrep tmux)"; then
  tmux new-session -c "$sessiondir" -s "$name"
else 
  if ! tmux has-session -t="$name" 2> /dev/null; then
    tmux new-session -d -c "$sessiondir" -s "$name"
  fi
  if test -z "$TMUX"; then
    tmux attach -t "$name"
  else
    tmux switch-client -t "$name"
  fi
fi
