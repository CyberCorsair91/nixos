{ config, pkgs, ... }:

{
  home.username = "kistkin";
  home.homeDirectory = "/home/kistkin";

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  # Import modules
  imports = [
    ./modules/gtk.nix
  ];
}

