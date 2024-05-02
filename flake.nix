{
    
  #---------------------------------------------------------------------
  # Insan&moR - moreira
  # 10/04/24
  # My personal NIXOS KDE configuration 
  # 
  #              ¯\_(ツ)_/¯
  #   ███▄    █     ██▓   ▒██   ██▒    ▒█████       ██████ 
  #   ██ ▀█   █    ▓██▒   ▒▒ █ █ ▒░   ▒██▒  ██▒   ▒██    ▒ 
  #  ▓██  ▀█ ██▒   ▒██▒   ░░  █   ░   ▒██░  ██▒   ░ ▓██▄   
  #  ▓██▒  ▐▌██▒   ░██░    ░ █ █ ▒    ▒██   ██░     ▒   ██▒
  #  ▒██░   ▓██░   ░██░   ▒██▒ ▒██▒   ░ ████▓▒░   ▒██████▒▒
  #  ░ ▒░   ▒ ▒    ░▓     ▒▒ ░ ░▓ ░   ░ ▒░▒░▒░    ▒ ▒▓▒ ▒ ░
  #  ░ ░░   ░ ▒░    ▒ ░   ░░   ░▒ ░     ░ ▒ ▒░    ░ ░▒  ░ ░
  #     ░   ░ ░     ▒ ░    ░    ░     ░ ░ ░ ▒     ░  ░  ░  
  #           ░     ░      ░    ░         ░ ░           ░  
  # 
  #---------------------------------------------------------------------
  description = "Flake of Insan&moR";

  outputs = inputs@{ self, ... }:
    let
      # ---- SYSTEM SETTINGS ---- #
      systemSettings = {
        system = "x86_64-linux";            # system arch
        hostname = "dragon-nbk";            # hostname
        profile = "personal";               # select a profile defined from my profiles directory
        timezone = "America/Sao_Paulo";     # select timezone
        locale = "pt_BR.UTF-8";             # select locale
        bootMode = "uefi";                  # uefi or bios
        bootMountPath = "/boot";            # mount path for efi boot partition; only used for uefi boot mode
        grubDevice = "";                    # device identifier for grub; only used for legacy (bios) boot mode
      };

      # ----- USER SETTINGS ----- #
      userSettings = rec {
        username = "ins";                                             # username
        name = "moreira";                                             # name/identifier
        email = "moreira@zaia.com.br";                                # email (used for certain configurations)
        dotfilesDir = "~/.dotfiles";                                  # absolute path of the local repo
        theme = "uwunicorn-yt";                                       # selcted theme from my themes directory (./themes/)
        wm = "hyprland";                                              # Selected window manager or desktop environment; must select one in both ./user/wm/ and ./system/wm/
        # window manager type (hyprland or x11) translator
        wmType = if (wm == "hyprland") then "wayland" else "x11";
        browser = "brave";                                            # Default browser; must select one from ./user/app/browser/
        defaultRoamDir = "Personal.p";                                # Default org roam directory relative to ~/Org
        term = "alacritty";                                           # Default terminal command;
        font = "Intel One Mono";                                      # Selected font
        fontPkg = pkgs.intel-one-mono;                                # Font package
        editor = "nvim";                                               # Default editor;
        # editor spawning translator
        # generates a command that can be used to spawn editor inside a gui
        # EDITOR and TERM session variables must be set in home.nix or other module
        # I set the session variable SPAWNEDITOR to this in my home.nix for convenience
        spawnEditor = if (editor == "emacsclient") then
                        "emacsclient -c -a 'emacs'"
                      else
                        (if ((editor == "vim") ||
                             (editor == "nvim") ||
                             (editor == "nano")) then
                               "exec " + term + " -e " + editor
                         else
                           editor);
      };

      # create patched nixpkgs
      nixpkgs-patched =
        (import inputs.nixpkgs { system = systemSettings.system; }).applyPatches {
          name = "nixpkgs-patched";
          src = inputs.nixpkgs;
          patches = [ ];
        };

      # configure pkgs
      # use nixpkgs if running a server (homelab or worklab profile)
      # otherwise use patched nixos-unstable nixpkgs
      pkgs = (if ((systemSettings.profile == "homelab") || (systemSettings.profile == "worklab"))
              then
                pkgs-stable
              else
                (import nixpkgs-patched {
                  system = systemSettings.system;
                  config = {
                    allowUnfree = true;
                    allowUnfreePredicate = (_: true);
                  };
                  overlays = [ inputs.rust-overlay.overlays.default ];
                }));

      pkgs-stable = import inputs.nixpkgs-stable {
        system = systemSettings.system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };
      };

      # configure lib
      # use nixpkgs if running a server (homelab or worklab profile)
      # otherwise use patched nixos-unstable nixpkgs
      lib = (if ((systemSettings.profile == "homelab") || (systemSettings.profile == "worklab"))
             then
               inputs.nixpkgs-stable.lib
             else
               inputs.nixpkgs.lib);

      # use home-manager-stable if running a server (homelab or worklab profile)
      # otherwise use home-manager-unstable
      home-manager = (if ((systemSettings.profile == "homelab") || (systemSettings.profile == "worklab"))
             then
               inputs.home-manager-stable
             else
               inputs.home-manager-unstable);

      # Systems that can run tests:
      supportedSystems = [ "aarch64-linux" "i686-linux" "x86_64-linux" ];

      # Function to generate a set based on supported systems:
      forAllSystems = inputs.nixpkgs.lib.genAttrs supportedSystems;

      # Attribute set of nixpkgs for each system:
      nixpkgsFor =
        forAllSystems (system: import inputs.nixpkgs { inherit system; });

    in {

      homeConfigurations = {
        user = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix") # load home.nix from selected PROFILE
            #./profiles/personal/secrets.nix
            # insConfigs./default.nix
            # inputs.plasma-manager.homeManagerModules.plasma-manager
            # inputs.plasma-manager-mcdonc.homeManagerModules.plasma-manager
            # inputs.nix-flatpak.homeManagerModules.nix-flatpak # Declarative flatpaks
          ];
          extraSpecialArgs = {
            # pass config variables from above
            inherit pkgs-stable;
            inherit systemSettings;
            inherit userSettings;
            inherit inputs;
          };
        };
      };
      nixosConfigurations = {
        system = lib.nixosSystem {
          system = systemSettings.system;
          modules = [
            (./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")
            environment.systemPackages = [alejandra.defaultPackage.${system}]
          ]; # load configuration.nix from selected PROFILE
          specialArgs = {
            # pass config variables from above
            inherit pkgs-stable;
            inherit systemSettings;
            inherit userSettings;
            inherit inputs;
          };
        };
      };

      packages = forAllSystems (system:
        let pkgs = nixpkgsFor.${system};
        in {
          default = self.packages.${system}.install;

          install = pkgs.writeShellApplication {
            name = "install";
            runtimeInputs = with pkgs; [ git ]; # I could make this fancier by adding other deps
            text = ''${./install.sh} "$@"'';
          };
        });

      apps = forAllSystems (system: {
        default = self.apps.${system}.install;

        install = {
          type = "app";
          program = "${self.packages.${system}.install}/bin/install";
        };
      });

    };

  inputs = {

    # submodule = {
    #   url = "ssh://git@github.com:insanemor/dconf-clientes.git?submodules=1";
    #   #path = ./profile/clientes;
    #   flake = false;
    # };

    #dconf-insanemor = "path:/home/ins/dconf/clientes";
    dconf-insanemor = {
      url = "git+file:/home/ins/dconf/clientes?shallow=1";
      flake = false;
    };

    # ssh-git-example = {
    #   url = "git+ssh://git@github.com/insanemor/dconf-clientes.git?shallow=1";
    #   flake = false;
    # };

    # bar = {
    #   url = "github:insanemor/dconf-clientes/main";
    #   flake = false;
    # };

    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-23.11";

    home-manager-unstable.url = "github:nix-community/home-manager/master";
    home-manager-unstable.inputs.nixpkgs.follows = "nixpkgs";

    home-manager-stable.url = "github:nix-community/home-manager/release-23.11";
    home-manager-stable.inputs.nixpkgs.follows = "nixpkgs-stable";

    rust-overlay.url = "github:oxalica/rust-overlay";

    blocklist-hosts = {
      url = "github:StevenBlack/hosts";
      flake = false;
    };

    stylix.url = "github:danth/stylix";

    # plasma-manager = {
    #   url = "github:pjones/plasma-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.home-manager.follows = "home-manager-stable";
    # };

    plasma-manager = {
      url = "github:mcdonc/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager-stable";
    };


    alejandra.url = "github:kamadorueda/alejandra/3.0.0";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";


  };

}
