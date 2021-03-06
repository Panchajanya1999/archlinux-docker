#!/bin/bash

# Uncomment the community [multilib] repository
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

# Run pacman to update
pacman -Syyu --noconfirm

# Install basic packages
pacman -S --noconfirm \
                 wget nano asp kmod libelf pahole xmlto \
                 python-sphinx python-sphinx_rtd_theme graphviz imagemagick \
                 cmake svn lzip git make patchelf zip \
                 inetutils python2 lld llvm base-devel\
                 clang bc ccache multilib-devel z3 \
                 sudo jdk8-openjdk bison cmake flex libelf \
                 ninja openssl python3 uboot-tools neofetch

# Use glibc-2.33-4-x86
curl -fsSL "https://repo.archlinuxcn.org/x86_64/glibc-linux4-2.33-4-x86_64.pkg.tar.zst" | bsdtar -C / -xvf - &>/dev/null

# Fix pod2man missing error
export PATH=/usr/bin/core_perl:$PATH

# Create a symlink for z3
ln -s /usr/lib/libz3.so /usr/lib/libz3.so.4
