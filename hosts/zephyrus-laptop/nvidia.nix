{ pkgs, config, lib, ... }:

let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
in {

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ]; # or "nvidiaLegacy470 etc.

  environment.systemPackages = [ nvidia-offload ];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.

    package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "550.120";
      sha256_64bit = "sha256-gBkoJ0dTzM52JwmOoHjMNwcN2uBN46oIRZHAX8cDVpc=";
      sha256_aarch64 = "sha256-dzTEUuSIWKEuAMhsL9QkR7CCHpm6m9ZwtGSpSKqwJdc=";
      openSha256 = "sha256-O3OrGGDR+xrpfyPVQ04aM3eGI6aWuZfRzmaPjMfnGIg=";
      settingsSha256 = "sha256-fPfIPwpIijoUpNlAUt9C8EeXR5In633qnlelL+btGbU=";
      persistencedSha256 =
        "sha256-ztEemWt0VR+cQbxDmMnAbEVfThdvASHni4SJ0dTZ2T4=";
    };
  };
}
