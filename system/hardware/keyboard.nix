{ pkgs, ... }:

{
  services.xserver = {
    autoRepeatDelay = 600;
    autoRepeatInterval = 25;
    
    xkb = {
      layout = "br";
      variant = "thinkpad";
      model = "thinkpadz60";
    };
  };

  console.useXkbConfig = true;
  #console.keyMap = "br";
}