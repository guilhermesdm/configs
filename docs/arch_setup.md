# Defining partitions

```
> parted /dev/nvme0n1
> mklabel gpt
> mkpart ESP fat32 1MiB 1025MiB
> set 1 boot on
> mkpart primary linux-swap 1025MiB 33G
> mkpart primary ext4 32G 90G
> mkpart primary ext4 90G 100%
> quit
```

# Format partitions

```
> mkfs.fat -F32 /dev/nvme0n1p1
> mkswap /dev/nvme0n1p2
> swapon /dev/nvme0n1p2
> mkfs.ext4 /dev/nvme0n1p3
> mkfs.ext4 /dev/nvme0n1p4
```

# Mount partitions

```
> mount /dev/nvme0n1p3 /mnt
> mkdir -p /mnt/boot/EFI
> mount /dev/nvme0n1p1 /mnt/boot/EFI
> mkdir /mnt/home
> mount /dev/nvme0n1p4 /mnt/home
```

# Installing base packages

```
> pacstrap /mnt base base-devel linux linux-firmware neovim zsh git
> genfstab -U /mnt >> /mnt/etc/fstab
```

# Locale

```
> arch-chroot /mnt
> ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
> hwclock --systohc
> printf "\nen_US.UTF-8 UTF-8\npt_BR.UTF-8 UTF-8\n" >> /etc/locale.gen
> locale-gen
> echo LANG=en_US.UTF-8 > /etc/locale.conf
> systemctl enable systemd-timesyncd.service
```

# Host

```
> neovim /etc/hostname -> arch
> neovim /etc/hosts ->
  -- 127.0.0.1    localhost
  -- ::1          localhost
  -- 127.0.1.1    arch.localdomain arch
```

# User

```
> passwd
> useradd -m -G wheel,storage,power,audio,video -s /usr/bin/zsh guilherme
> passwd guilherme

> export VISUAL="nvim"
> export EDITOR="$VISUAL"

> visudo -> uncomment "%wheel ALL=(ALL) ALL"
```

# Packages

```
> pacman -S grub efibootmr networkmanager network-manager-applet wireless_tools wpa_supplicant dialog os-prober mtools dosfstools linux-headers bluez bluez-utils
> systemctl enable NetworkManager
> systemctl enable wpa_supplicant
> systemctl enable systemd-resolved
```

# GRUB

```
> grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=GRUB
> grub-mkconfig -o /boot/grub/grub.cfg
```

# Audio settings

```
> pacman -S pipewire pipewire-alsa pipewire-pulse wireplumber alsa-utils playerctl
```

# Video settings

```
> pacman -S xorg-server xorg-apps xorg-xinit
```

# WM

```
> pacman -S i3 picom xterm xdg-utils xfce4-notifyd feh maim
```

# Fonts

```
> pacman -S ttf-font-awesome ttf-dejavu ttf-liberation-mono-nerd
```

# Xinit

```
> touch .Xresources
> nvim .xinitrc (in home)
  -- xrdb -merge $HOME/.Xresources
  -- exec i3
```
