#
# Completion enhancements
#

[[ ${TERM} != 'dumb' ]] && () {
  # Load and initialize the completion system
  local zdumpfile
  zstyle -s ':zim:completion' dumpfile 'zdumpfile' || zdumpfile="${ZDOTDIR:-${HOME}}/.zcompdump"
  autoload -Uz compinit && compinit -C -d ${zdumpfile}

  #
  # Zsh options
  #

  # Move cursor to end of word if a full completion is inserted.
  setopt ALWAYS_TO_END

  # Make globbing case insensitive.
  setopt NO_CASE_GLOB

  # Don't beep on ambiguous completions.
  setopt NO_LIST_BEEP

  #
  # Completion module options
  #

  # Group matches and describe.
  zstyle ':completion:*:*:*:*:*' menu select
  zstyle ':completion:*:matches' group yes
  zstyle ':completion:*:options' description yes
  zstyle ':completion:*:options' auto-description '%d'
  zstyle ':completion:*:corrections' format '%F{green}-- %d (errors: %e) --%f'
  zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
  zstyle ':completion:*:messages' format '%F{purple}-- %d --%f'
  zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'
  zstyle ':completion:*' format '%F{yellow}-- %d --%f'
  zstyle ':completion:*' group-name ''
  zstyle ':completion:*' verbose yes
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' '+r:|?=**'

  # Directories
  if (( ${+LS_COLORS} )); then
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
  else
    # Use same LS_COLORS definition from utility module, in case it was not set
    zstyle ':completion:*:default' list-colors ${(s.:.):-di=1;34:ln=35:so=32:pi=33:ex=31:bd=1;36:cd=1;33:su=30;41:sg=30;46:tw=30;42:ow=30;43}
  fi
  zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
  zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
  zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'expand'
  zstyle ':completion:*' squeeze-slashes true

  # Enable caching
  zstyle ':completion::complete:*' use-cache on
  zstyle ':completion::complete:*' cache-path "${ZDOTDIR:-${HOME}}/.zcompcache"

  # Ignore useless commands and functions
  zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec)|prompt_*)'

  # Completion sorting
  zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

  # Man
  zstyle ':completion:*:manuals' separate-sections true
  zstyle ':completion:*:manuals.(^1*)' insert-sections true

  # History
  zstyle ':completion:*:history-words' stop yes
  zstyle ':completion:*:history-words' remove-all-dups yes
  zstyle ':completion:*:history-words' list false
  zstyle ':completion:*:history-words' menu yes

  # Ignore multiple entries.
  zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
  zstyle ':completion:*:rm:*' file-patterns '*:all-files'

  # If the _my_hosts function is defined, it will be called to add the ssh hosts
  # completion, otherwise _ssh_hosts will fall through and read the ~/.ssh/config
  zstyle -e ':completion:*:*:ssh:*:my-accounts' users-hosts \
    '[[ -f ${HOME}/.ssh/config && ${key} == hosts ]] && key=my_hosts reply=()'
}
