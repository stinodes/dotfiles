mapfile -t packages < <(grep -v '^#' "$STN_SYSTEM_DIR/stn.packages" | grep -v '^$')
sudo pacman -S --noconfirm --needed "${packages[@]}"
