{ config, pkgs, ... }:

{
  home.username = "kistkin";
  home.homeDirectory = "/home/kistkin";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
  
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    ffmpeg
  ];
}

