# Enter the path to your battery.py here
BAT_CHARGE="/PATH/TO/battery.py"

# Prompt outputs for git repos
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}⚡"
ZSH_THEME_GIT_PROMPT_CLEAN=""


# Add prompt sign to output
function prompt_char {
	# Paint prompt red if acting as root
	if [ $UID -eq 0 ]; then
		echo "%{$fg[red]%}#%{$reset_color%}"
	else
		echo '%'
	fi
}

# Battery charge
function battery_charge {
    echo `$BAT_CHARGE` 2>/dev/null
}

PROMPT=' %(?, ,%{$fg[red]%}exit: $?%{$reset_color%})
 %{$fg[green]%}%n%{$fg[red]%}@%{$fg[blue]%}%m %{$fg[red]%}in %{$fg_bold[yellow]%}[%~]:%{$reset_color%} $(git_prompt_info)
%$(prompt_char) '

RPROMPT='$(battery_charge)'
