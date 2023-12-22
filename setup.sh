#!/env/bin/env bash

#######################################################################
#  This script is licensed under the GNU General Public License v3.0  #
#  Copyright (C) [2023] [MikuX-Dev]                                   #
#######################################################################

# echo "THIS SCRIPT IS NOT READY TO USE"
# exit

clear

# Color codes
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
# MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
RESET='\033[0m'

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  print_color "${RED}" "This script must be run as root. Please use sudo or log in as root and run the script again."
  exit 1
fi

DOT=""$HOME"/.dotfiles"
# SKEL="/etc/skel"
US="/usr/share"

# Function to print_color for input with default value
function print_color {
  local color="$1"
  local message="$2"
  echo -e "${color}${message}${RESET}"
}

# Function to prompt user for input with default value
function prompt {
  read -p "$(print_color "${YELLOW}" "$1 [$2]: ")" input
  echo "${input:-$2}"
}

# Setting up pacman first
# Enabling multilib and community repositories
# Check if multilib and community repositories are enabled
print_color "${CYAN}" "Enabling multilib and community repositories"
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
print_color "${CYAN}" "Enabling misc options in pacman.conf"
# Enable colors in pacman.conf
print_color "${CYAN}" "Enabling pacman colors"
sed -i 's/^#Color/Color/g' /etc/pacman.conf
sleep 3s
# Adding ILoveCandy to pacman.conf
print_color "${CYAN}" "Adding ILoveCandy to pacman.conf"
sudo sed -i 's/#ParallelDownloads = 5/#ParallelDownloads = 5\nILoveCandy/' /etc/pacman.conf
sleep 3s
clear

# Start
print_color "${BLUE}" "Setting up environment..."
sleep 3s
printf "\n"
print_color "${BLUE}" "Installation guide starts now..."
sleep 3s
clear

# install package
print_color "${CYAN}" "Installing needed packages..."
pacman -Syy reflector rsync curl archlinux-keyring --noconfirm
sleep 3s
clear

# Installing fastest mirrors
read -rp "$(print_color "${YELLOW}" "Do you want fastest mirrors? [Y/n] ")" fm
if [[ $fm =~ ^[Yy]$ ]]; then
  print_color "${CYAN}" "Installing fastest mirrorlists"
  printf "\n"
  # Backup mirrorlist
  print_color "${CYAN}" "Backingup mirrorlists"
  cp -r /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
  # Archlinux mirrorlists
  printf "\n"
  print_color "${CYAN}" "Backing up mirrorlists"
  reflector --verbose -l 22 -f 22 -p https --download-timeout 55 --sort rate --save /etc/pacman.d/mirrorlist
  pacman -Syy
else
  printf "\n"
  print_color "${CYAN}" "Skipping the fastert mirrorlist"
fi
sleep 3s
clear

# Determine processor type and install microcode
# Install pkgs and tools by PACMAN..
print_color "${CYAN}" "Installing PACMAN package..."
printf "\n"

determine_processor_type() {
  local proc_type
  proc_type=$(lscpu)
  if grep -qE "GenuineIntel" <<<"${proc_type}"; then
    print_color "${CYAN}" "Installing Intel microcode"
    package+=(intel-ucode)
  elif grep -qE "AuthenticAMD" <<<"${proc_type}"; then
    print_color "${CYAN}" "Installing AMD microcode"
    package+=(amd-ucode)
  fi
}

# Determine graphics card type and build package list
determine_graphics_card_type() {
  local gpu_type
  gpu_type=$(lspci)
  if grep -qE "NVIDIA|GeForce" <<<"${gpu_type}"; then
    print_color "${CYAN}" "Installing NVIDIA drivers..."
    package+=(nvidia nvidia-utils)
  elif lspci | grep -qE "Radeon|AMD"; then
    print_color "${CYAN}" "Installing AMD drivers..."
    package+=(xf86-video-amdgpu)
  elif grep -qE "Integrated Graphics Controller" <<<"${gpu_type}"; then
    print_color "${CYAN}" "Installing integrated Graphics Controller..."
    package+=(libva-intel-driver libvdpau-va-gl lib32-vulkan-intel vulkan-intel libva-intel-driver libva-utils libva-mesa-driver mesa lib32-mesa mesa-amber lib32-mesa-amber intel-media-driver)
  elif grep -qE "Intel Corporation UHD" <<<"${gpu_type}"; then
    print_color "${CYAN}" "Installing Intel UHD Graphics..."
    package+=(libva-intel-driver libvdpau-va-gl lib32-vulkan-intel vulkan-intel libva-intel-driver libva-utils libva-mesa-driver mesa lib32-mesa mesa-amber lib32-mesa-amber intel-media-driver)
  else
    print_color "${CYAN}" "Installing generic drivers..."
    package+=(virtualbox-host-modules-arch xf86-input-vmmouse open-vm-tools xf86-video-vmware virtualbox-guest-utils libvirt virt-manager)
  fi
}

