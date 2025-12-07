#! /bin/bash

if [ -z "$STN_HOME" ];then
    export STN_HOME=$(pwd)
    ./bin/stn-set-env
fi

cols=$(tput cols)

# Define color (you can change 36 to other ANSI color codes)
color='\033[1;32m'
nc='\033[0m' # No color
art='
░░░░░░░ ░░░░░░░░ ░░░    ░░ 
▒▒         ▒▒    ▒▒▒▒   ▒▒ 
▒▒▒▒▒▒▒    ▒▒    ▒▒ ▒▒  ▒▒ 
     ▓▓    ▓▓    ▓▓  ▓▓ ▓▓ 
███████    ██    ██   ████ 
'

# Set some screen-relative padding
while IFS= read -r line; do
  padding=$(( (cols - ${#line}) / 10 ))
      printf "%*s$(stn-echo-style "green" "%s${nc}")\n" "$padding" "" "$line"
done <<< "$art"

echo -e "${color}STN_HOME${nc}=${STN_HOME}"
echo -e "${color}STN_BIN${nc}=${STN_BIN}"
echo -e "${color}STN_CONFIG_DIR${nc}=${STN_CONFIG_DIR}"

echo -e "Looks good? (Y/n)"
read -n 1 answer
echo ""

if [ -z "$answer" ]; then
    answer="y"
fi
case $answer in
  y|Y ) echo "$(stn-echo-style "blue" "") Installing $(stn-echo-style "blue" "stn-dotfiles")...";;
  * ) exit;;
esac

stn-setup

echo "$(stn-echo-style "green" "󰄳") Done!"
echo ""
echo "$(stn-echo-style "green" "Next steps:")"
echo "     ⏼ Reboot"
echo "     󰍹 Check out $(stn-echo-style "blue" "~/.config/hypr/hyprland/monitors.conf")"
echo "      Check out $(stn-echo-style "blue" "~/.config/hypr/hyprland/workspaces.conf")"


