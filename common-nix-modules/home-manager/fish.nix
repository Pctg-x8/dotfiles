{ pkgs, ... }:
{
  programs.fish = {
    enable = true;

    plugins = [ { name = "bass"; src = pkgs.fishPlugins.bass.src; } ];
    loginShellInit = ''
      bass source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
    '';
    interactiveShellInit = builtins.readFile ./interactiveInit.fish;
  };
}