package=("ack" "acpi" "adobe-source-sans-pro-fonts" "alacritty" "alsa-utils" "amd-ucode" "android-file-transfer" "apache" "arch-install-scripts" "arch-wiki-docs" "archinstall" "archiso" "atftp" "autoconf" "automake" "autorandr" "avahi" "awesome-terminal-fonts" "b43-fwcutter" "base" "base-devel" "bash" "bash-completion" "bc" "bind" "bind-tools" "bison" "blueman" "bluez" "bluez-libs" "bluez-plugins" "bluez-tools" "bluez-utils" "bolt" "boost" "boost-libs" "bridge-utils" "brightnessctl" "brltty" "broadcom-wl" "btrfs-progs" "bzip2" "bzip3" "cargo" "ccache" "cifs-utils" "clang" "clonezilla" "cloud-init" "cmake" "conky" "crda" "cronie" "cryptsetup" "ctags" "cups" "cups-filters" "cups-pdf" "curl" "darkhttpd" "ddrescue" "devtools" "dex" "dhclient" "dhcpcd" "dialog" "diffutils" "dmidecode" "dmraid" "dnscrypt-proxy" "dnsmasq" "dnsutils" "docker" "docker-buildx" "docker-compose" "docker-machine" "dolphin" "dolphin-plugins" "dosfstools" "e2fsprogs" "edk2-shell" "efibootmgr" "espeakup" "ethtool" "exa" "exfatprogs" "expac" "eza" "f2fs-tools" "fakeroot" "fatresize" "fd" "feh" "ffmpeg" "ffmpegthumbnailer" "flameshot" "flex" "foomatic-db" "foomatic-db-engine" "foot-terminfo" "fsarchiver" "fwbuilder" "gammu" "gawk" "gcc" "gcc-libs" "gdb" "ghostscript" "git" "git-lfs" "gnome-keyring" "gnu-netcat" "gnupg" "go" "gpart" "gparted" "gpm" "gptfdisk" "grub" "grub-customizer" "gsfonts" "gst-libav" "gst-plugins-bad" "gst-plugins-good" "gst-plugins-ugly" "gstreamer" "gtk-update-icon-cache" "gufw" "gutenprint" "gvfs" "gvfs-afc" "gvfs-google" "gvfs-gphoto2" "gvfs-mtp" "gvfs-smb" "gzip" "haveged" "hdparm" "helix" "highlight" "htop" "hyperv" "inotify-tools" "intel-ucode" "ipython" "irqbalance" "irssi" "iw" "iwd" "jasper" "jfsutils" "kdeconnectconnect" "kitty-terminfo" "kvantum" "less" "lftp" "libavif" "libde265" "libdv" "libfido2" "libheif" "libmpeg2" "libreoffice-fresh" "libtheora" "libusb-compat" "libvpx" "libwebp" "libx11" "libxext" "libxinerama" "lightdm" "lightdm-gtk-greeter" "lightdm-gtk-greeter-settings" "lightdm-webkit2-greeter" "linux" "linux-atm" "linux-firmware" "linux-firmware-marvell" "linux-headers" "llvm" "logrotate" "lrzip" "lsb-release" "lsof" "lsscsi" "lua" "lvm2" "lynx" "lz4" "lzip" "lzop" "make" "man-db" "man-pages" "mc" "mdadm" "memtest86+" "memtest86+-efi" "menumaker" "mercurial" "mesa" "mkinitcpio" "mkinitcpio-archiso" "mkinitcpio-nfs-utils" "mobile-broadband-provider-info" "modemmanager" "moreutils" "most" "mousepad" "mousetweaks" "mpv" "mtools" "nano" "nbd" "ncdu" "ndisc6" "neovim" "net-tools" "nethogs" "network-manager-applet" "network-manager-sstp" "networkmanager" "networkmanager-l2tp" "networkmanager-openconnect" "networkmanager-openvpn" "networkmanager-pptp" "networkmanager-strongswan" "networkmanager-vpnc" "nfs-utils" "nilfs-utils" "nm-cloud-setup" "nm-connection-editor" "nmap" "npm" "nss-mdns" "ntfs-3g" "ntp" "numlockx" "nvme-cli" "open-iscsi" "openconnect" "openldap" "openpgp-card-tools" "openssh" "openvpn" "os-prober" "otf-libertinus" "p7zip" "pacman-contrib" "parole" "partclone" "parted" "partimage" "patch" "pavucontrol" "pcsclite" "perl" "picom" "pkgconf" "pkgfile" "plocate" "plymouth" "power-profiles-daemon" "powertop" "ppp" "pptpclient" "profile-sync-daemon" "pulseaudio-alsa" "pulseaudio-bluetooth" "pulseaudio-equalizer" "pulsemixer" "python-docker" "qt5-tools" "qt5ct" "ranger" "reflector" "reiserfsprogs" "rfkill" "ristretto" "rofi" "rofi-emoji" "rp-pppoe" "rsync" "rtorrent" "ruby" "rustup" "rxvt-unicode-terminfo" "schroedinger" "screen" "scrot" "sdparm" "sed" "sequoia-sq" "sg3_utils" "smartmontools" "smbclient" "socat" "sof-firmware" "squashfs-tools" "strace" "sudo" "syncthing" "syslinux" "systemd-resolvconf" "tar" "tcpdump" "terminus-font" "testdisk" "tex-gyre-fonts" "thermald" "thunar-archive-plugin" "thunar-media-tags-plugin" "thunar-volman" "thunderbird" "timeshift" "tldr" "tmux" "tor" "tpm2-tools" "tpm2-tss" "traceroute" "trash-cli" "tree" "ttf-fira-code" "ttf-hack-nerd" "ttf-jetbrains-mono-nerd" "ttf-ubuntu-font-family" "tumbler" "udftools" "udisks2" "ueberzug" "ufw" "unace" "unarchiver" "unrar" "unzip" "upower" "usb_modeswitch" "usbmuxd" "usbutils" "vim" "virtualbox" "virtualbox-ext-vnc" "virtualbox-guest-iso" "virtualbox-guest-utils" "virtualbox-host-modules-arch" "vlc" "vpnc" "webkit2gtk" "wezterm-terminfo" "wget" "wireguard-tools" "wireless_tools" "wireless-regdb" "wireplumber" "wpa_supplicant" "wvdial" "x264" "x265" "xarchiver" "xclip" "xcompmgr" "xdg-desktop-portal-gtk" "xdg-desktop-portal-xapp" "xdg-user-dirs" "xdg-user-dirs-gtk" "xdotool" "xfburn" "xfce4" "xfce4-battery-plugin" "xfce4-clipman-plugin" "xfce4-cpufreq-plugin" "xfce4-cpugraph-plugin" "xfce4-dict" "xfce4-diskperf-plugin" "xfce4-eyes-plugin" "xfce4-fsguard-plugin" "xfce4-genmon-plugin" "xfce4-goodies" "xfce4-mount-plugin" "xfce4-mpc-plugin" "xfce4-netload-plugin" "xfce4-notes-plugin" "xfce4-notifyd" "xfce4-power-manager" "xfce4-pulseaudio-plugin" "xfce4-screensaver" "xfce4-screenshooter" "xfce4-sensors-plugin" "xfce4-smartbookmark-plugin" "xfce4-systemload-plugin" "xfce4-taskmanager" "xfce4-time-out-plugin" "xfce4-timer-plugin" "xfce4-verve-plugin" "xfce4-wavelan-plugin" "xfce4-weather-plugin" "xfce4-whiskermenu-plugin" "xfce4-xkb-plugin" "xfsprogs" "xl2tpd" "xmlto" "xorg" "xorg-apps" "xorg-server" "xorg-xinit" "xsensors" "xvidcore" "xz" "yaml-cpp" "zip" "zsh" "zsh-autosuggestions" "zsh-completions" "zsh-history-substring-search" "zsh-syntax-highlighting" "zstd" "powertop")

