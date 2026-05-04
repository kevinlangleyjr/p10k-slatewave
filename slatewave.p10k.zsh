# slatewave.p10k.zsh — Slatewave palette + segment set for Powerlevel10k.
#
# Mirrors the slatewave-omp theme so a user running zsh+p10k gets the same
# prompt as a user running pwsh+oh-my-posh: identical segments, identical
# colors, identical separator glyphs.
#
# Source this *after* powerlevel10k itself loads (i.e. at the bottom of
# ~/.zshrc, below `source .../powerlevel10k.zsh-theme`):
#
#   [[ -f ~/.config/p10k/slatewave.p10k.zsh ]] && source ~/.config/p10k/slatewave.p10k.zsh
#
# Requires p10k 1.18.0+ (truecolor `#rrggbb` foreground/background syntax)
# and a Nerd Font (MesloLGS NF or Hack Nerd Font Mono) for the powerline
# and diamond separator glyphs.

'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob

  # Wipe any prior config so reruns don't leak state from another theme.
  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

  # ---------- segments ----------
  # Order mirrors slatewave-omp's left/right blocks.
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    os_icon
    context           # %n@%m, hidden in trivial sessions
    dir
    vcs
    virtualenv
    java_version
    newline
    prompt_char
  )
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    command_execution_time
    battery
    load              # 1-min CPU load (closest p10k native to OMP's sysinfo CPU)
    ram
    time
  )

  # ---------- separators / glyphs ----------
  typeset -g POWERLEVEL9K_MODE=nerdfont-complete
  typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''      #
  typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''     #
  typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''   #
  typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''  #
  typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=$' '

  # ---------- multiline structure (matches OMP's ╭─ / ╰─ frame) ----------
  typeset -g POWERLEVEL9K_PROMPT_ON_NEWLINE=true
  typeset -g POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%F{#5eead4}╭─%f'
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX=
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{#5eead4}╰─%f '
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' '

  # ---------- Slatewave palette ----------
  # Slate foundation
  local slate200='#e2e8f0'   # foreground
  local slate400='#94a3b8'   # muted text
  local slate700='#334155'   # selection / loading bg
  local slate800='#1e293b'   # deepest bg
  local ink='#193549'        # contrast text on bright bgs
  # Surfaces
  local surface='#2c313a'    # secondary bg (path, time)
  local raised='#3e4451'     # raised bg (os, ssh, sysinfo)
  # Accents
  local teal='#5eead4'       # signature
  local cyan_deep='#0e7490'  # battery charging/full
  local cyan_text='#ecfeff'  # high-contrast on cyan
  local sky='#38bdf8'        # git clean
  local amber='#fbbf24'      # warning
  local amber_deep='#b45309' # battery discharging
  local rose='#fb7185'       # git modified / load critical
  local red='#ef5350'        # prompt error

  # ---------- os_icon ----------
  typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=$raised
  typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=$slate200

  # ---------- context (ssh) ----------
  typeset -g POWERLEVEL9K_CONTEXT_BACKGROUND=$raised
  typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=$slate200
  typeset -g POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND=$raised
  typeset -g POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND=$slate200
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND=$rose
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=$ink
  typeset -g POWERLEVEL9K_ALWAYS_SHOW_USER=false
  typeset -g POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=false
  typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'

  # ---------- dir ----------
  typeset -g POWERLEVEL9K_DIR_BACKGROUND=$surface
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=$teal
  typeset -g POWERLEVEL9K_DIR_HOME_FOREGROUND=$teal
  typeset -g POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=$teal
  typeset -g POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=$teal
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=2

  # ---------- vcs (git) ----------
  # OMP maps clean→sky, modified/staged→rose, ahead/behind→magenta. p10k's
  # state buckets don't quite line up — modeled here as clean=sky, dirty=rose.
  typeset -g POWERLEVEL9K_VCS_BACKGROUND=$sky
  typeset -g POWERLEVEL9K_VCS_FOREGROUND=$ink
  typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND=$sky
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=$ink
  typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=$rose
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=$ink
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=$rose
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=$ink
  typeset -g POWERLEVEL9K_VCS_LOADING_BACKGROUND=$slate700
  typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND=$slate200
  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=' '            #
  typeset -g POWERLEVEL9K_VCS_COMMIT_ICON=' '            #
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='?'
  typeset -g POWERLEVEL9K_VCS_UNSTAGED_ICON='!'
  typeset -g POWERLEVEL9K_VCS_STAGED_ICON='+'
  typeset -g POWERLEVEL9K_VCS_STASH_ICON=' '             #
  typeset -g POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='⇣'
  typeset -g POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='⇡'

  # ---------- virtualenv ----------
  typeset -g POWERLEVEL9K_VIRTUALENV_BACKGROUND=$raised
  typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=$teal
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=true
  typeset -g POWERLEVEL9K_VIRTUALENV_LEFT_DELIMITER=
  typeset -g POWERLEVEL9K_VIRTUALENV_RIGHT_DELIMITER=

  # ---------- java_version ----------
  typeset -g POWERLEVEL9K_JAVA_VERSION_BACKGROUND=$surface
  typeset -g POWERLEVEL9K_JAVA_VERSION_FOREGROUND=$teal
  typeset -g POWERLEVEL9K_JAVA_VERSION_FULL=true

  # ---------- prompt_char (╰─❯$) ----------
  typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=$teal
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=$red
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIINS_CONTENT_EXPANSION='❯$'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VICMD_CONTENT_EXPANSION='❮$'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIVIS_CONTENT_EXPANSION='V$'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIOWR_CONTENT_EXPANSION='▶$'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VIINS_CONTENT_EXPANSION='❯$'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_LEFT_WHITESPACE=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_RIGHT_WHITESPACE=

  # ---------- command_execution_time ----------
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=$slate400
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT=H:M:S
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PREFIX=' '   #

  # ---------- battery ----------
  typeset -g POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND=$cyan_deep
  typeset -g POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND=$cyan_text
  typeset -g POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND=$cyan_deep
  typeset -g POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND=$cyan_text
  typeset -g POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND=$amber_deep
  typeset -g POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND=$cyan_text
  typeset -g POWERLEVEL9K_BATTERY_LOW_BACKGROUND=$amber_deep
  typeset -g POWERLEVEL9K_BATTERY_LOW_FOREGROUND=$cyan_text
  typeset -g POWERLEVEL9K_BATTERY_LOW_THRESHOLD=20
  typeset -g POWERLEVEL9K_BATTERY_VERBOSE=true

  # ---------- load (CPU) ----------
  typeset -g POWERLEVEL9K_LOAD_BACKGROUND=$raised
  typeset -g POWERLEVEL9K_LOAD_NORMAL_FOREGROUND=$slate400
  typeset -g POWERLEVEL9K_LOAD_WARNING_FOREGROUND=$amber
  typeset -g POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND=$rose
  typeset -g POWERLEVEL9K_LOAD_WHICH=1
  typeset -g POWERLEVEL9K_LOAD_PREFIX='CPU '

  # ---------- ram ----------
  typeset -g POWERLEVEL9K_RAM_BACKGROUND=$raised
  typeset -g POWERLEVEL9K_RAM_FOREGROUND=$slate400
  typeset -g POWERLEVEL9K_RAM_PREFIX='RAM '

  # ---------- time ----------
  typeset -g POWERLEVEL9K_TIME_BACKGROUND=$surface
  typeset -g POWERLEVEL9K_TIME_FOREGROUND=$teal
  typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%-l:%M %p}'
  typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=true
  typeset -g POWERLEVEL9K_TIME_PREFIX=' '   #

  # ---------- transient prompt: collapse old prompts on enter ----------
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always

  # ---------- instant prompt + reload ----------
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose
  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

  (( ! $+functions[p10k] )) || p10k reload
}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
