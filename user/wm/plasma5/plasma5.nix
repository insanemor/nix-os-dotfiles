{ pkgs, plasma-manager, ... }:
{
  home.stateVersion = "23.11";

  imports = [
    ./output-plasma5.nix
  ];

  programs.plasma = {
    enable = true;

    #
    # Some high-level settings:
    #
    workspace = {
      clickItemTo = "select";
      lookAndFeel = "org.kde.breezedark.desktop";
      cursorTheme = "Bibata-Modern-Ice";
      iconTheme = "Papirus-Dark";
    };


    panels = [
      # Windows-like panel at the bottom
      {
        location = "bottom";
        widgets = [
          "org.kde.plasma.kickoff"
          # We can also configure the widgets. For example if you want to pin
          # konsole and dolphin to the task-launcher the following widget will
          # have that.
          {
            name = "org.kde.plasma.icontasks";
            config = {
              General.launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:org.kde.konsole.desktop"
                "applications:firefox.desktop"
                "applications:code.desktop"

              ];
            };
          }
          "org.kde.plasma.marginsseperator"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];
        hiding = "autohide";
      }
      # Global menu at the top
      {
        location = "top";
        height = 26;
        widgets = [
          "org.kde.plasma.appmenu"
        ];
      }
    ];

  };
  
}