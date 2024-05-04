{pkgs, ...}: {
  home.packages = with pkgs; [
    tuckr
  ];
}
