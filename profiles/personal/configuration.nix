# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ lib, ... }:
{
  imports =
    [ ../basic/configuration.nix # Personal is essentially work system + games
      ../devops/configuration.nix

    ]; # ++ lib.optional (builtins.pathExists ./secrets.nix) ./secrets.nix;
    
}
