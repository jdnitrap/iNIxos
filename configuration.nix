# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  #services.xserver.displayManager.lightdm.enable = false;
  services.xserver.displayManager.gdm.enable = true;
  #services.xserver.displayManager.sddm.enable = false;
  
  
  services.xserver.desktopManager.xfce.enable = false;
  services.xserver.desktopManager.lxqt.enable = false;
  services.xserver.desktopManager.mate.enable = false;
  services.xserver.desktopManager.plasma5.enable = false;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.desktopManager.enlightenment.enable = false;
  services.xserver.desktopManager.pantheon.enable = false;
  services.xserver.desktopManager.lumina.enable = false;
  services.xserver.desktopManager.kodi.enable = false;
  services.xserver.desktopManager.deepin.enable = false;
  services.xserver.desktopManager.cinnamon.enable = false;
  services.xserver.desktopManager.cde.enable = false;
  services.xserver.desktopManager.budgie.enable = false;
  
  
  
  
  #services.gnome.gnome-initial-setup.enable = false;
  
  
  
  
  
  
  
  
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.browsing = true;
  programs.system-config-printer.enable = true;
  services.system-config-printer.enable = true;
  
  
  
  

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bob = {
    isNormalUser = true;
    description = "bob";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      
      
      
 
    
    ];
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = false;
  #services.xserver.displayManager.autoLogin.user = "bob";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  
  flatpak
  #libsForQt5.discover
  gnome.gnome-tweaks
  gnomeExtensions.appindicator

  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
  
    #Flatpak
	services.flatpak.enable = true;
	xdg.portal = {
	enable = true;
	wlr.enable = true;
	};
	
	# Doc scanner

  hardware.sane.enable = true; # enables support for SANE scanners
  services.ipp-usb.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  
  #################JELLYFIN###################
 services.jellyfin.enable = false;
 services.jellyfin.openFirewall = false;


programs.gnome-terminal.enable = true;
services.gnome.games.enable = false;
services.gnome.gnome-keyring.enable = false;
services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];



################Ollama########################
# Ollama
services.ollama = {
  #package = pkgs.unstable.ollama; # Uncomment if you want to use the unstable channel, see https://fictionbecomesfact.com/nixos-unstable-channel
  enable = true;
  acceleration = "cuda"; # Or "rocm"
  #environmentVariables = { # I haven't been able to get this to work myself yet, but I'm sharing it for the sake of completeness
    # HOME = "/home/ollama";
    # OLLAMA_MODELS = "/home/ollama/models";
    # OLLAMA_HOST = "0.0.0.0:11434"; # Make Ollama accesible outside of localhost
    # OLLAMA_ORIGINS = "http://localhost:8080,http://192.168.0.10:*"; # Allow access, otherwise Ollama returns 403 forbidden due to CORS
  #};
};




}
