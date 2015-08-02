# Exec time

export LAST_EXEC_TIME="0"

function pad_hook_preexec {
    timer=${timer:-$SECONDS}
}

function pad_hook_precmd {
    if [ $timer ]; then
        export LAST_EXEC_TIME="$(($SECONDS - $timer))"
        unset timer
    fi
}

add-zsh-hook preexec pad_hook_preexec
add-zsh-hook precmd pad_hook_precmd

# Get the status of the working tree (copied and modified from git.zsh)

# Checks if current branch is behind of remote
function git_prompt_behind() {
  if [[ -n "$(command git rev-list HEAD..origin/$(current_branch) 2> /dev/null)" ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi
}

# Checks if current branch exists on remote
function git_prompt_remote() {
  if [[ -n "$(command git show-ref origin/$(current_branch) 2> /dev/null)" ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_REMOTE_EXISTS"
  else
    echo "$ZSH_THEME_GIT_PROMPT_REMOTE_MISSING"
  fi
}

function add_if {
    if $(echo "$1" | grep $2 &> /dev/null); then
        STATUS+=$3
    fi
}

function svn_status {
    local ROOT="$(svn info | sed -n 's/^Working Copy Root Path: //p')"
    local INDEX="$(svn status "$ROOT")"
    local STATUS=""

    add_if $INDEX '^A'               $ZSH_THEME_GIT_PROMPT_STAGED_ADDED
    add_if $INDEX '^M'               $ZSH_THEME_GIT_PROMPT_STAGED_MODIFIED
    add_if $INDEX '^R'               $ZSH_THEME_GIT_PROMPT_STAGED_RENAMED
    add_if $INDEX '^D'               $ZSH_THEME_GIT_PROMPT_STAGED_DELETED

    add_if $INDEX '^!'               $ZSH_THEME_GIT_PROMPT_DELETED
    add_if $INDEX '^?'               $ZSH_THEME_GIT_PROMPT_UNTRACKED

    [[ -n "$STATUS" ]] && STATUS+=" "
    STATUS+="%{$FG[011]%}$(svn_get_branch_name)"

    echo $STATUS
}

function git_status {
    local INDEX="$(git status --porcelain 2> /dev/null)"
    local STATUS=""
    # Staged
    add_if $INDEX '^A'               $ZSH_THEME_GIT_PROMPT_STAGED_ADDED
    add_if $INDEX '^M'               $ZSH_THEME_GIT_PROMPT_STAGED_MODIFIED
    add_if $INDEX '^R'               $ZSH_THEME_GIT_PROMPT_STAGED_RENAMED
    add_if $INDEX '^D  '             $ZSH_THEME_GIT_PROMPT_STAGED_DELETED
    # Non-staged
    add_if $INDEX '^\(.M\|AM\| T\) ' $ZSH_THEME_GIT_PROMPT_MODIFIED
    add_if $INDEX '^ D '             $ZSH_THEME_GIT_PROMPT_DELETED
    add_if $INDEX '^UU'              $ZSH_THEME_GIT_PROMPT_UNMERGED
    add_if $INDEX '^?? '             $ZSH_THEME_GIT_PROMPT_UNTRACKED

    local GIT_STATUS=""
    [[ -n "$STATUS" ]] && GIT_STATUS+="$STATUS "
    GIT_STATUS+="$(git_prompt_remote)"
    GIT_STATUS+="$(git_prompt_behind)"
    GIT_STATUS+="$(git_prompt_ahead)"
    GIT_STATUS+="%{$FG[011]%}$(current_branch)"

    echo $GIT_STATUS
}

function vcs_status {
    local STATUS
    if [[ -n "$(svn_get_branch_name)" ]]; then
        STATUS=$(svn_status)
    elif [[ -n "$(current_branch)" ]]; then
        STATUS=$(git_status)
    fi
    [[ -n "$STATUS" ]] && echo "%{$BG[019]%} $STATUS "
}

function render_top_bar {
    local ZERO='%([BSUbfksu]|([FB]|){*})'

    # Top right
    local TOP_RIGHT="$(vcs_status)"
    local RIGHT_WIDTH=${#${(S%%)TOP_RIGHT//$~ZERO/}}

    # Top left
    local PWD_MAX_LEN
    (( PWD_MAX_LEN = $COLUMNS - $RIGHT_WIDTH - 3 ))
    local PWD_PATH="%$PWD_MAX_LEN<...<${PWD/#$HOME/~}%<<"
    [[ "${PWD_PATH:h}" != "." ]] && local PREFIX="${PWD_PATH:h}/"
    local TOP_LEFT="%{$FG[008]%}$PREFIX%{$FG[004]%}${PWD_PATH:t}"
    local LEFT_WIDTH=${#${(S%%)TOP_LEFT//$~ZERO/}}

    # Middle (fill)
    local FILL="\${(l:(($COLUMNS - ($LEFT_WIDTH + $RIGHT_WIDTH + 2))):: :)}"

    # Whole bar
    TOP_BAR="%{$BG[018]%} "
    TOP_BAR+="$TOP_LEFT%{$FX[reset]%}"
    TOP_BAR+="%{$BG[018]%}$FILL"
    TOP_BAR+="$TOP_RIGHT%{$FX[reset]%}"
    TOP_BAR+="%{$BG[018]%} %{$FX[reset]%}"
}

setprompt () {
    ZSH_THEME_GIT_PROMPT_AHEAD='%{$FG[004]%}↑'
    ZSH_THEME_GIT_PROMPT_BEHIND='%{$FG[001]%}↓'
    ZSH_THEME_GIT_PROMPT_REMOTE_MISSING='%{$FG[015]%}*'

    # Staged
    ZSH_THEME_GIT_PROMPT_STAGED_ADDED='%{$FG[002]%}A'
    ZSH_THEME_GIT_PROMPT_STAGED_MODIFIED='%{$FG[002]%}M'
    ZSH_THEME_GIT_PROMPT_STAGED_RENAMED='%{$FG[002]%}R'
    ZSH_THEME_GIT_PROMPT_STAGED_DELETED='%{$FG[002]%}D'

    # Not-staged
    ZSH_THEME_GIT_PROMPT_UNTRACKED='%{$FG[001]%}?'
    ZSH_THEME_GIT_PROMPT_MODIFIED='%{$FG[001]%}M'
    ZSH_THEME_GIT_PROMPT_DELETED='%{$FG[001]%}D'
    ZSH_THEME_GIT_PROMPT_UNMERGED='%{$FG[001]%}UU'

    PROMPT='${(e)TOP_BAR}
%{$FG[003]%}»%{$FX[reset]%} '

    # display exitcode on the right when >0
    return_code="%(?..%{$FG[001]%}⌗%?)"

    RPROMPT=' $return_code %{$FG[019]%}${LAST_EXEC_TIME}s%{$FX[reset]%}'
}

setopt prompt_subst

setprompt

autoload -U add-zsh-hook
add-zsh-hook precmd  render_top_bar
