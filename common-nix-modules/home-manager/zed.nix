{ ... }:
{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "nix"
      "Catppuccin Blur"
      "Catppuccin Icons"
    ];
    userSettings = {
      theme.mode = "dark";
      theme.dark = "Catppuccin Mocha (Blur)";
      icon_theme = {
        mode = "dark";
        dark = "Catppuccin Mocha";
        light = "Catppuccin Frappe";
      };
      journal.hour_format = "hour24";
    };
  };
}

