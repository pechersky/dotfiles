# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# GARDEN INIT
garden() { { . <(/usr/bin/garden-exec --shell=zsh "$@"); } 3>&1; }
# GARDEN IMPORTS
garden load git/2.9.3-12A/bin
garden load git-review/1.25.0-08A/bin
garden load git-repo/1.12.16-03A/bin
garden load freerdp/0.8.2-01/bin
garden load htop/1.0.3-03/bin
garden load vim/8.0.0314-12B/bin
#garden load pylint/1.6.4-03/lib-python


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Append history such that every terminal shares the command history
setopt inc_append_history
SAVEHIST=1000000

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

#export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
# source /usr/local/bin/virtualenvwrapper.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias edit-vim="vim ~/.vimrc"
alias xcl="xclip -selection clipboard"

alias remotewin='xfreerdp -a 16 -g 960x1040 -d deshaw spacemap -r sound:remote &'
alias gerrit="ssh gerrit gerrit"

function job_parse() {
  first_digit=`echo $1 | cut -c1`
  sub_dir_digits=`echo $1 | cut -c2-4 | bc`
  echo "/d/en/workdir-0/${first_digit}/${sub_dir_digits}/$1"
}

function job_cd() {
  cd `job_parse $1`
}

alias jcd="job_cd"
alias jp="job_parse"
fpath=(~/.zsh/completion $fpath)
plugins+=(zsh-completions)
autoload -Uz compinit && compinit -i
autoload -Uz bashcompinit && bashcompinit

export CUDA_VISIBLE_DEVICES=0
export PATH="/u/nyc/pechersk/.local/bin:$PATH"
export PATH="/u/nyc/pechersk/.cabal/bin:$PATH"
export PATH="/u/nyc/pechersk/Downloads/stack-1.2.0-linux-x86_64:$PATH"

#function git_prompt_info() {
  #ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  #echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
#}

#function parse_git_dirty() {
  #git_prompt_info
#}
#export DISABLE_UNTRACKED_FILES_DIRTY="true"

setopt noflowcontrol
stty stop undef