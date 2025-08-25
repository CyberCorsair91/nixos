{ config, pkgs, ... }:

{
  hardware.bluetooth.enable = true;

  hardware.bluetooth.settings.General.Experimental = true;

  services.blueman.enable = true;
}

