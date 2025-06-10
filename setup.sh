#! /bin/bash
set -e

Color_Off='\033[0m'       # Text Reset
Blue='\033[0;34m'
Yellow='\033[0;33m'       # Yellow
BBlue='\033[1;34m'        # Blue
BYellow='\033[1;33m'      # Yellow
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green

function command_exists() {
    command -v "$1" >/dev/null 2>&1
}

PackageMan=[[command_exists apt]] && echo "apt" || echo "pacman"
InstallCmd=[[command_exists apt]] && echo "apt install" || echo "pacman -S"

function omz_install() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo -e "${BGreen}Restart the script after OMZ has been installed.${Color_Off}"
}

function starship_install() {
    curl -sS https://starship.rs/install.sh | sh
}

function nvim_install() {
    sudo "$InstallCmd" neovim
}
function kitty_install() {
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin \
        installer=nightly
}

function confirm() {
    if read -q "CHOICE?$(echo -e "${Blue}Have you installed ${BBlue}$1${Blue}? ${Color_Off}(y/n)")"; then
        echo
        echo -e "Cool. Next!"
        echo
        return 0
    else
        echo
        install_or_exit $1 $2;
    fi
}
function confirm_exists() {
    if command_exists "$1"; then
        return 0
    else
        install_or_exit $1 $2;
    fi
}

function install_or_exit() {
    local MANUAL_INSTALL_ERR="${BRed}Please install $1 manually and try again.${Color_Off}"

    if [ -z "$2" ] 
    then
        echo -e "$MANUAL_INSTALL_ERR"
        exit 1
        return 1
    fi


    if read -q "INSTALL_CHOICE?$(echo -e "${Blue}Would you like to install ${BBlue}$1${Blue} now? ${Color_Off}(y/n)")"; then
        echo
        $2
        echo
        echo -e "${BGreen}$1 ${Green}has been installed!"
        echo
    else
        echo
        echo -e "$MANUAL_INSTALL_ERR"
        exit 1
        return 1
    fi

    return 0
}

function create_link() {
    echo "Linking $1 to $2"

    if test -e "$2"; 
    then
        echo -e "${Yellow}$2 exists. ${BYellow}Creating backup.${Color_Off}"
        mv $2 "$2.backup"
    fi

    ln -sf $1 $2
}

if [[ -n "$ZSH_VERSION" ]] 
then
    echo -e "${BGreen}ZSH is installed. Ready to continue!${Color_Off}"
    echo
else
    echo -e "${BRed}ZSH ${Red}isn't installed.${Color_Off} Installing..."
    sudo "$InstallCmd" zsh
    echo -e "Source this file from a ZSH-shell${Color_Off}"
    exit 0
fi

SOURCE=${(%):-%N}

while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )";
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done


DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

echo "Dotfiles dir: $DIR"

confirm 'NF_FiraCode'
confirm_exists "omz" omz_install
confirm_exists "Starship" starship_install
confirm_exists "kitty" kitty_install
confirm_exists "nvim" nvim_install

if test -e ~/.config; then
else
    echo "${Yellow}Creating ~/.config directory."
    mkdir ~/.config
fi

echo -e "${BBlue}Linking NVIM config${Color_Off}"
create_link "$DIR/nvim" ~/.config/nvim

echo "${BBlue}Linking Kitty config${Color_Off}"
create_link "$DIR/kitty" ~/.config/kitty

echo "${BBlue}Linking Starship config${Color_Off}"
create_link "$DIR/starship.toml" ~/.config/starship.toml

echo "${BBlue}Linking zshrc${Color_Off}"
create_link "$DIR/.zshrc" ~/.zshrc

echo "${BGreen}Linking complete!${Color_Off}"
