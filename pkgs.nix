#pkgs.nix

{config, lib, pkgs, ... }:

{

# Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [


acpi
asciiquarium
axel
btop
calcurse
cifs-utils
curl
fastfetch
fd
flatpak
galculator
geany
google-chrome
inxi
kdePackages.accounts-qt
kdePackages.discover
kdePackages.kaccounts-integration
kdePackages.kaccounts-providers
kdePackages.kdeconnect-kde
kdePackages.kmail
kdePackages.signond
kdePackages.plasmatube
libreoffice
ncdu
notesnook
opensnitch
opensnitch-ui
rclone
sambaFull
sc-im
screen
syncthing
teapot
thunderbird
tmux
visidata
wget
vim
filezilla
rclone-browser
freetube
vlc


  ];







}
