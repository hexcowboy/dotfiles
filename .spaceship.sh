SPACESHIP_GIT_USER_PREFIX="${SPACESHIP_GIT_USER_PREFIX="as "}"
SPACESHIP_GIT_USER_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_GIT_USER_SYMBOL="${SPACESHIP_GIT_USER_SYMBOL=" "}"
SPACESHIP_GIT_EMAIL_SYMBOL="${SPACESHIP_GIT_EMAIL_SYMBOL=" "}"
SPACESHIP_GIT_USER_COLOR="${SPACESHIP_GIT_USER_COLOR="red"}"

spaceship_git_user() {
  spaceship::is_git || return

  local section=""
  local username="$(git config user.name)"
  local email="$(git config user.email)"

  if [[ -n $email ]]; then
    section+="$SPACESHIP_GIT_EMAIL_SYMBOL"
  fi

  if [[ -n $username ]]; then
    section+="$SPACESHIP_GIT_USER_SYMBOL$username "
  fi

  if [[ -n $section ]]; then
    spaceship::section \
      "$SPACESHIP_GIT_USER_COLOR" \
      "$SPACESHIP_GIT_USER_PREFIX" \
      "$section"
  fi
}

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  git_user      # Current git user name
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubecontext   # Kubectl context section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  #vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
