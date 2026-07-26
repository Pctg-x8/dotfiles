{ pkgs, ... }:
{
  programs.fish = {
    enable = true;

    plugins = [
      {
        name = "bass";
        src = pkgs.fishPlugins.bass.src;
      }
    ];
    loginShellInit = ''
      source $HOME/.nix-profile/etc/profile.d/hm-session-vars.fish
    '';
    interactiveShellInit = builtins.readFile ./interactiveInit.fish;
  };
}
