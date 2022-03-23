# show prompt as just current folder and $
PS1="\W \$ "

# open command
alias o='xdg-open'

# a macro to reach current years sideproject folder (by appending current yr to end of this cd command)
alias sp='cd ~/Documents/sideprojects/'$(date +'%Y')

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# for nvm to work
source /usr/share/nvm/init-nvm.sh
