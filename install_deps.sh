#!/bin/bash

# Uncomment the community [multilib] repository
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

# Run pacman to update
pacman-key --init
pacman -Syyu --noconfirm

# Install basic packages
pacman -S --noconfirm \
                 wget nano asp github-cli kmod libelf pahole xmlto \
                 python-sphinx python-sphinx_rtd_theme graphviz imagemagick \
                 cmake svn lzip git make patchelf zip \
                 inetutils lld llvm base-devel\
                 clang bc ccache multilib-devel glibc z3 \
                 sudo jdk8-openjdk bison cmake flex libelf cpio unzip dpkg \
                 ninja openssl python3 uboot-tools neofetch ncurses

# Fix pod2man missing error
export PATH=/usr/bin/core_perl:$PATH

# Create a symlink for z3
ln -s /usr/lib/libz3.so /usr/lib/libz3.so.4

# Setup locale
echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/environment
echo "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
echo "LANG=en_US.UTF-8" | sudo tee -a /etc/locale.conf
sudo locale-gen en_US.UTF-8
