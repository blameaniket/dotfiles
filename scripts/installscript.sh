#!/usr/bin/env bash

set -e

sudo -v

while sudo -v; do
  sleep 60
done &
SUDO_KEEPALIVE_PID=$!
trap "kill $SUDO_KEEPALIVE_PID 2>/dev/null" EXIT

sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm base-devel git

# ---- yay ----
BUILD_DIR="/tmp/yay-build"
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

cd ~
rm -rf "$BUILD_DIR"

command -v yay >/dev/null || { echo "yay failed"; exit 1; }

# ---- packages ----
PACKAGES=(
  neovim
  fish
  tmux
  firefox
  redshift
  feh
  nwg-look
  tree
  less
  ripgrep
)

sudo pacman -S --noconfirm "${PACKAGES[@]}"

# ---- AUR packages ----
yay -S --needed --noconfirm \
  dracula-gtk-theme \
  vesktop-bin \
  sioyek-appimage

# ---- dev setup ----
DEV_DIR="$HOME/dev"
mkdir -p "$DEV_DIR"

[ -d "$DEV_DIR/dotfiles" ] || git clone https://github.com/blameaniket/dotfiles "$DEV_DIR/dotfiles"
[ -d "$DEV_DIR/atlastheme" ] || git clone https://github.com/blameaniket/atlastheme "$DEV_DIR/atlastheme"

git clone https://github.com/blameaniket/nvim "$HOME/.config/nvim" || true

mkdir -p "$HOME/.config/i3" "$HOME/.config/fish"

rsync -av "$DEV_DIR/dotfiles/i3/" "$HOME/.config/i3/"
rsync -av "$DEV_DIR/dotfiles/fish/" "$HOME/.config/fish/"

cp -f "$DEV_DIR/dotfiles/.tmux.conf" "$HOME/.tmux.conf"

sudo chsh -s /usr/bin/fish "$USER"

# ---- build tools ----
make -C "$DEV_DIR/dotfiles/st_good_font" install
make -C "$DEV_DIR/dotfiles/dmenu" install