determine_processor_type
determine_graphics_card_type

package+=("${package[@]}")

# Install the determined packages
pacman -S --noconfirm --needed "${package[@]}"
sleep 3s
clear

# Install pkgs from yay-bin
print_color "${CYAN}" "Installing Aur package..."

aurpackages=("appmenu-gtk-module-git" "appmenu-qt4" "bluez-firmware" "caffeine-ng" "dolphin-megasync-bin" "downgrade" "eww-x11" "fancontrol-gui" "firebuild" "gtk3-nocsd-git" "libdbusmenu-glib" "libdbusmenu-gtk2" "libdbusmenu-gtk3" "mkinitcpio-firmware" "mkinitcpio-numlock" "mugshot" "nbfc" "obsidian-bin" "ocs-url" "portmaster-stub-bin" "repoctl" "rtl8821ce-dkms-git" "rtw89-dkms-git" "stacer-bin" "tela-icon-theme" "thunar-extended" "thunar-megasync-bin" "thunar-secure-delete" "thunar-shares-plugin" "thunar-vcs-plugin" "universal-android-debloater-bin" "vala-panel-appmenu-common-git" "vala-panel-appmenu-registrar-git" "vala-panel-appmenu-xfce-git" "xfce4-docklike-plugin" "xfce4-panel-profiles" "zsh-theme-powerlevel10k-git" "pikaur" "tlpui" "simplescreenrecorder" "visual-studio-code-bin")

