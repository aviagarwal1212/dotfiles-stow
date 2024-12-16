# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zinit plugin manager
# should be the first thing after p10k init
# p10k init only happens if the file exists, otherwise nothing happens

# Set the directory for zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if it doesn't exist
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source the file
source "${ZINIT_HOME}/zinit.zsh"

# Add in powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k 

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::command-not-found

zi ice as"completion"
zi snippet OMZP::docker/completions/_docker

zi ice as"completion"
zi snippet OMZP::asdf/asdf.plugin.zsh

# Load completions
fpath=(~/.zsh $fpath)
autoload -U compinit && compinit
zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Keybindings
bindkey -v

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt autocd notify
unsetopt beep

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# PATH setup
export PATH="$HOME/.local/share/mise/shims:$PATH"
export PATH="/home/avi/.mix/escripts:$PATH"
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"

# Aliases
alias la='ls -Alh --color'
alias ll='ls -lh --color'
alias lg='lazygit'
alias ld='lazydocker'
alias winget='winget.exe'
alias open='explorer.exe'
alias dnf='sudo dnf'

# Environment variables
export EDITOR='nvim' # use vscode as default editor for the shell
export ERL_FLAGS='-kernel shell_history enabled' # for iex, allows history across sessions
export ELIXIR_ERL_OPTIONS="+fnu" # for livebook, but doesn't seem to work
export DISPLAY=:0 # use WSLg
export FZF_ALT_C_COMMAND='fd -H . $HOME'

# Setup FZF
source <(fzf --zsh)
# Setup mise
source <(mise activate zsh)




