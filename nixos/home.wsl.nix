{ normalUserName, stateVersion }: { config, pkgs, ... }:
let
  extra-npm-packages = import ./extra-npm-packages {
    inherit pkgs;
    nodejs = pkgs.nodejs;
  };
in {
  home.username = normalUserName;
  home.homeDirectory = "/home/${normalUserName}";
  home.stateVersion = stateVersion;

  home.sessionVariables.EDITOR = "nvim";
  home.sessionPath = ["$HOME/.volta/bin"];

  home.packages = [pkgs.volta extra-npm-packages."@dotenvx/dotenvx-1.14.0"];

  programs.home-manager.enable = true;
  programs.fish = {
    enable = true;
  };
  programs.git = {
    enable = true;
    
    userName = "S.Percentage";
    userEmail = "2141528+Pctg-x8@users.noreply.github.com";

    aliases = {
      a = "add -p";
      aa = "add";
      cm = "commit -m";
      st = "status -s";
      co = "checkout";
      p = "push";
      pu = "push -u";
      pff = "pull --ff-only";
      merc = "merge --no-ff";
      mcont = "merge --continue";
      rh = "reset --hard";
      lg1 = "log --oneline";
    };
  };
  programs.neovim = {
    enable = true;
  };
  programs.awscli = {
    enable = true;
  };
}

