# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# -------------------- ls aliases --------------------

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

alias la='ls -la'
alias l='ls -la'
#alias ls='ls -h --color --group-directories-first'
alias lsa='ls -A'           # affiche les fichiers cachés
alias ll='ls -lh'           # affiche en mode liste détail
alias lla='ls -Al'          # affiche en mode liste détail + fichiers cachés
alias lx='ls -lXB'          # tri par extension
alias lk='ls -lSr'          # tri par taille, le plus lourd à la fin
alias lc='ls -ltcr'         # tri par date de modification, la pus récente à la fin
alias lu='ls -ltur'         # tri par date d’accès, la pus récente à la fin
alias lt='ls -ltr'          # tri par date, la pus récente à la fin
alias lm='ls -al | more'    # Pipe a travers 'more'
alias lr='ls -lR'           # ls récurssif
alias tree='tree -Csu'      # affiche sous forme d'arborescence, nécessite le paquet "tree"

# -------------------- files related aliases --------------------

alias arbre='tree -ugsapD'
alias trouver="find . -type f -print0 | xargs -0 grep " # usage : trouver 'exec(' 
alias chercher="echo \"find . -name '*' -exec grep -Hn '/MaChaine/' {} \;\""
alias lastmodified='find -type f -print0 | xargs -r0 stat -c %y\ %n | sort'
alias realtimemodifiedfiles="watch -d -n 2 'df; ls -FlAt;'"
alias du='du -kh'
alias taille='du -chs'
alias combien='ls -l | grep -v ^l | wc -l'
alias chch='sudo chmod 775 * -R && sudo chown $USER:www-data * -R'

# -------------------- archiver aliases -------------------

alias untar="tar xvf"
alias ungz="gunzip"
alias unzip2="bzip2 -d"
alias untargz="tar zxvf"
alias untarbz1="tar jxvf"

# -------------------- cleaner aliases --------------------

alias menage='find . -name "*~" -exec rm {} \;'
alias menagesvn='find . -name ".svn" -exec rm -rf {} \;'
alias menagegit='find . -name ".git" -exec rm -rf {} \;'
alias menagemac='find . -name ".DS_Store" -exec rm -rf {} \;'

# -------------------- dotfiles vim / bash fanatic aliases --------------------

alias svim="sudo vim"
alias c='clear'
alias vimvim="vim ~/.vimrc"
alias vimbashrc="vim ~/.bashrc"
alias vimalias="vim ~/.bash_aliases"
alias rebashrc=". ~/.bashrc"
alias realias=". ~/.bash_aliases"

# -------------------- apt-get related aliases --------------------

alias upup='sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoremove && sudo apt-get autoclean'
alias upupg='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get autoremove && sudo apt-get autoclean'
alias sagi='sudo apt-get install'
alias sacs='sudo apt-cache search'
alias ppa='sudo add-apt-repository'
alias autoremove='sudo apt-get autoremove && sudo apt-get autoclean'
# cf. aussi : sudo dpkg -P `dpkg -l | grep "^rc" | tr -s ' ' | cut -d ' ' -f 2`
alias purge='sudo apt-get remove --purge `deborphan`'
alias purgeall='sudo apt-get --purge remove `deborphan -n --guess-all`'
alias menageup='sudo apt-get clean && sudo apt-get autoclean && sudo apt-get autoremove'

# -------------------- GIT / SVN related aliases --------------------

alias git2cl='git log --graph --pretty=medium --color=never > CHANGELOG'
alias gitlog='git log --all --color --decorate --graph --oneline'
alias gitinfo='. /$HOME/Bin/sh/gitinfo.sh'
alias gitignore='cat .gitignore'
alias gs='git status'
alias gcm='git ci -m'
alias gcam='git ci -am'
alias gap='git add -p'
alias gpo='git push origin '
alias gs='git status'
alias gpom='git push origin master'
alias gpod='git push origin dev'
alias svndifff="svn diff | view -"
alias svnlogg="svn log -v -r{`date '+%Y-%m-01'`}:{`date '+%Y-%m-31'`} | colordiff"
alias gitmyzsh="antigen theme arialdomartini/oh-my-git-themes oppa-lana-style"

# -------------------- server related aliases --------------------

alias ssarl="sudo service apache2 reload"
alias ssars="sudo service apache2 restart"
alias ssms="sudo service mongod start"
alias pim_dump="mysqldump --extended-insert=FALSE -u akeneo_pim -pakeneo_pim akeneo_pim > dump.sql"

# add alias to get latest version of mongo cheatsheet
 alias mongocheat='curl -s http://cheat.errtheblog.com/s/mongo | groovy -e "@Grab(group=/net.sourceforge.nekohtml/, module=/nekohtml/, version=/1.9.14/)import org.cyberneko.html.parsers.SAXParser;println new XmlSlurper(new SAXParser()).parseText(System.in.text).depthFirst().find{ it.@class == /sheet/}.text()"'

