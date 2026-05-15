#!/bin/bash

collect_info() {
    echo "HOSTNAME = $(hostname)"
    echo "USER = $USER"
    echo "OS = $(. /etc/os-release && echo "$NAME $VERSION")"
    echo "DATE = $(date "+%Y-yil %d-%b %H:%M:%S")"
    echo "TIMEZONE = $(timedatectl | grep 'Time zone' | awk '{print $3, $4, $5}')"
    echo "UPTIME = $(uptime -p)"
    echo "UPTIME_SEC = $(cat /proc/uptime | awk '{print $1}')"
    echo "IP = $(hostname -I)"
    echo "MASK = $(ifconfig | grep 'inet' | awk 'NR==1 {print $4}')"
    echo "GATEWAY = $(ip r | awk 'NR==1 {print $3}')"
    echo "RAM_TOTAL= $(free -m | awk '/Mem:/ {printf "%.3f GB", $2/1024}')"
    echo "RAM_USED = $(free -m | awk '/Mem:/ {printf "%.3f GB", $3/1024}')"
    echo "RAM_FREE = $(free -m | awk '/Mem:/ {printf "%.3f GB", $4/1024}')"
    echo "SPACE_ROOT = $(df / | awk 'NR==2 {printf "%.2f MB", $2/1024}')"
    echo "SPACE_ROOT_USED = $(df / | awk 'NR==2 {printf "%.2f MB", $3/1024}')"
    echo "SPACE_ROOT_FREE = $(df / | awk 'NR==2 {printf "%.2f MB", $4/1024}')"
}
