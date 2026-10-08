{pkgs, ...}: 

{
  boot = {
    loader = {
      grub = {
        enable = true;
        device = "/dev/disk/by-id/scsi-0QEMU_QEMU_HARDDISK_drive-scsi0";
        useOSProber = true;
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