# -------------------- other various unclassfied aliases -------------------

alias semaine='date +%V'
alias ifif='sudo ifdown wlan0 && sudo ifup wlan0'
alias screencast='ffmpeg -f x11grab -r 25 -s wxga -i :0.0 /tmp/outputFile.mpg'
alias sshlist=". ~/localBin/sshlist.sh"
alias mybackup="cd /opt/backup/manual/ && php backup.php && cd -"
alias jsstyle="seed ~/Bin/js/jslint.js"
alias apache2routes='apachectl -S'
alias googleBackup='/opt/backup/googledocs/gdatacopier-2.1.2/gcp.py -o -u rguilloux@toog.fr:/all ~/Documents/GoogleDocs/'
alias whereisraspberrypi="sudo nmap -sV --open 192.168.1.0/25 -p22"
alias allIps='for ip in $(seq 1 254); do ping -c 1 192.168.1.$ip>/dev/null; [ $? -eq 0 ] && echo "192.168.1.$ip UP" || : ; done'
# Add an "alert" alias for long running commands.  Use like so:
# #   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias wtf='tail -f /var/log/{dmesg,messages,*{,/*}{log,err}}'

if [ -d "Workspace/Apps" ] ; then
    alias apps='cd ~/Workspace/Apps && ls -la'
fi
if [ -d "Workspace" ] ; then
    alias work='cd ~/Workspace && ls -la'
fi

if [ -d "Work" ] ; then
    alias work='cd ~/Work && ls -la'
fi
# -------------------- PHP/Sf1/Sf2/Behat related aliases --------------------

alias bbc='php -dmemory_limit=-1 bin/console'
alias bbccw='php -dmemory_limit=-1 bin/console cache:warmup -e=prod'
alias sfsetset="sudo setfacl -R -m u:www-data:rwX -m u:`whoami`:rwX app/cache app/logs && sudo setfacl -dR -m u:www-data:rwx -m u:`whoami`:rwx app/cache app/logs"
alias phpstats=". ~/Bin/sh/phpstats.sh"
alias getcomposer='curl -s http://getcomposer.org/installer | php'
alias getbehat='wget https://github.com/downloads/Behat/Behat/behat.phar'
#alias composer="hhvm -v ResourceLimit.SocketDefaultTimeout=30 -v Http.SlowQueryThreshold=30000 ~/bin/composer"

# -------------------- network-related aliases -------------------

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Enhanced WHOIS lookups
# alias whois="whois -h whois-servers.net"
# View HTTP traffic
alias sniff="sudo ngrep -d 'eth1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en3 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias httpsniff="sudo tcpdump -A -s0 -ien3 port 80"
alias httpsniff2="sudo tcpdump -A -s0 -ien0 port 80"

# -------------------- Docker-related aliases -------------------

alias dockerboot='$(boot2docker shellinit 2> /dev/null)'
alias dl='docker ps -l -q'

# -------------------- Personal aliases -------------------
alias nw="/Applications/node-webkit.app/Contents/MacOS/node-webkit"
alias dl="docker ps -l -q"
alias dcp="docker-compose"
alias pony="fortune literature science work | ponysay"
# http://chiefy.github.io/2015/02/24/up-and-running-w-boot2docker-fig-packer.html
alias dockerboot='boot2docker shellinit && export DOCKER_IP=$(boot2docker ip)'
alias peap='open -a /Applications/PhpStorm\ EAP.app'
alias p='open -a /Applications/PhpStorm.app'
alias s='open -a /Applications/Sublime\ Text.app'
alias lo='/Applications/LibreOffice.app/Contents/MacOS/soffice'
alias docker-rm='docker rm $(docker ps -a -q)'
alias composer-require='php -dmemory_limit=-1 /usr/local/bin/composer require --optimize-autoloader --prefer-dist'
alias composer-install='php -dmemory_limit=-1 /usr/local/bin/composer install --optimize-autoloader --prefer-dist'
alias composer-update='php -dmemory_limit=-1 /usr/local/bin/composer update --optimize-autoloader --prefer-dist'
google() { open -a "Google Chrome" "http://www.google.com/search?q=$1"; }
alias phpconsole='echo "Type pkill php to end process\n"; php -S localhost:1337 -t /Users/ronan/Workspace/TOOLS/php-console &; open "http://localhost:1337"'
alias pim-reset='rm -rf ./var/cache/* && rm -rf ./var/logs/* && bin/console p:f:g  && bin/console pim:install:db -e prod && bin/console pim:fixture-generator:import-all --env=prod'
alias pim-install='source ~/Bin/pim-install.sh'

#transfer() {
#    # write to output to tmpfile because of progress bar
#    tmpfile=$( mktemp -t transferXXX )
#    curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) >> $tmpfile;
#    cat $tmpfile;
#    rm -f $tmpfile;
#}
#alias transfer=transfer
