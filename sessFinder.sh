#!/bin/bash

YELLOW='\033[1;93m'
GREEN='\033[0;92m'
RED='\033[0;91m'
GREY='\033[0;33m'
CYAN='\033[0;96m'
MAGENTA='\033[1;95m'
NC='\033[0m'

echo -e "${YELLOW}"
echo "                        _______           __         "
echo "   ________  __________/ ____(_)___  ____/ /__  _____"
echo "  / ___/ _ \/ ___/ ___/ /_  / / __ \/ __  / _ \/ ___/"
echo " (__  )  __(__  |__  ) __/ / / / / / /_/ /  __/ /    "
echo "/____/\___/____/____/_/   /_/_/ /_/\__,_/\___/_/     "
echo "                                                v1.0 "       
echo "                 Tool By H3LLKY4T                    "      
echo "-----------------------------------------------------"       
echo -e "${NC}"
echo -e " * Try to scan Alive domains for faster results \n "

show_help() {
cat << EOF
Usage: ${0##*/} [-h|--help] [-L FILE_PATH]

This script checks for session IDs in the headers of the specified URLs.

    -h|--help           display this help and exit
    -L FILE_PATH        specify the path to the file containing URLs to check
EOF
}

check_session_id() {
    input_url=$1
    if [[ "$input_url" =~ ^https?:// ]]; then
        url="$input_url"
    else
        url="https://${input_url}"
    fi
    cookies=$(curl -sI "$url" | grep -i "Set-Cookie")

    if echo "$cookies" | grep -qi 'PHPSESSID'; then
        session_id="[PHPSESSID]"
        session_color="${CYAN}" 
    elif echo "$cookies" | grep -qi 'ASP.NET_SessionId'; then
        session_id="[ASP.NET_SessionId]"
        session_color="${GREEN}"
    elif echo "$cookies" | grep -qi 'JSESSIONID'; then
        session_id="[JSESSIONID]"
        session_color="${MAGENTA}" 
    else
        session_id="NONE"
    fi

    if [ "$session_id" != "NONE" ]; then
        echo -ne "Checking: ${NC}$url ${YELLOW}\nsession ID:${NC} $session_color$session_id${NC} | ${NC}"
        httpOnly="${RED}FALSE${NC}"
        secure="${RED}FALSE${NC}"

        if echo "$cookies" | grep -qi "$session_id.*httpOnly"; then
            httpOnly="${GREEN}TRUE${NC}"
        fi
        if echo "$cookies" | grep -qi "$session_id.*secure"; then
            secure="${GREEN}TRUE${NC}"
        fi

        echo -e "HttpOnly: $httpOnly | Secure: $secure\n"
    fi
}

export -f check_session_id
export YELLOW GREEN RED GREY CYAN MAGENTA NC

FILE_PATH=""

while true; do
  case "$1" in
    -h|--help)
      show_help
      exit 0
      ;;
    -L)
      FILE_PATH="$2"
      shift 2
      ;;
    --)
      shift
      break
      ;;
    *)
      break
      ;;
  esac
done

if [ ! -f "$FILE_PATH" ]; then
    echo "File not found!"
    exit 1
fi

cat "$FILE_PATH" | parallel -j 50 check_session_id

