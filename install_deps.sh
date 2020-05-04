#!/bin/bash

# Uncomment the community [multilib] repository
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

# Run pacman to update
pacman -Syyu --noconfirm

# Install basic packages
pacman -S --noconfirm \
                 wget  \
                 cmake svn lzip git make patchelf zip \
                 inetutils python2 lld llvm base-devel\
                 clang bc ccache multilib-devel glibc \
                 sudo jdk8-openjdk bison cmake flex libelf \
                 ninja openssl python3 uboot-tools neofetch

# Fix pod2man missing error
export PATH=/usr/bin/core_perl:$PATH
