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
                 clang bc ccache multilib-devel glibc z3 \
                 sudo jdk8-openjdk bison cmake flex libelf cpio \
                 ninja openssl python3 uboot-tools neofetch ncurses

# Fix pod2man missing error
export PATH=/usr/bin/core_perl:$PATH

# Create a symlink for z3
ln -s /usr/lib/libz3.so /usr/lib/libz3.so.4
