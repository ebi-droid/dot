# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi


# Vars

  #HISTFILE=~/.cache/zsh/history
  HISTFILE=~/.zsh_history
	SAVEHIST=10000
  BAT_THEME=ansi

	setopt hist_ignore_space
	setopt extended_history

#source <(gopass completion bash)

if [ -d "$HOME/.bin" ] ;
	  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
	  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/balena-cli" ] ;
	  then PATH="$HOME/balena-cli:$PATH"
fi

if [ -d "$HOME/.bin" ] ;
	  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.scripts" ] ;
	  then PATH="$HOME/.scripts:$PATH"
fi

autoload -Uz compinit
compinit

#https://github.com/Aloxaf/fzf-tab#oh-my-zsh
#NOTE: fzf-tab needs to be loaded after compinit, but before
#plugins which will wrap widgets, such as zsh-autosuggestions
#or fast-syntax-highlighting!!

#fzf-tab
source ~/.config/zsh/fzf-tab/fzf-tab.plugin.zsh


#FZF
# Auto-completion fzf
[[ $- == *i* ]] && source "~/.config/zsh/fzf/shell/completion.zsh" 2> /dev/null
# Key bindings fzf
source ~/.config/zsh/fzf/shell/key-bindings.zsh

# https://www.youtube.com/watch?v=tB-AgxzBmH8
export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'
export FZF_PREVIEW_ADVANCED=true
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"

export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"

# Fast cd to catalogues
eval "$(zoxide init zsh)"
#Zoxie dir path remebering and jumping
source ~/.config/zsh/zoxide/zoxide_cd.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/.config/zsh/.p10k.zsh
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme

#Web-search
source ~/.config/zsh/web-search/web-search.plugin.zsh
#Sudo
source ~/.config/zsh/zsh-sudo/sudo.plugin.zsh
#Highlighting
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#Autosugestions
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# Notify
source ~/.config/zsh/zsh-auto-notify/auto-notify.plugin.zsh
#Aliases
source ~/.config/zsh/aliases.sh
#helm completion
source ~/.config/zsh/completions/_helm
#
