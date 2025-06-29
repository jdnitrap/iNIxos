#mom.nix
{config, pkgs, ... }:
{

users.users.mom = {
    isNormalUser = true;
    description = "mom";
    extraGroups = [ "networkmanager" "scanner" "lp" "scanner" ];
    packages = with pkgs; [ thunderbird google-chrome ];

    };








  }
