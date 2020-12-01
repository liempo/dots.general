
![](.previews/wal.gif)
# Liempo's Linux
Hi there! This is a rice that focus on minimalism and usability, nothing too fancy here.
This is a guide (for future me) to replicate things in case it breaks.
- **OS:** Arch Linux
- **Window Manager:** bspwm
- **Compositor:**: [ibhagwan's picom](https://github.com/sdhand/picom)
- **Terminal:** termite
- **Panel:**: polybar
- **Launcher:** rofi

# Install notes
1. Install the bare Arch Linux using the [wiki](https://wiki.archlinux.org/index.php/installation_guide).
     a. Use the following partition table:

     | Partition  | Mount Point | File System | Size  |
     | ---------- | ----------- | ----------- | ----- |
     | /dev/sda1  | /efi        | FAT32       | 512M  |
     | /dev/sda2  | / (root)    | ext4        | 32G+  | 
     
     b. Install the following packages along with base (during `pacstrap`):
     ```
     pacstrap /mnt base base-devel linux linux-firmware \
        grub efibootmgr refind networkmanager zsh git vim
     ```

2. During chroot phase, enable `networkmanager` by `systemctl enable NetworkManger`.
3. Before exiting chroot, initialize `grub` temporarily (since I can't make `refind` work during chroot):
    ```
    grub-install --target=x86_64-efi --bootloader-id=I_HATE_GRUB --efi-directory=/efi
    grub-mkconfig -o /boot/grub/grub.cfg
    ```
4. On first actual boot, log in to root, **connect to network**, and remove all those grub stuff:
    ```
    pacman -Rcns grub
    rm -rf /efi/EFI/I_HATE_GRUB
    rm -rf /boot/grub
    ```
5. Initialize the better bootloader by running `refind-install`.
6. Create a non-root user and add it to `wheel`
    ```
    EDITOR=/usr/bin/vim visudo # Uncomment %wheel ALL=(ALL)
    useradd -m -g users -G wheel -s /bin/zsh liempo
    passwd liempo
    ```
7. Login to non-root user, install `yay`
    ```
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si
    rm -rf yay-bin
    ```
7. Install the graphic packages:
    ```
    yay -S xorg lightdm lightdm-mini-greeter bspwm sxhkd picom-ibhagwan-git \
        firefox termite xcape feh rofi polybar termite python-pywal
    ```

8. Configure lightdm with autologin:

    a. Create autologin group and add non-root user
    ```
    sudo groupadd -r autologin
    sudo gpasswd -a username autologin
    ```
    b. Edit `/etc/lightdm/lightdm.conf`:

    ```
    [Seat:*]
    greeter-session=lightdm-mini-greeter
    autologin-user=username
    autologin-session=bspwm
    ```
9. Reboot and configure `bspwm` and `sxhkd` (Or [clone this repo](https://www.atlassian.com/git/tutorials/dotfiles))


### Credits / Thanks
- [lofi hip hop radio](https://www.youtube.com/watch?v=5qap5aO4i9A) for making me chill
- [owl4ce](https://github.com/owl4ce) for the inspiration.
- [r/unixporn](https://www.reddit.com/r/unixporn/).
- Some people in the forum who provide solutions.
- Arch Wiki
