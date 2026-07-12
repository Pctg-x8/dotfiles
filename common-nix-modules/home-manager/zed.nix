{ ... }:
{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "nix"
      "catppuccin-blur"
      "catppuccin-icons"
    ];
    userSettings = {
      theme = {
        mode = "dark";
        dark = "Catppuccin Espresso (Blur)";
        light = "Catppuccin Frappe";
      };
      icon_theme = {
        mode = "dark";
        dark = "Catppuccin Mocha";
        light = "Catppuccin Frappe";
      };
      journal.hour_format = "hour24";
      cli_default_open_behavior = "new_window";
      formatter = "language_server";
      # panels
      project_panel = {
        dock = "left";
        git_status = true;
        diagnostic_badges = true;
      };
      git_panel = {
        dock = "left";
        show_count_badge = true;
      };
      outline_panel.dock = "left";
      collaboration_panel.button = false;
      agent = {
        dock = "right";
        sidebar_side = "right";
      };
    };
  };
}
