# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/.local/bin:$HOME/Documents/projects/mktex:$HOME/.emacs.d/bin:$PATH
ZSH_DISABLE_COMPFIX=true

source /etc/zshrc

# Path to your oh-my-zsh installation.
export ZSH="/Users/junikim/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="edvardm"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR=nvim
alias b='brew'

c() {
    clear
}

s() {
    ls $@
}

v() {
    $EDITOR $@
}

e() {
    exit $@
}
mkcd() {
    mkdir -p $1 && cd $1
}
gpl() {
  curl https://www.gnu.org/licenses/gpl-3.0.md -o LICENSE.md
}
alias gac="git add . && git commit"
alias code='open -a "Visual Studio Code"'
alias cp='cp -r'

alias vz='nvim ~/.zshrc'
alias sz='source ~/.zshrc'
alias nd='nix develop --command zsh'
alias nb='nix build'

prompt_tmux() {
    if test -z "$TMUX"; then
      read -q "CHOOSE?Use Tmux? [y/n]"
      if [[ $CHOOSE == "y" ]] || [[ $CHOOSE == "Y" ]]; then
        exec tmux
      fi
    fi
}

#eval "$(starship init zsh)"
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
set -o vi

bindkey -s "^f" "~/.local/bin/tmuxs -d 3\n"

# sources the configurations for this project.
alias vc='nvim ~/.config/nvim'

alias vy='nvim ~/.config/yabai/yabairc'
alias vs='nvim ~/.config/skhd/skhdrc'
alias lpp='latexmk -pdf -pvc'
alias latexmkrc='curl -LJ https://mit.junic.kim/latexmkrc.pl -o .latexmkrc'

export PATH=$HOME/go/bin:$PATH

 if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
 fi

truecolor() {
  curl -s https://raw.githubusercontent.com/JohnMorales/dotfiles/master/colors/24-bit-color.sh | bash
}

reset-cursor() {
  printf '%{\033]50;CursorShape=1\x7%}'
}

alias ldd='otool -L'
z() {
  # apparently the update broke the forking api sadge
  #zathura --fork $@ > /dev/null 2>&1
  zathura $@ > /dev/null 2>&1 &disown
}

alias mp='ncmpcpp'

lf () {
    tmp="$(mktemp)"
    # `command` is needed in case `lfcd` is aliased to `lf`
    command /usr/local/bin/lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

if [[ "$(command -v nvim)" ]]; then
    export EDITOR='nvim'
    export MANPAGER='nvim +Man!'
    export MANWIDTH=999
fi

export WORKSPACES=$WORKSPACES:$HOME/mit/s1:$HOME/Documents/proj:$HOME/Documents/work:$HOME/.config/nvim
export PATH=$HOME/Library/Application\ Support/texbld/bin:$PATH

#export PS1="$(reset-cursor)$PS1"
