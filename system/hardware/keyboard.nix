{ pkgs, ... }:

{
  services.xserver = {
    autoRepeatDelay = 600;
    autoRepeatInterval = 25;
    layout = "br";
    xkb = {
        Variant = "thinkpad";
        xkbModel = "thinkpadz60";
    };
  };

  console.useXkbConfig = true;
}