# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/833bd6b9-6f23-4537-b129-58e977ffe5d8";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/2DAE-57A1";
      fsType = "vfat";
    };

  fileSystems."/home" =
    {
      device = "/dev/disk/by-uuid/8a3c9db6-e9c3-496f-9316-bdc0fa7e29eb";
      fsType = "ext4";
    };

  fileSystems."/ai" =
    {
      device = "/dev/disk/by-uuid/BA5EBD5B5EBD115D";
      fsType = "ntfs-3g";
      options = [ "rw" "uid=1000" ];
    };

  swapDevices = [{
    device = "/dev/disk/by-uuid/1b050d88-785a-4870-a53b-12d82ff75408";
  }];
}
