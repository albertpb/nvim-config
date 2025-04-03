{ pkgs, username, ... }:
{
  #nixos-ai
  users.users.${username}.packages = with pkgs; [
    xclip
    polybar
    picom
    sxhkd
    rofi
    dunst
    feh
    lxappearance
    macchina
    glxinfo
  ];

  environment.systemPackages = with pkgs; [
    linuxPackages.nvidia_x11
  ];
}
