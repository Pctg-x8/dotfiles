{ pkgs, nixpkgs, ... }:
let
  normalUserName = "pctgx8";
  stateVersion = "24.05";
in {
  system.stateVersion = stateVersion;

  wsl = {
    enable = true;
    defaultUser = normalUserName;
    wslConf.automount.root = "/mnt";

    docker-desktop.enable = false;
  };

  users.users.${normalUserName} = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    shell = pkgs.fish;
  };

  home-manager.users.${normalUserName} = import ./home.wsl.nix { inherit normalUserName stateVersion; };
  programs.fish.enable = true;

  environment.systemPackages = [
    pkgs.rustup
    pkgs.temurin-bin
    pkgs.sbt
    pkgs.bun
  ];

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune.enable = true;
  };

  nix = {
    settings.trusted-users = [normalUserName];
    settings.accept-flake-config = true;
    settings.auto-optimise-store = true;
    settings.experimental-features = ["nix-command" "flakes"];

    package = pkgs.nixFlakes;
    nixPath = [
      "nixpkgs=${nixpkgs.outPath}"
      "nixos-config=/etc/nixos/configuration.nix"
      "/nix/var/nix/profiles/per-user/root/channels"
    ];
  };
}
