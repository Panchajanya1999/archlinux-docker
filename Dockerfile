FROM scratch
ADD archlinux.tar /
ENV LANG=en_US.UTF-8
CMD ["/usr/bin/bash"]

# Install all required packages
COPY install_deps.sh /tmp/
RUN bash /tmp/install_deps.sh
