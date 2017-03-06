#
#	~/.zshrc
#

unlimit stacksize

## Colors
autoload -U colors
colors

### shell variables ###
setopt	ALWAYS_LAST_PROMPT
setopt	APPEND_HISTORY
setopt	AUTO_CD
setopt	AUTOLIST
setopt	AUTOMENU
setopt	AUTO_NAME_DIRS
setopt	AUTO_PARAM_KEYS
setopt	AUTO_PARAM_SLASH
setopt	AUTO_PUSHD
setopt	AUTO_RESUME
setopt	CDABLE_VARS
setopt	CORRECT
#setopt	CORRECT_ALL
setopt	EXTENDED_GLOB
setopt	EXTENDED_HISTORY
setopt	HIST_IGNORE_DUPS
setopt	HIST_IGNORE_ALL_DUPS
setopt	HIST_IGNORE_SPACE
setopt	HIST_NO_STORE
setopt	HIST_REDUCE_BLANKS
setopt	IGNORE_EOF
setopt	INTERACTIVE_COMMENTS
setopt	LIST_TYPES
setopt	LIST_PACKED
setopt	MAGIC_EQUAL_SUBST
setopt	NO_CLOBBER
setopt	NO_HUP
setopt	NO_LIST_BEEP
setopt	NUMERIC_GLOB_SORT
setopt	PRINT_EIGHT_BIT
setopt	PUSHD_IGNORE_DUPS
setopt	PUSHD_SILENT
setopt	SHARE_HISTORY
unsetopt PROMPT_CR
#setopt	PUSHD_TO_HOME

FIGNORE=.aux:.toc:.h~:.c~:.tex~:.sty~:.ps~

### prompt ###
PROMPT='%n[%m] '
RPROMPT="%B[%{${fg[green]}%} %~ %{${fg[default]}%}]%b"
SPROMPT="correct>%r (y/n/e/a)? "

### history ###
HISTSIZE=20480
SAVEHIST=20480
HISTFILE=~/.zhistory

### STTY ###
/bin/stty erase '^H' kill '^U'

### autoload 
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
### key bindings ###
bindkey " "	magic-space
bindkey "^@"	set-mark-command
bindkey "^A"	beginning-of-line
bindkey "^B"	backward-char
bindkey "^D"	delete-char-or-list
bindkey "^E"	end-of-line
bindkey "^F"	forward-char
bindkey "^G"	end-of-buffer-or-history
bindkey "^K"	kill-line
bindkey "^O"	accept-line-and-down-history
#bindkey "^N"	history-beginning-search-forward
#bindkey "^P"	history-beginning-search-backward
##bindkey "^N"	down-line-or-search
##bindkey "^P"	up-line-or-search
bindkey "^P"	history-beginning-search-backward-end
bindkey "^N"	history-beginning-search-forward-end
bindkey "^[[A"	history-beginning-search-backward-end
bindkey "^[[A"	history-beginning-search-backward-end
bindkey "^[[B"	history-beginning-search-forward-end
[[ -n "${key[Up]}" ]] && bindkey "${key[Up]}"	history-beginning-search-backward-end
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}"	history-beginning-search-forward-end
bindkey "^R"	history-incremental-search-backward
bindkey "^T"	transpose-chars
bindkey "^W" 	backward-delete-word
bindkey "^[/" 	expand-cmd-path
bindkey "^/" undo
#bindkey -s '^[[A' '^X^X^X^P^@^E'

#### aliases ###
alias ls='ls -FC --color=auto'
alias l='ls'
alias s='ls'
alias la='ls -a'
alias lc='ls -s'
alias ll='ls -lh'
alias lla='ls -Al'
alias lld='ls -ld'
alias grep='grep --color=always --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'
alias ag="ag --color --color-path='0;35' --color-line-number='0;33' --color-match='1;32'"
alias	h='history'
alias	j='jobs -l'
alias	cp='nocorrect cp -i'
alias	mv='nocorrect mv -i'
alias	rm='rm -i'
alias	so='source'
alias	soz='source $HOME/.zshenv ; source $HOME/.zshrc '
alias	sl='ls'
alias	b='cd -'
alias bc='bc -l'
alias	x='exit'
alias	view='vim -R'

alias -g L='|less'
alias -g M='|more'
alias -g H='|head'
alias -g T='|tail'
alias -g G='|grep'
alias -g W='|wc'
alias -g V='|lv'

autoload -U compinit; compinit -u
# sudo
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
  /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

zstyle ':completion:complete:tar:*' tag-order \
  'globbed-files directories'  all-files

zstyle ':completion:*::::default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:cd:*' tag-order local-directories path-directories

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z} r:|[-_.]=**' '+m:{A-Z}={a-z}'

# auto correct command line
zstyle ':completion:*' completer _complete _approximate _match _prefix _ignored
