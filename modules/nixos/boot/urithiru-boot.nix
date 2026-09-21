{pkgs, ...}: 

{
  boot = {
    loader = {
      grub = {
        enable = true;
        device = "/dev/sdb";
        useOSProber = true;
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
