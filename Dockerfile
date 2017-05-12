FROM base/archlinux

RUN pacman-key --init && pacman-key --populate archlinux && pacman-db-upgrade && pacman --noconfirm -Sy base base-devel git aircrack-ng pyrit scapy mdk3 xterm ncurses psmisc gawk coreutils glibc sed gzip bzip2 unzip wget sudo less john python2 python2-lxml && yes | pacman -Scc && mkdir -p /build/handshake-cracker

COPY . /build/handshake-cracker

RUN cd /build/handshake-cracker && ./install.sh && cd / && rm -rf /build

ENV PATH=/usr/bin

CMD ["bash"]
