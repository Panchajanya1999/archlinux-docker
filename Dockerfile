FROM scratch
ADD archlinux.tar /
ENV LANG=en_US.UTF-8
CMD ["/usr/bin/bash"]

# Uncomment community [multilib] repository
RUN sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

# Update archlinux with multilibs enabled
RUN pacman -Syyu --noconfirm

# Install necessary packages for kernel compilation
RUN pacman -S --noconfirm \
                 wget  \
                 cmake svn lzip patchelf zip \
                 inetutils python2 lld llvm \
                 clang bc ccache multilib-devel glibc