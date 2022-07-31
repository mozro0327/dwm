#!/bin/bash
###
 # @Description:
 # @Author: Cheuk-Wing Mok
 # @Github: https://github.com/mozro0327
 # @Date: 2022-02-10 21:54:53
 # @LastEditors: Cheuk-Wing Mok
 # @LastEditTime: 2022-02-10 23:33:07
 # @FilePath: /dwm/install.sh
###

DIR=`pwd`
PDIR="$HOME/.dwm"

install_dwm() {
	echo -e "\n    [*]make & install dwm..."
	make && sudo make install
}

install_dwm_scripts() {
	echo -e "\n    [*]install dwm scripts..."

  if [[ -d "$PDIR" ]]; then
    echo -e "\n    [*]moving dwm scripts files..."
    mv $PDIR $HOME"/dwm.old"
  fi
  if [[ ! -d "$PDIR" ]]; then
    echo -e "\n    [*]copying configuration..."
    cp -rf $DIR/scripts $PDIR
  fi
}

install_fonts() {
		echo -e "\n   [*] Installing font ..."
		paru -S ttf-sarasa-gothic otf-font-awesome ttf-material-design-icons-git --needed -y
}

install_wallpapers() {
    echo -e "\n   [*] Installing wallpapers ..."

    if [[ -d "$HOME/Pictures/Wallpapers" ]]; then
        cp -rf $DIR/pictures/* "$HOME/Pictures/Wallpapers"
    else
        mkdir -p "$HOME/Pictures/Wallpapers"
        cp -rf $DIR/pictures/* "$HOME/Pictures/Wallpapers"
    fi
}

main() {
		install_dwm
		install_dwm_scripts
		install_fonts
    install_wallpapers
}

main
