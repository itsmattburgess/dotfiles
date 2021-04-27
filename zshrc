# Core paths
export DOTFILES=$HOME/.dotfiles
export ZSH=$HOME/.oh-my-zsh
export PATH=$HOME:~/.composer/vendor/bin:/usr/local/sbin:/bin:/usr/local/bin:~/.cargo/bin:/opt/homebrew/opt/python@3.9/libexec/bin:$PATH

# Stop my screen being cluttered with udders
export ANSIBLE_NOCOWS=1

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="dracula"
SPACESHIP_PROMPT_SEPARATE_LINE=false

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

local plugins_dir="/opt/homebrew/share"
fpath=($plugins_dir/zsh-completions/src $fpath)

source $plugins_dir/zsh-autosuggestions/zsh-autosuggestions.zsh
source $plugins_dir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Custom ZSH Config files location
ZSH_CUSTOM=$DOTFILES

# Switch AWS profile
function switch_profile() {
    export AWS_PROFILE="${1}"
    export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id --profile ${1})
    export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key --profile ${1})
}

# Aliases
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias weather="curl -4 http://wttr.in"
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias nah="git reset --hard"
alias reload="source $HOME/.zshrc"
alias aws_whoami="aws sts get-caller-identity"
alias github="cd ~/Code/src/github.com"
alias tmuxcheat="open https://gist.github.com/henrik/1967800"
alias flushdns="sudo killall -HUP mDNSResponder"
alias listening="sudo lsof -iTCP -sTCP:LISTEN -n -P"
alias publicip="dig +short myip.opendns.com @resolver1.opendns.com"

# Treat failed globs like bash (to allow wildcards when using terraform)
setopt nonomatch

# Autosuggest
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=245'

# Machine specific config
[[ -a $HOME/.localrc ]] && source $HOME/.localrc

source $ZSH/oh-my-zsh.sh
