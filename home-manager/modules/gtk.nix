{ config, pkgs, ... }:

{
  # GTK / Icon theme configuration
  gtk = {
    enable = true;

    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyonight-gtk-theme;
    };

    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };

  # Extra home packages related to GTK / icons
  home.packages = with pkgs; [
    bat
    tokyonight-gtk-theme
    arc-theme
    gtk-engine-murrine
    papirus-icon-theme
  ];

  # GTK environment variable
  home.sessionVariables.GTK_THEME = "Tokyonight-Dark";

  # Ensure GTK3 apps pick up the theme
  xdg.configFile."gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-theme-name=Tokyonight-Dark
    gtk-icon-theme-name=Papirus
  '';
}

