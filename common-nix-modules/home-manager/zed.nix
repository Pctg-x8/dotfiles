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
      theme = {
        mode = "dark";
        dark = "Catppuccin Mocha (Blur)";
        light = "Catppuccin Frappe";
      };
      icon_theme = {
        mode = "dark";
        dark = "Catppuccin Mocha";
        light = "Catppuccin Frappe";
      };
      journal.hour_format = "hour24";
    };
  };
}

