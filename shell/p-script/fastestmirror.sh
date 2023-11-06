#/bin/sh

sudo reflector -f 10 --download-timeout 25 -l 10 -a 10 -p https --sort rate --save /etc/pacman.d/mirrorlist
