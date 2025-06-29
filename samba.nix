#samba.nix

{ config, lib, pkgs, ... }:

{

services.samba.enable = true;



services.gvfs.enable = true;







services.samba-wsdd = {
  enable = true;
  openFirewall = true;
};

networking.firewall.enable = true;
networking.firewall.allowPing = true;

services.samba.package = pkgs.sambaFull;



}



