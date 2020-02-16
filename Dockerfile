FROM iterait/archlinux-dev:latest

COPY entrypoint.sh /entrypoint.sh
VOLUME /build

RUN useradd -r makepkg && \
    pacman -Sy --noconfirm --needed archlinux-keyring && \
    pacman -Su --noconfirm --needed base-devel git sudo jdk-openjdk ant zip && \
    rm -rf /var/cache/pacman/pkg && \
    echo 'makepkg ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/makepkg &&
    gpg --recv-keys FD6C57F9

USER makepkg
ENTRYPOINT ["/entrypoint.sh"]
