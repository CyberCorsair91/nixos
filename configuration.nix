# /etc/nixos/configuration.nix
{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./modules/audio.nix
      ./modules/packages.nix
      ./modules/bluetooth.nix
      ./modules/nvidia.nix
      ./modules/bootloader.nix
      ./modules/locales.nix
    ];

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Hostname
  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable X11 and GNOME
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Keyboard layout
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Printing
  services.printing.enable = true;

  # Users
  users.users.kistkin = {
    isNormalUser = true;
    description = "kistkin";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # add user-specific packages here
    ];
  };

  # Programs
  programs.firefox.enable = true;
  programs.neovim.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System state version
  system.stateVersion = "25.05"; 
}

