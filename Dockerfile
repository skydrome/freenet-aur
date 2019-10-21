FROM iterait/archlinux-dev:latest

COPY entrypoint.sh /entrypoint.sh
VOLUME /build

RUN useradd -r makepkg && \
    pacman -Sy --noconfirm --needed archlinux-keyring && \
    pacman -Su --noconfirm --needed base-devel git sudo jdk11-openjdk && \
    rm -rf /var/cache/pacman/pkg && \
    echo 'makepkg ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/makepkg

USER makepkg
ENTRYPOINT ["/entrypoint.sh"]
