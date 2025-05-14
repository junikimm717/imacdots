source /etc/zshrc

export PATH="\
${ASDF_DATA_DIR:-$HOME/.asdf}/shims\
:/opt/homebrew/bin\
:$HOME/.local/bin\
:$HOME/go/bin\
:$PATH"
setopt autocd
export ZVM_CURSOR_STYLE_ENABLED=false

source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
zvm_after_init() {
  bindkey -M viins '^F' undefined-key
  bindkey -s '^F' 'tmuxs -d 3\n'
}

# worksapces variable for tmuxs to read in
export WORKSPACES="\
$HOME/mit/s2:\
$HOME/Documents/proj:\
$HOME/Documents/work:\
$HOME/.config/nvim:\
"

# =============================================
# Random Convenient Configurations

if [[ "$(command -v nvim)" ]]; then
    export EDITOR='nvim'
    export MANPAGER='nvim +Man!'
    export MANWIDTH=999
fi

# =============================================
# Juni's Aliases

alias ls='ls -G'
alias c='clear'
alias s='ls'
alias e='exit'

alias v='nvim'
alias vc='nvim ~/.config/nvim'
alias vz='nvim ~/.zshrc'

alias b='brew'

alias g='git'
alias gac='git add . && git commit'
alias gp='git push'
alias gr='git remote'
alias gb='git branch'

alias sz='source ~/.zshrc'
alias lpp='latexmk -pdf -pvc'
alias cp='cp -r'

z() {
  zathura --fork $@ > /dev/null 2>&1
}

mkcd ()
{
  mkdir -p "$1" && cd "$1"
}

# =============================================
# Additional zsh configuration

# completion paths
fpath=(
  "${ASDF_DATA_DIR:-$HOME/.asdf}/completions"
  "$(brew --prefix)/share/zsh/site-functions"
  $fpath
)
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select=2

# pure prompt (Install via homebrew)
autoload -U promptinit; promptinit
prompt pure

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
