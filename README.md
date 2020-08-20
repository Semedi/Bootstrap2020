## Dependencies

### Graphics / Session

* lightdm
* lightdm-gtk-greeter

* xorg-server
* xf86-video-intel <- Intel gpu
* xf86-video-vesa
* xf86-video-fbdev
* xf86-input-libinput

### Desktop Environment
* bspwm || i3
* sxhkd
* rofi || dmenu

### Networking
* systemd-networkd
* wpa_supplicant
* dhclient (opt)

### Utils
* base-devel
* git
* termite
* neovim
* sudo
* firefox


#### Termite theme:

- https://github.com/adi1090x/termite-style

* Dracula
* Go 11


### AUR

```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

* polybar

### Zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
