#!/usr/bin/env bash

parse_git_branch() {
    git branch 2>/dev/null | grep '*' | sed 's/* //'
}

parse_git_dirty() {
    if [[ -n "$(git status --porcelain)" ]]; then
        echo "*"
    fi
}

update_prompt() {
    local exit_status=$?

    local C_RESET='\[\e[0m\]'
    local C_MAUVE='\[\e[38;2;203;166;247m\]' # For user@host
    local C_BLUE='\[\e[38;2;137;180;250m\]'  # For directory
    local C_YELLOW='\[\e[38;2;249;226;175m\]' # For git branch
    local C_GREEN='\[\e[38;2;166;227;161m\]'  # For success ($)
    local C_RED='\[\e[38;2;243;139;168m\]'    # For error ($)
    local C_SUBTEXT='\[\e[38;2;166;173;200m\]' # For punctuation like [], ()

    local prompt_info="${C_SUBTEXT}[${C_BLUE}\\w${C_SUBTEXT}]"

    local branch_name=$(parse_git_branch)
    local prompt_git=""
    if [[ -n "$branch_name" ]]; then
        # Get the dirty symbol (*) if there are changes
        local git_dirty_symbol=$(parse_git_dirty)
        prompt_git=" ${C_SUBTEXT}(${C_YELLOW}${branch_name}${C_RED}${git_dirty_symbol}${C_SUBTEXT})"
    fi

    local prompt_symbol=""
    if [ $exit_status -eq 0 ]; then
        prompt_symbol="${C_GREEN}\$ " # Green for success
    else
        prompt_symbol="${C_RED}\$ "   # Red for error
    fi

    PS1="${prompt_info}${prompt_git} ${prompt_symbol}${C_RESET}"
}

PROMPT_COMMAND=update_prompt
