{pkgs, user, ...}:

{
  programs = {
    firefox= {
      enable = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
      profiles = {
        ${user} = {
          settings = {
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          };
            userChrome = ''
              @namespace url(http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul);
              #navigator-toolbox {
                height: 0px !important;
                min-height: 0px !important;
                overflow: hidden !important;
              }

              #navigator-toolbox:focus,
              #navigator-toolbox:focus-within,
              #navigator-toolbox:active {
                height: auto !important;
                overflow: visible !important;
              }
            '';
        };
      };
    };
  };
}
