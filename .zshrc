# vim: fdm=marker:noai:ts=4:sw=4

#Typematic delay 
xset r rate 200 35

export TERM="xterm-256color"

#The fuck
  eval $(thefuck --alias) 

# Plugins {{{
  source $HOME/.zsh/plugins/archlinux/archlinux.plugin.zsh
  source $HOME/.zsh/plugins/colorize/colorize.plugin.zsh 
  source $HOME/.zsh/plugins/history/history.plugin.zsh
  source $HOME/.zsh/plugins/vi-mode/vi-mode.plugin.zsh
  source $HOME/.zsh/plugins/web-search/web-search.plugin.zsh
  source $HOME/.zsh/plugins/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
  source $HOME/.zsh/plugins/z/z.sh
  source $HOME/.zsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh

# }}}

# Custom Plugins {{{

  source ~/.zsh/custom/aliases.zsh
  source ~/.zsh/custom/completion.zsh #check
  source ~/.zsh/custom/history.zsh
  source ~/.zsh/custom/options.zsh #check
  source ~/.zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  source ~/.zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source ~/.zsh/custom/setopt.zsh
  source ~/.zsh/custom/theme.zsh
  source ~/.zsh/custom/transfer.zsh
  source ~/.zsh/custom/up.zsh
  source ~/.zsh/custom/youtube.zsh
  source ~/.zsh/plugins/powerlevel9k/powerlevel9k.zsh-theme
  source ~/.zsh/plugins/vim-interaction/vim-interaction.plugin.zsh

# }}}

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes


# Uncomment the following line to use case-sensitive completion.
 CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000000
export SAVEHIST=10000000
HIST_STAMPS="mm/dd/yyyy"
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.


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

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
