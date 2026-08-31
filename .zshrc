# ================================
# Oh My Zsh base
# ================================

export ZSH="$HOME/.oh-my-zsh"

# Plugins (keep it light for fast startup)
plugins=(
  git
  zsh-autosuggestions
  command-not-found
)

# ================================
# Theme
# ================================
ZSH_THEME="avit"
RPROMPT=''


# ================================
# Java 17 (needed for Android Studio / Expo)
# ================================

export JAVA_HOME=$(/usr/libexec/java_home -v 17)
export PATH="$JAVA_HOME/bin:$PATH"


export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"



# ================================
# Bun
# ================================

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ================================
# NVM (Node Version Manager)
# ================================

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"     # Loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm use default >/dev/null 2>&1



# ================================
# Aliases
# ================================

alias cls="clear"

# Modern ls (eza)
alias ls='eza --git --icons=always --oneline --color=always --long --no-user --no-time --no-permissions'
alias la='eza -a --git --icons=always --color=always --long --no-user --no-time --no-permissions'
alias ll='eza -lah --git --icons=always'
alias lt='eza --tree --level=2 --icons=always'

# git
alias gch='git branch --all --format="%(refname:short)" | sed "s#^remotes/origin/##" | sort -u | fzf | xargs -r git checkout'





# ================================
# Homebrew
# ================================

eval "$(/opt/homebrew/bin/brew shellenv)"


# ================================
# FZF + FD + Bat + Eza integration
# ================================

# Load fzf keybindings if installed
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use fd instead of find
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Previews
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Smarter completion previews
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd) fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}'" "$@" ;;
    ssh) fzf --preview 'dig {}' "$@" ;;
    *) fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# Use fd for path completion
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}


# ================================
# Zoxide (smart cd)
# ================================

eval "$(zoxide init zsh)"
alias cd="z"


# Cursor agent
export PATH="$HOME/.local/bin:$PATH"


# ================================
# Cleanup
# ================================

source $ZSH/oh-my-zsh.sh
# Added by Antigravity IDE
export PATH="/Users/karanrao/.antigravity-ide/antigravity-ide/bin:$PATH"

# ================================
# Terminal editor (lazygit / git / etc.)
# ================================
export EDITOR=nvim
export VISUAL=nvim

# ================================
# Herdr (restore prompt on cold Ghostty start)
# ================================
if [[ "$TERM_PROGRAM" == "ghostty" ]] && [[ -o interactive ]] && [[ -z "$HERDR_ENV" ]] && [[ -t 0 ]]; then
  echo
  cat <<'EOF'
 /\_/\
( o.o )
 > ^ <
EOF
  echo
  read "REPLY?Restore herdr session? [Y/n] "
  if [[ -z "$REPLY" || "$REPLY" == [Yy]* ]]; then
    herdr
  fi
fi

