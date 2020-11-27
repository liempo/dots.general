
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
    - Use the following partition table:
    Partition | Mount Point | File System | Size
    ----------|-------------|-------------|-----
    /dev/sda1 | /efi        | FAT32       | 512M
    /dev/sda2 | / (root)    | ext4        |

2. During chroot phase, install `networkmanager`.
3. Before exiting chroot, install `grub` and `efibootmgr` then run:
```
 grub-install --target=x86_64-efi --bootloader-id=I_HATE_GRUB --efi-directory=/efi
 grub-mkconfig -o /boot/grub/grub.cfg

```
4. On first actual boot, log in to root and remove all those grub stuff:
```
pacman -Rcns grub
rm -rf /efi/EFI/I_HATE_GRUB
rm -rf /boot/grub
```
5. Install a better bootloader, `refind` then run `refind-install`



### Credits / Thanks
- [lofi hip hop radio](https://www.youtube.com/watch?v=5qap5aO4i9A) for making me chill
- [owl4ce](https://github.com/owl4ce) for the inspiration.
- [r/unixporn](https://www.reddit.com/r/unixporn/).
- Some people in the forum who provide solutions.
- Arch Wiki
