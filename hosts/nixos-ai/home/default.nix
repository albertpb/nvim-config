{ inputs, username, ... }:
{
  imports = [
    (import ./../../../modules/core/programs)
  ] ++ [ (import ./vscodium.nix) ]
  ++ [ (import ./rofi.nix) ]
  ++ [ (import ./git.nix) ]
  ++ [ (import ./dunst.nix) ]
  ++ [ (import ./picom.nix) ]
  ++ [ (import ./polybar.nix) ]
  ++ [ (import ./sxhkd.nix) ]
  ++ [ (import ./bashrc.nix) ];
}
