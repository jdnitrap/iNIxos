#print.nix

{
  
  config = {
  
 
  
  services.printing.enable = true;
  services.printing.browsing = true;
  programs.system-config-printer.enable = true;
  services.system-config-printer.enable = true;


  };

  }
