# Configurations for my personal laptop

Thinkpad T14 Gen 1 AMD


# Post OS installation process

> sudo pacman -S i3-wm i3status i3lock i3blocks dmenu brightnessctl xbindkeys playerctl pamixer rustup cargo tlp tlp-rdw dunst libnotify picom feh noto-fonts noto-fonts-emoji xorg-xinput rofi smartmontools ethtool acpi_call powertop alacritty pavucontrol udiskie flameshot neovim git otf-font-awesome fastfetch acpi lxappearance4 tmux blueman bluez bluez-utils

> sudo systemctl enable tlp --now

> sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket

> sudo systemctl enable bluetooth

> sudo systemctl start bluetooth

> sudo cp BlexMonoNerdFont /usr/share/fonts


# ZSH 

> sudo pacman -S zsh

> sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

> git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

> git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Symlink everything
> ln -s ~/configs/i3 ~/.config/i3

> ln -s ~/configs/picom ~/.config/picom

> ln -s ~/configs/nvim ~/.config/nvim

> ln -s ~/configs/alacritty ~/.config/alacritty

> ln -s ~/configs/.zshrc ~/.zshrc

> sudo ln -s ~/configs/xorg.conf.d /etc/X11/xorg.conf.d

# NVM

> curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

> nvm install 20

# Rustup

> rustup default stable


# Paru

> git clone https://github.com/Morganamilo/paru > ~

> cd paru

> makepkg -si


# XIdleHook

> paru -S xidlehook
