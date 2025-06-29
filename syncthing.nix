#syncthing.nix

{config, lib, pkgs, ... }:

{

services = {
  syncthing = {
    enable = true;
    #group = "users";
    #user = "bob";
    dataDir = "/home/storage";
    configDir = "/home/storage";
    #overrideDevices = true;     # overrides any devices added or deleted through the WebUI
    #overrideFolders = true;     # overrides any folders added or deleted through the WebUI
    #settings = {
      #devices = {
       # "lenovomini" = { id = "FSPAOLK-RL333SQ-AD3UH4W-YBXUVWK-CO4PY7G-UR5KZKP-KRKA32C-3MZNVQZ"; };
        
      #};
      #folders = {
       # "iNixos" = {         # Name of folder in Syncthing, also the folder ID
        #  path = "/home/storage";    # Which folder to add to Syncthing
         # devices = [ "lenovomini" ];      # Which devices to share the folder with
        #};
        #"Lenovomini" = {
          #path = "/home/bob/lenovomini";
          #devices = [ "iNixos" ];
          #ignorePerms = false;  # By default, Syncthing doesn't sync file permissions. This line enables it for this folder.
        #};
      #};
    #};
  };
};



}