git clone https://aur.archlinux.org/pikaur.git "$HOME"/aur-pkg/pikaur
cd "$HOME"/aur-pkg/pikaur || exit
makepkg -fsri --skippgpcheck --noconfirm --needed
cd - || exit

pikaur -S --needed --noconfirm "${aurpackages[@]}"
sleep 3s
clear

# Editing sudo
print_color "${CYAN}" 'Defaults env_keep += "HOME"' | tee -a /etc/sudoers
sleep 3s
clear

# Setting up dots
print_color "${CYAN}" "Setting up Personal dotfiles"
git clone https://github.com/MikuX-Dev/dotfiles.git "$DOT"
sleep 3s
clear

# Creating folder first
print_color "${CYAN}" "Creating folder's..."
mkdir -p /root/bin/
mkdir -p "$HOME"/bin/
mkdir -p "$HOME"/.local/share/
mkdir -p $US/lightdm-webkit/themes/glorious
sleep 3s
clear

printf "\n"
print_color "${CYAN}" "Setting up shell"
# $ROOTUSER
git clone https://github.com/ohmyzsh/ohmyzsh.git /root/.oh-my-zsh
cp -r "$DOT"/shell/zsh/* /root/
cp -r "$DOT"/shell/p-script/* /root/bin/
chsh -s /bin/zsh root

# $user
git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME"/.oh-my-zsh
cp -r "$DOT"/shell/zsh/* "$HOME"/
# $user shell changed to zsh
cp -r "$DOT"/shell/p-script/* "$HOME"/bin/
# cp -r "$DOT"/shell/
sleep 3s
clear

# Setting up configuration's
print_color "${CYAN}" "Setting up config's"
cp -r "$DOT"/config/* "$HOME"/.config/
cp -r "$DOT"/local/share/* "$HOME"/.local/share/
sleep 3s
clear

# Setup rofi
print_color "${CYAN}" "Setting up rofi"
git clone https://github.com/adi1090x/rofi.git
cd rofi || exit
chmod +x setup.sh
./setup.sh
cd - || exit

echo "Check https://github.com/adi1090x/rofi.git for more information" >"$HOME"/rofi.txt
sleep 3s
clear

# Setting up themes
print_color "${CYAN}" "Setting up themes..."
cp -r "$DOT"/themes/themes/* $US/themes/
cp -r "$DOT"/themes/icons/* $US/icons/

# Check if Plymouth theme directories exist and create if not
plymouth_theme_dir="/usr/share/plymouth/themes"
if [ ! -d "$plymouth_theme_dir" ]; then
  mkdir -p "$plymouth_theme_dir"
fi
cp -r "$DOT"/themes/plymouth/* $US/plymouth/themes/

cp -r "$DOT"/wallpaper/* $US/backgrounds/
# wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf $US/fonts/

# Download and install nerd-fonts
fonts_url="https://github.com/ryanoasis/nerd-fonts/releases/latest"
font_files=("CascadiaCode.tar.xz" "Noto.tar.xz" "JetBrainsMono.tar.xz" "Meslo.tar.xz" "RobotoMono.tar.xz")
font_file_names=("CascadiaCode" "Noto" "JetBrainsMono" "Meslo" "RobotoMono")
for ((i = 0; i < ${#font_files[@]}; i++)); do
  font_file=${font_files[i]}
  font_name=${font_file_names[i]}
  font_url=$(curl -sL ${fonts_url} | grep -o -E "https://.*${font_file}")
  # Create a folder with the font name
  mkdir -p "${font_name}"
  # Download and extract the font
  curl -L -o "${font_file}" "${font_url}"
  tar -xvf "${font_file}" -C "${font_name}"
  rm "${font_file}"
  # Move the font folder to /usr/share/fonts/
  mv "${font_name}" $US/fonts/
done
sleep 3s
clear

# Configure plymouth
print_color "${CYAN}" "Configuring plymouth"
sed -i 's/^HOOKS=.*/HOOKS=(base udev plymouth autodetect modconf kms keyboard keymap consolefont block filesystems fsck)/' /etc/mkinitcpio.conf
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet splash udev.log_level=3 vt.global_cursor_default=0"/g' /etc/default/grub
mkinitcpio -p linux
grub-mkconfig -o /boot/grub/grub.cfg
plymouth-set-default-theme -R archfiery
grub-mkconfig -o /boot/grub/grub.cfg
sleep 3s
clear

