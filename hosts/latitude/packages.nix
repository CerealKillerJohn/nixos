{ config, pkgs, lib, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      acpi
      arc-theme
      breeze-plymouth
      brightnessctl
#      (callPackage ../../packages/bar-protonmail/bar-protonmail.nix {})
      (callPackage ../../packages/boxbuddyrs/boxbuddyrs.nix {})
      distrobox
      espanso-wayland
      feh
      fractal
      gimp
      glib
      ifuse
      jq
      killall
      libimobiledevice
      libnotify
      lm_sensors
      mpv
      nix-ld
      obs-studio
      parsec-bin
      # fix nix package count for nitch
      #(pkgs.nitch.overrideAttrs (o: {
      #  patches = (o.patches or []) ++ [../../overlays/nitch-nix-pkgs-count.patch];
      #}))
      pkgs.python311Full
      plymouth
      ranger
      spotify
      spotifywm
      swappy
      usbmuxd
      wl-clipboard
      wlogout
      wlr-randr
      wofi
      zoom-us
      ];
  };
}
