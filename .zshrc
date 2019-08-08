# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="af-magic"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  jira
)

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

# for the _gitWrap
fpath=(~/.zsh/completions $fpath) 
autoload -U compinit && compinit

# Aliasing hub to git

alias git=hub

#---------
#DECLARING VARIABLES
#---------

#TOMCAT
CATALINA_HOME="${HOME}/Downloads/tomcat/apache-tomcat-7.0.92"
CATALINA_OPTS="-agentlib:jdwp=transport=dt_socket,address=1043,server=y,suspend=n"

function tomcat() {
	case ${1} in 
		"start"|"boot")
			sh ${CATALINA_HOME}/bin/startup.sh
			;;
		"stop"|"shutdown"|"halt")
			sh ${CATALINA_HOME}/bin/shutdown.sh
			;;
		"goto")
			cd ${CATALINA_HOME}
			;;
		"debug")
			sh ${CATALINA_HOME}/bin/catalina.sh jpda start
			;;
		*)
			echo "> $0 start|stop|goto|debug"
			;;
	esac
}

#HOME
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_172.jdk/Contents/Home/"
export MVN_HOME="/Library/Maven/"
export M2_HOME="$MVN_HOME"
export KARAF_HOME="/Library/Karaf/"

#MAVEN
export MVN_OPTS=-"Xms2g -Djava.awt.headless=true"

export KARAF_DEBUG=true

#UPDATING PATH
PATH=${KARAF_HOME}bin:${PATH}
PATH=${MVN_HOME}bin:${PATH}
PATH="${HOME}/.jenv/bin:$PATH"

source ${HOME}/.jrc/main.sh

zmodload zsh/system
eval "$(jenv init -)"

if ! [ -z ${JAVA_HOME} ]; then
	function virtualenv_prompt_info() {
		print "$(echo ${JAVA_HOME} | rev | cut -f1 -d '/' | rev) :: "
	}
fi

#######
#zstyle ':completion:*' verbose yes
#zstyle ':completion:*:descriptions' format '%B%d%b'
#zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:warnings' format 'No matches for: %d'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*:*:run*:*' file-patterns '*.*sh'
#######

alias fixDisplay="displayplacer 'id:0B65C635-215F-EC8E-6E38-6DA5A94F8052 res:1920x1080 hz:30 color_depth:8 scaling:on origin:(0,0) degree:0' 'id:BA9FCB4F-AE29-1353-62A4-7116F1774300 res:1680x1050 color_depth:8 scaling:on origin:(-844,1080) degree:0' 'id:39AFBB9A-08CF-1845-5281-58517DDB87D6 res:1920x1080 hz:60 color_depth:8 scaling:on origin:(-1920,0) degree:0'"

