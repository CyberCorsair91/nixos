{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    obsidian
    wofi
    kitty
    neovim
    swww
    dunst
    fastfetch
    git
    zip
    unzip
    btop
    ripgrep
    nodejs
  ];
}

