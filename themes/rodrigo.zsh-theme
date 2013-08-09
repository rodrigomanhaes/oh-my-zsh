# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background and the font Inconsolata.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
#
# http://ysmood.org/wp/2013/03/my-ys-terminal-theme/
# Mar 2013 ys

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}on%{$reset_color%} git:%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}o"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}!"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[yellow]%}↑"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[yellow]%}↓"
ZSH_THEME_GIT_PROMPT_DIVERGED="%{$fg[red]%}↕"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}?"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# ruby info
local ruby_info=''
#if which rbenv &> /dev/null; then
  ruby_info=' %{$fg[white]%}using %{$reset_color%}ruby: %{$fg[red]%}$(rbenv version | sed -e "s/ (set.*$//")%{$reset_color%}'
#fi


# Prompt format: \n # USER at MACHINE in DIRECTORY on git:BRANCH STATE [TIME] \n $
PROMPT="
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$fg[cyan]%}%n \
%{$fg[white]%}at \
%{$fg[green]%}$(box_name) \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${ruby_info}\
${git_info} \
%{$fg[white]%}[%*]
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"
