DOTFILES
===================

Personal dot file customization and general setup for personal computers.


Themes
------

 1. [base16-shell](https://github.com/chriskempson/base16-shell)
 2. [dircolors-solarized](https://github.com/seebi/dircolors-solarized)
 3. [base16-xresources](https://github.com/chriskempson/base16-xresources)


Current setup
-------------

### [Display server: Xorg](https://wiki.archlinux.org/index.php/Xorg)

`# pacman -S xorg-server xorg-xrdb xorg-utils mesa <xf86-video-nouveau> <xf86-video-intel>`

### [Display manager: LightDM](https://wiki.archlinux.org/index.php/LightDM)

```
# pacman -S lightdm lightdm-gtk-greeter-settings
# systemctl enable lightdm.service
# systemctl start lightdm.service
```
### [Power management](https://wiki.archlinux.org/index.php/Power_management)

### [Hibernation](https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate#Hibernation)

Requires a swap partition or file.

1. `# nano /etc/default/grub`
1. Add kernel parameter `resume=swap_partition`

    * `resume=/dev/sda1`
    * `resume=UUID=4209c845-f495-4c43-8a03-5363dd433153`
1. `# grub-mkconfig -o /boot/grub/grub.cfg` 
1. `# nano /etc/mkinitcpio.conf`
1. Add `resume` to HOOKS:

    `HOOKS="base udev resume autodetect modconf block filesystems keyboard fsck"`
1. Rebuild the initramfs: `# mkinitcpio -p linux`

### [Polkit](https://wiki.archlinux.org/index.php/Polkit)

`# pacman -S polkit polkit-gnome`

### [Window manager: i3-wm](https://wiki.archlinux.org/index.php/I3)

`# pacman -S i3 dmenu dunst compton`

### [Networking: Wicd](https://wiki.archlinux.org/index.php/Wicd)

```
# pacman -S wicd wicd-gtk
# systemctl disable dhcpcd.service
# systemctl enable wicd.service
# gpasswd -a <username> users
```

### [Build and install: AUR](https://wiki.archlinux.org/index.php/Arch_User_Repository#Installing_packages)

1. Install dependencies:

    `# pacman -S expac yajl git`

1. Clone the cower git repository:

    `$ git clone https://aur.archlinux.org/cower.git`

1. Build and install the package

    ```
    $ cd cower
    $ less PKGBUILD
    $ makepkg --skippgpcheck --install --needed
    ```

1. Repeat for `pacaur`.


### [Audio](https://wiki.archlinux.org/index.php/PulseAudio)

```
# pacman -S pulseaudio pulseaudio-alsa <pulseaudio-bluetooth>
# pacaur -S pulsemixer
# reboot
```

### Common packages
    
```
# pacman -S rxvt-unicode rxvt-unicode-terminfo urxvt-perls
# pacman -S nemo nemo-fileroller nemo-share
# pacman -S redshift htop
```

```
# pacaur -S dropbox nemo-dropbox keepassxc
```

### Theme and colors

1. Setup terminal theme and color:

    ```
    $ mkdir ~/build-repos
    $ cd ~/build-repos
    $ git clone https://github.com/chriskempson/base16-shell
    $ git clone https://github.com/seebi/dircolors-solarized
    ```

1. Install and apply GTK theme:

    ```
    # pacman -S qt5ct qt5-styleplugins lxappearance 
    # pacman -S arc-gtk-theme
    # pacaur -S moka-icon-theme
    ```

1. Link Sublime Text 3 User Package settings:

    `$ cp -rfs ~/dotfiles/sublime/*.sublime-settings ~/.config/sublime-text-3/Packages/User/`

1. `$ git clone git://github.com/scottwernervt/dotfiles.git`
1. `$ ln -s ~/dotfiles/bashrc ~/.bashrc`


Asus 1201N
----------

### Function keys

1. `# nano /etc/default/grub`
1. Add `acpi_osi=Linux` to `GRUB_CMDLINE_LINUX_DEFAULT`
1. `# grub-mkconfig -o /boot/grub/grub.cfg` 
1. Reboot
1. `# modprobe eeepc_laptop`

### Power management

#### Suspend

```
/etc/systemd/system/root-suspend.service
----------------------------------------
[Unit]
Description=Disable ASUS 1201N USB wakeup triggers
Before=sleep.target

[Service]
Type=simple
ExecStart=/bin/sh -c "echo USB0 > /proc/acpi/wakeup; echo US15 > /proc/acpi/wakeup"
ExecStop=/bin/sh -c "echo USB0 > /proc/acpi/wakeup; echo US15 > /proc/acpi/wakeup"

[Install]
WantedBy=sleep.target
```

```
# systemctl enable root-suspend
# systemctl start root-suspend
```

### References

 - [Best Practice To Debug Linux Suspend/hibernate Issues](https://01.org/blogs/rzhang/2015/best-practice-debug-linux-suspend/hibernate-issues)
 - [Why does my laptop resume immediately after suspend? [closed]](https://askubuntu.com/a/161555)
 - [Sleep hooks](https://wiki.archlinux.org/index.php/Power_management#Sleep_hooks)


Testing
-------

`$ source ~/.bashrc`


References
----------

 - [using-git-and-github-to-manage-your-dotfiles](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/)
