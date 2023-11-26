#!/env/bin/env bash

#######################################################################
#  This script is licensed under the GNU General Public License v3.0  #
#  Copyright (C) [2023] [MikuX-Dev]                                   #
#######################################################################

echo "THIS SCRIPT IS NOT READY TO USE"
exit

# # Setting up pacman first
# # Enabling multilib and community repositories
# # Check if multilib and community repositories are enabled
# echo "Enabling multilib and community repositories"
# if grep -E '^\[multilib\]|^\[community\]' /etc/pacman.conf; then
#     # Repositories are already enabled, remove any commented-out lines
#     sed -i '/^\[multilib\]/,/^\[/ s/^#//' /etc/pacman.conf
#     sed -i '/^\[community\]/,/^\[/ s/^#//' /etc/pacman.conf
# else
#     # Repositories are not enabled, add them
#     echo -e "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n\n[community]\nInclude = /etc/pacman.d/mirrorlist" >>/etc/pacman.conf
# fi
# sleep 3s

# # Enabling misc options in pacman.conf
# echo "Enabling misc options in pacman.conf"
# # Enable colors in pacman.conf
# echo "Enabling pacman colors"
# sed -i 's/^#Color/Color/g' /etc/pacman.conf
# sleep 3s
# # Adding ILoveCandy to pacman.conf
# echo "Adding ILoveCandy to pacman.conf"
# sudo sed -i 's/#ParallelDownloads = 5/#ParallelDownloads = 5\nILoveCandy/' /etc/pacman.conf
# sleep 3s

# # Setting fastests mirror
# echo "Setting fastests mirror"
# printf "\n"
# # Backup mirrorlist
# echo "Backingup mirrorlists"
# printf "\n"
# cp -r /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
# # Archlinux mirrorlists
# echo "Archlinux-mirrorlist setup"
# printf "\n"
# reflector --verbose -l 22 -f 22 -p https --download-timeout 55 --sort rate --save /etc/pacman.d/mirrorlist
# pacman -Syy
# sleep 3s

# # Installing pkgs via yay-bin
# # Installing yay-bin first
# echo "Installing pkgs via yay"
# # Check if yay is installed if not then install yay-bin
# echo "Checking if yay is installed if not installing yay-bin"
# if ! command -v yay &>/dev/null; then
#     echo "yay is not installed. Installing yay-bin from AUR..."
#     # Install yay-bin from AUR
#     git clone https://aur.archlinux.org/yay-bin.git ~/aur/yay-bin
#     cd ~/aur/yay-bin || exit
#     makepkg -si --noconfirm
#     cd - || exit
# else
#     echo "yay is already installed."
# fi
# sleep 3s

# # Install pkgs from yay-bin
# echo "Installing pkgs from yay-bin"

# packages="airdroid-nativefier android-sdk-platform-tools appmenu-gtk-module-git appmenu-qt4 bluez-firmware brave-bin caffeine-ng dolphin-megasync-bin downgrade eww-x11 fancontrol-gui firebuild gtk3-nocsd-git libdbusmenu-glib libdbusmenu-gtk2 libdbusmenu-gtk3 mkinitcpio-firmware mkinitcpio-numlock mugshot nbfc obsidian-bin ocs-url portmaster-stub-bin repoctl rtl8821ce-dkms-git rtw89-dkms-git stacer-bin tela-icon-theme thunar-extended thunar-megasync-bin thunar-secure-delete thunar-shares-plugin thunar-vcs-plugin universal-android-debloater-bin vala-panel-appmenu-common-git vala-panel-appmenu-registrar-git vala-panel-appmenu-xfce-git visual-studio-code-bin xfce4-docklike-plugin xfce4-panel-profiles zsh-theme-powerlevel10k-git yay-bin"

# for package in $packages; do
#     echo "Installing $package"
#     git clone https://aur.archlinux.org/"$package"
#     cd "$package" || exit
#     makepkg -si --skippgpcheck --noconfirm --needed
#     cd .. || exit
#     rm -rf "$package"
# done
# sleep 3s

# # dotfile git URL
# echo "Setting up Personal dotfiles"
# git clone https://github.com/MikuX-Dev/dotfiles.git

# # copying files
# echo "Copying files"
# cp -r config/* ~/.config/
# cp -r shell/bash/* ~/
# cp -r shell/zsh/* ~/

# mkdir -p ~/bin/
# cp -r shell/p-script/* ~/bin/

# cp -r themes/fonts/* /usr/share/fonts/
# cp -r themes/grub/themes/* /boot/grub/themes/
# cp -r themes/icons/* /usr/share/icons/
# cp -r themes/plymouth/* /etc/plymouth/
# cp -r themes/themes/* /usr/share/themes/

# cp -r user/local/share/* ~/.local/share/

# cp -r wallpaper/* /usr/share/wallpaper/
# sleep 3s

# # Setup rofi
# echo "Setting up rofi"
# git clone https://github.com/adi1090x/rofi.git
# cd rofi || exit
# chmod +x setup.sh
# ./setup.sh

# printf "\n"
# echo "Setup is Done!"
# printf "\n"
# echo "Check https://github.com/adi1090x/rofi.git for more information"
