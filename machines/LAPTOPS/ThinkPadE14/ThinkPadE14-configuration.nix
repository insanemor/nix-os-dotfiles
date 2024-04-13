# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

#------------------ LENOVO_MT_20RB_BU_SMB_FM_ThinkPad E14 ------------------------

# MODEL             ThinkPad E14 Gen 5 14" Intel 20RBS81L00
# CPU               Intel Core i7 (10th Gen) 10510U / 1.8 GHz
# GPU               Intel UHD Graphics
# RAM               8 GB (1 x 8 GB) DDR4 SDRAM
# SATA              256 GB SSD M.2 2242 PCIe 3.0 x2 - Western Digital
# BLUE-TOOTH        Bluetooth 5.0, 802.11a/b/g/n/ac/ax
# NETWORK           Intel Wi-Fi 6 AX201 (11ax, 2x2)
# CERTIFIED         Windows 10 Home 64-bit Edition, Fedora, Linux, Ubuntu
# MOTHERBOARD       Intel SoC (System on Chip) platform
# SOURCE            [ThinkPad E14 Gen 5 14" Intel]
#                   (https://www.produtodetalhado.com.br/pn/xvw-lenovo-thinkpad-e14-20rb-5#ficha%20t%C3%A9cnica)

#---------------------------------------------------------------------

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/5417613e-dea5-44de-a6af-136d7317af89";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/C96B-8A2A";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/9f22d08c-74e2-43e5-9f01-182280bafc70"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp4s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlan0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
