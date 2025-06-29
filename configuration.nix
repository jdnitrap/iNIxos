# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.


      ./hardware-configuration.nix
      #./print.nix
      ./sound.nix
      #./mom.nix
      #./plasma.nix
      #./opse.nix
      #./samba.nix
     ./pkgs.nix
     ./syncthing.nix


    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "iNixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };





  services.xserver = {
  enable = true;
  displayManager.gdm.enable = true;
  desktopManager.gnome.enable = true;
};


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  #services.printing.enable = true;
  #services.printing.browsing = true;
  #programs.system-config-printer.enable = true;
  #services.system-config-printer.enable = true;

  

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nimda = {
    isNormalUser = true;
    description = "nimda";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };
  
  users.users.bob = {
    isNormalUser = true;
    description = "bob";
    extraGroups = [ "networkmanager" "wheel" "scanner" "lp"];
    packages = with pkgs; [

    ];
  };
  




  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
   networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
  
#FLATPAK 
  services.flatpak.enable = true;
  
#OPENSNITCH
  
 # services.opensnitch = {
  #enable = true;
  #};
    
  #systemd = {
  #services = {
   # opensnitch = {
   #   description = "Opensnitch Application Firewall Daemon";
    #  wants = ["network.target"];
     # after = ["network.target"];
     #wantedBy = ["multi-user.target"];
     # path = [ pkgs.iptables ];
      
      #enable = true;
    #};
    #};
    #};


  
  services.avahi = {
  enable = true;
  nssmdns4 = true;
  openFirewall = true;
};

#services.printing.drivers = with pkgs; [

#	epson-workforce-635-nx625-series
#	epson-201106w
#	epson-201401w
#	foomatic-db-ppds
#	gutenprint
#	foomatic-db
#	cnijfilter_2_80
#	cnijfilter_4_00
#	epson_201207w
#	gutenprintBin
#	cups-printers
	
#	];
	
hardware.sane.enable = true; # enables support for SANE scanners
  services.ipp-usb.enable = true;
  services.avahi.nssmdns = true;
  
#Syncthing
	#services.syncthing.enable = true;

	services.netbird.enable = true;
	services.tailscale.enable = true;



     # programs.kdeconnect.enable = true;






}
