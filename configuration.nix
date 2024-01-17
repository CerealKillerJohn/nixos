{ config, pkgs, lib, ... }:

{
  imports =
    [ 
      ./modules/fonts/fonts.nix
      ./modules/media/audio.nix
      ./modules/nix/nix.nix
      ./modules/printing/printing.nix
      ./modules/shells/aliases.nix
      ./modules/shells/zsh.nix
      ./packages/git.nix
      ./packages/nh.nix
      ./packages/packages.nix
#      ./packages/sops.nix
#      ./packages/tailscale.nix
    ];

  boot = {
    tmp = {
      cleanOnBoot = true;
      };
  };

  networking = {
    networkmanager = {
      enable = true;
    };  
    # wireless = {
      # enable = true;
    # };  
  };

  time = {
    timeZone = "America/New_York";
  };  

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
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
  };

  services = {
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";
      # remove xterm by default
      excludePackages = [pkgs.xterm];
      displayManager = {
        autoLogin = {
	  user = "jwrhine";
	};
      };
    };  
    getty = {
      autologinUser = "jwrhine";
    };	
  };

  systemd = {
    services = {
      "getty@tty1".enable = false; # fixes autologin with gdm
      "autovt@tty1".enable = false; # https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
    };
  };

  hardware = {
    enableAllFirmware = true;
  };

#  sops = {
#    gnupg = {
#      sshKeyPaths = [];
#    };
#    secrets = {
#      up = {
#        neededForUsers = true;
#      };
#      rp = {
#        neededForUsers = true;
#      };
#    };
#  };  

  # Define a user account. Don't forget to set a password with ‘passwd’.

  users = { 
    mutableUsers = false;
    users = {
 #     root = {
 #       hashedPasswordFile = config.sops.secrets.rp.path;
 #     };  
      jwrhine = {
        isNormalUser = true;
        description = "John";
        extraGroups = [
          "wheel"
	  "docker"
	  "networkmanager"
	  "plugdev"
	  "tty"
          "video"
#	  config.users.groups.keys.name
        ];
	initialPassword = "MelissaCC1978!";
 #       hashedPasswordFile = config.sops.secrets.up.path;
        packages = with pkgs; [];
      };
    };
  };  

  system = {
    stateVersion = "23.11";
  };
}
