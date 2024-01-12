{ pkgs, inputs, config, ... }:

{

  imports =
    [
      inputs.sops-nix.nixosModules.sops
    ];

  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  
  sops.age.keyFile = "/home/jwrhine/.config/sops/age/keys.txt";

  sops.secrets.tailscale = { 
    owner = "jwrhine";
  };

}
