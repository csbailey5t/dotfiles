# copy the working directory path
alias cpwd="pwd|tr -d '\n'|pbcopy"

# better ls
alias ll='ls -FGLAhp'

# common directories
alias projects="cd /Users/csb5t/projects"
alias mamp="cd /Users/csb5t/mamp"
alias ivanhoe="cd /Users/csb5t/mamp/wordpress/wp-content/themes/ivanhoe"

# brew
alias bup="brew update && brew upgrade"

# easy moving
alias ..="cd .."

# mysql fix for mamp and wordpress
alias fix_mysql="ln -s /Applications/MAMP/tmp/mysql/mysql.sock /tmp/mysql.sock"
