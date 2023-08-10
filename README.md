# Dotfile Repository

This repository contains my personal dotfiles for various configurations, including themes, GTK, icons, grub theme, and wallpaper. Feel free to explore and use them as a reference or customize them for your own setup.

## Table of Contents

- [Installation](Installation)
- [Configurations](5.)
- [License](License)

## Installation

To use these dotfiles on Arch Linux, follow these steps:

1. Clone the repository
```
git clone https://github.com/MikuX-Dev/dotfiles.git
```

2. Install the necessary dependencies for each configuration. For example, if you're using the yay AUR helper:
```
yay -S package-name
```
Replace package-name with the actual package name required by your dotfiles. You may also use pacman for packages available in the official Arch Linux repositories.

3. Execute the installation script:
```
cd dotfiles && ./install.sh
```

4. Customize the dotfiles to suit your preferences:

- Modify the color schemes, fonts, or other settings in the theme files.
- Add or remove additional packages or dependencies for your specific setup.
- Customize the grub theme by editing the images or colors used.

5. Apply the configurations:

- Copy the theme files to the appropriate directories for your desktop environment or window manager.
- Apply the GTK theme using your system settings or tools like lxappearance or gnome-tweaks.
- Copy the icon theme files to the appropriate directories for your desktop environment or icon theme manager.
- Follow the instructions in the grub theme directory to install and apply the theme to your bootloader.
- Set the wallpaper using your desktop environment's settings or a specific tool.

## License

This project is licensed under the [MIT License](https://github.com/MikuX-Dev/dotfiles/blob/master/LICENSE). Feel free to use and modify the dotfiles as you see fit, but please give credit and provide a link back to this repository.

Enjoy your customized Arch Linux setup!
