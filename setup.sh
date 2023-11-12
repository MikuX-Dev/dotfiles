#!/env/bin/env bash

#######################################################################
#  This script is licensed under the GNU General Public License v3.0  #
#  Copyright (C) [2023] [MikuX-Dev]                                   #
#######################################################################


#TODO: copying all config files to their respective locations
#TODO: Install required pkgs via pacman & yay


# Setting up pacman first
# Enabling multilib and community repositories
# Check if multilib and community repositories are enabled
echo "Enabling multilib and community repositories"
if grep -E '^\[multilib\]|^\[community\]' /etc/pacman.conf; then
    # Repositories are already enabled, remove any commented-out lines
    sed -i '/^\[multilib\]/,/^\[/ s/^#//' /etc/pacman.conf
    sed -i '/^\[community\]/,/^\[/ s/^#//' /etc/pacman.conf
else
    # Repositories are not enabled, add them
    echo -e "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n\n[community]\nInclude = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
fi
sleep 3s

# Enabling misc options in pacman.conf
echo "Enabling misc options in pacman.conf"
# Enable colors in pacman.conf
echo "Enabling pacman colors"
sed -i 's/^#Color/Color/' /etc/pacman.conf
sleep 3s
# Adding ILoveCandy to pacman.conf
echo "Adding ILoveCandy to pacman.conf"
sed -i '/^# Misc options/a #UseSyslog\nColor\n#NoProgressBar\n# We cannot check disk space from within a chroot environment\n#CheckSpace\n#VerbosePkgLists\nParallelDownloads = 5\nILoveCandy' /etc/pacman.conf
sleep 3s

# Setting fastests mirror
echo "Setting fastests mirror"
printf "\n"
# Backup mirrorlist
echo "Backingup mirrorlists"
printf "\n"
cp -r /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
# Archlinux mirrorlists
echo "Archlinux-mirrorlist setup"
printf "\n"
reflector --verbose -l 22 -f 22 -p https --download-timeout 55 --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syy
sleep 3s

# Installing pkgs via pacman
echo "Installing pkgs via pacman"
pacman -S --noconfirm ack acpi alacritty alsa-utils apache arch-install-scripts arch-wiki-docs archiso atftp automake b43-fwcutter base base-devel bash-completion bc bind bind-tools bridge-utils brltty broadcom-wl bzip3 cargo ccache cifs-utils clang clonezilla cmake conky cronie ctags curl chromium darkhttpd devtools dhclient dhcpcd dialog diffutils dmraid dnscrypt-proxy dnsmasq dnsutils dosfstools edk2-shell efibootmgr exfat-utils expac f2fs-tools feh fwbuilder gammu gawk gcc gcc-libs gdb git git-lfs gnome-keyring gnu-netcat gnupg go gpart gparted gpm gptfdisk grub grub-customizer gvfs gvfs gvfs-mtp gzip haveged hdparm helix htop inotify-tools intel-ucode ipw2100-fw ipw2200-fw ipython irqbalance irssi iw iwd kvantum lftp libx11 libxext lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings lightdm-webkit2-greeter lightdm-webkit2-theme-glorious llvm lsof lua make menumaker mercurial mesa mlocate modemmanager moreutils mpv mtools multilib-devel nano nbd ncdu ndisc6 neovim network-manager-applet networkmanager networkmanager-openconnect networkmanager-openvpn networkmanager-pptp networkmanager-vpnc nfs-utils nilfs-utils npm ntfs-3g ntp nvme-cli obsidian openconnect openssh openvpn os-prober p7zip pacman-contrib partclone parted partimage pavucontrol perl pkgfile plocate plymouth ppp pptpclient profile-sync-daemon qemu-emulators-full qemu-system-x86-firmware qemu-tools qt5-tools qt5ct reiserfsprogs rfkill rofi rp-pppoe rsync rtorrent ruby rustup screen scrot sed smartmontools socat strace tar tmux tor udisks2 unace unrar unzip upower usb_modeswitch usbutils vim vpnc wget wireless_tools wpa_supplicant wvdial xarchiver xarchiver xdg-desktop-portal-gtk xdg-user-dirs-gtk xfce4 xfce4-goodies xl2tpd xz zip zsh zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting zstd
sleep 3s

# Installing pkgs via yay-bin
# Installing yay-bin first
echo "Installing pkgs via yay"
# Check if yay is installed if not then install yay-bin
echo "Checking if yay is installed if not installing yay-bin"
if ! command -v yay &> /dev/null; then
    echo "yay is not installed. Installing yay-bin from AUR..."
    # Install yay-bin from AUR
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin || exit
    makepkg -si --noconfirm
    cd ..
    rm -rf yay-bin
else
    echo "yay is already installed."
fi
sleep 3s

# Installing pkgs via yay
echo "Installing pkgs via yay"
yay -S --noconfirm appmenu-gtk-module-git appmenu-qt4 brave-bin libdbusmenu-glib libdbusmenu-gtk2 libdbusmenu-gtk3 mkinitcpio-firmware mkinitcpio-numlock mugshot visual-studio-code-bin
sleep 3s
