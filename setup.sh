#!/env/bin/env bash

#######################################################################
#  This script is licensed under the GNU General Public License v3.0  #
#  Copyright (C) [2023] [MikuX-Dev]                                   #
#######################################################################

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
    echo -e "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n\n[community]\nInclude = /etc/pacman.d/mirrorlist" >>/etc/pacman.conf
fi
sleep 3s

# Enabling misc options in pacman.conf
echo "Enabling misc options in pacman.conf"
# Enable colors in pacman.conf
echo "Enabling pacman colors"
sed -i 's/^#Color/Color/g' /etc/pacman.conf
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
pacman -S --noconfirm ack acpi alacritty alsa-utils apache arch-install-scripts arch-wiki-docs archiso atftp autoconf automake b43-fwcutter base base-devel bash-completion bc bind bind-tools bison blueman bluez bluez-utils bridge-utils brltty broadcom-wl bzip2 bzip3 cargo ccache cifs-utils clang clonezilla cmake conky cronie ctags cups cups-filters cups-pdf curl darkhttpd devtools dhclient dhcpcd dialog diffutils dmraid dnscrypt-proxy dnsmasq dnsutils dosfstools edk2-shell efibootmgr exfat-utils expac f2fs-tools fakeroot feh ffmpeg ffmpegthumbnailer flex foomatic-db foomatic-db-engine fwbuilder gammu gawk gcc gcc-libs gdb ghostscript git git-lfs gnome-keyring gnu-netcat gnupg go gpart gparted gpm gptfdisk grub grub-customizer gsfonts gst-libav gst-plugin-pipewire gst-plugins-bad gst-plugins-good gst-plugins-ugly gstreamer gutenprint gvfs gvfs-afc gvfs-google gvfs-gphoto2 gvfs-mtp gvfs-smb gzip haveged hdparm helix highlight htop inotify-tools intel-ucode ipw2100-fw ipw2200-fw ipython irqbalance irssi iw iwd jasper kvantum lftp libavif libde265 libdv libheif libmpeg2 libtheora libvpx libwebp libx11 libxext lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings lightdm-webkit2-greeter lightdm-webkit2-theme-glorious llvm lrzip lsb-release lsof lua lz4 lzip lzop make menumaker mercurial mesa mlocate modemmanager moreutils mpv mtools multilib-devel nano nbd ncdu ndisc6 neovim nethogs network-manager-applet network-manager-sstp networkmanager networkmanager-openconnect networkmanager-openvpn networkmanager-pptp networkmanager-strongswan networkmanager-vpnc nfs-utils nilfs-utils nm-connection-editor npm ntfs-3g ntp nvme-cli openconnect openssh openvpn os-prober p7zip pacman-contrib partclone parted partimage patch pavucontrol perl pipewire pipewire-alsa picom pipewire-jack pipewire-pulse pkgconf pkgfile plocate plymouth portmaster-stub-bin powertop ppp pptpclient profile-sync-daemon pulsemixer qemu-emulators-full qemu-system-x86-firmware qemu-tools qt5-tools qt5ct ranger reiserfsprogs rfkill rofi rofi-emoji rp-pppoe rsync rtorrent ruby rustup schroedinger screen scrot sed smartmontools socat strace tar timeshift tmux tor trash-cli tumbler udisks2 ueberzug unace unarchiver unrar unzip upower usb_modeswitch usbutils vim vpnc webkit2gtk wget wireless_tools wireplumber wpa_supplicant wvdial x264 x265 xarchiver xclip xcompmgr xdg-desktop-portal-gtk xdg-user-dirs xdg-user-dirs-gtk xfce4 xfce4-goodies xl2tpd xorg xorg-server xvidcore xz zip zsh zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting zstd ufw dolphin kdeconnect xfce4-power-manager xfce4-docklike-plugin
sleep 3s

# Installing pkgs via yay-bin
# Installing yay-bin first
echo "Installing pkgs via yay"
# Check if yay is installed if not then install yay-bin
echo "Checking if yay is installed if not installing yay-bin"
if ! command -v yay &>/dev/null; then
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
yay -S --noconfirm appmenu-gtk-module-git appmenu-qt4 brave-bin downgrade gtk3-nocsd-git libdbusmenu-glib libdbusmenu-gtk2 libdbusmenu-gtk3 librewolf-bin mkinitcpio-firmware mkinitcpio-numlock mugshot visual-studio-code-bin zsh-theme-powerlevel10k-git obsidian-bin
sleep 3s

# copying files
echo "Copying files"
cp -r config/* ~/.config/
cp -r shell/bash/* ~/
cp -r shell/zsh/* ~/

mkdir -p ~/bin/
cp -r shell/p-script/* ~/bin/

cp -r themes/fonts/* /usr/share/fonts/
cp -r themes/grub/themes/* /boot/grub/themes/
cp -r themes/icons/* /usr/share/icons/
cp -r themes/plymouth/* /etc/plymouth/
cp -r themes/themes/* /usr/share/themes/

cp -r user/local/share/* ~/.local/share/

cp -r wallpaper/* /usr/share/wallpaper/
sleep 3s

# Setup rofi
echo "Setting up rofi"
git clone https://github.com/adi1090x/rofi.git
cd rofi || exit
chmod +x setup.sh
./setup.sh

printf "\n"
echo "Setup is Done!"
printf "\n"
echo "Check https://github.com/adi1090x/rofi.git for more information"
