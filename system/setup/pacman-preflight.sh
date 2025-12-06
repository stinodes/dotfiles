
  # Configure pacman
  sudo cp -f ~/.config/stn/system/pacman/pacman.conf /etc/pacman.conf
  sudo cp -f ~/.config/stn/system/pacman/mirrorlist-stable /etc/pacman.d/mirrorlist

  sudo pacman-key --recv-keys 40DFB630FF42BCFFB047046CF0134EE680CAC571 --keyserver keys.openpgp.org
  sudo pacman-key --lsign-key 40DFB630FF42BCFFB047046CF0134EE680CAC571

  sudo pacman -Sy
