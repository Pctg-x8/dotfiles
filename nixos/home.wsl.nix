{ normalUserName, stateVersion }: { config, pkgs, ... }:

{
  home.username = normalUserName;
  home.homeDirectory = "/home/${normalUserName}";
  home.stateVersion = stateVersion;

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
  };
}
