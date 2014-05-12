#! /bin/bash
#
# functions.sh
# Copyright (C) 2014 ronan <ronan@cider.local>
#
# Distributed under terms of the MIT license.
#

# usage : genpasswd 8
genpasswd() { pwgen -Bs $1 1 |pbcopy |pbpaste; echo “Has been copied to clipboard”
}

function getBatteryDischargingStatus() {
    bat=$(acpi --battery | awk '{ if ($3 == "Discharging,") print substr($4, 0, length($4))}');
    if [ "$bat" != "" ];
    then
        echo "(⚡$bat) ";
    fi
}


# Start a PHP server from a directory, optionally specifying the port
# (Requires PHP 5.4.0+.)
function phpserver() {
    local port="${1:-4000}"
    local ip=$(ipconfig getifaddr en1)
    sleep 1 && open "http://${ip}:${port}/" &
    php -S "${ip}:${port}"
}

# Syntax-highlight JSON strings or files
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
function json() {
    if [ -t 0 ]; then # argument
        python -mjson.tool <<< "$*" | pygmentize -l javascript
    else # pipe
        python -mjson.tool | pygmentize -l javascript
    fi
}

# Create a git.io short URL
function gitio() {
    if [ -z "${1}" -o -z "${2}" ]; then
        echo "Usage: \`gitio slug url\`"
        return 1
    fi
    curl -i http://git.io/ -F "url=${2}" -F "code=${1}"
}

# Create a data URL from a file
function dataurl() {
    local mimeType=$(file -b --mime-type "$1")
    if [[ $mimeType == text/* ]]; then
        mimeType="${mimeType};charset=utf-8"
    fi
    echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}
#source /home/vagrant/oh-my-git/prompt.sh