# Lightdm setups
print_color "${CYAN}" "Setting up lightdm"
latest_release_url=$(curl -s https://api.github.com/repos/eromatiya/lightdm-webkit2-theme-glorious/releases/latest | grep "browser_download_url" | cut -d '"' -f 4)
curl -L -o glorious-latest.tar.gz "$latest_release_url"
tar -zxvf glorious-latest.tar.gz -C $US/lightdm-webkit/themes/glorious --strip-components=1
sed -i 's/^\(#?greeter\)-session\s*=\s*\(.*\)/greeter-session = lightdm-webkit2-greeter #\1/ #\2g' /etc/lightdm/lightdm.conf
sed -i 's/^webkit_theme\s*=\s*\(.*\)/webkit_theme = glorious #\1/g' /etc/lightdm/lightdm-webkit2-greeter.conf
sed -i 's/^debug_mode\s*=\s*\(.*\)/debug_mode = true #\1/g' /etc/lightdm/lightdm-webkit2-greeter.conf
sleep 3s
clear

# Installing grub-theme
print_color "${CYAN}" "Installing grub-theme"
cp -r "$DOT"/themes/grub/themes/* $US/grub/themes/
sed -i 's/#GRUB_THEME="/path/to/gfxtheme"/GRUB_THEME="/usr/share/grub/themes/archfiery/theme.txt"/g' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
sleep 3s
clear

# setting up ufw
print_color "${CYAN}" "Setting up UFW"
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw allow syncthing
ufw allow kdeconnect
ufw limit 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
sleep 3s
clear

# Setting up virtualbox
whoami="whoami"
print_color "${CYAN}" "Setting up virtualbox"
modprobe vboxdrv
gpasswd -a "$whoami" vboxusers
sleep 3s
clear

# Enable services
print_color "${CYAN}" "Enabling services..."
printf "\n"
enable_services=("irqbalance.service" "udisks2.service" "httpd.service" "cronie.service" "sshd.service" "lightdm-plymouth.service" "NetworkManager.service" "cups.service" "bluetooth" "ntpd.service" "dhcpcd.service" "syncthing@$username" "ufw")
systemctl enable "${enable_services[@]}"
sleep 3s
clear

# Setup blackarch repo
print_color "${CYAN}" "Setting blackarch repo"
curl -O https://blackarch.org/strap.sh
echo 5ea40d49ecd14c2e024deecf90605426db97ea0c strap.sh | sha1sum -c
chmod +x strap.sh
./strap.sh
pacman -Syyu
rm -rf strap.sh
sleep 3s
clear

# Clearcache
print_color "${CYAN}" "Clearing cache..."
pikaur -Scc --noconfirm
sleep 3s
clear

# Completed Rebooting system
printf "\n"
print_color "${GREEN}" "Setup Finished. REBOOTING IN 10 SECONDS!!!"
sleep 10s
reboot
