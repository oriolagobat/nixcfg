{ lib, ... }: {
  hardware.enableRedistributableFirmware = true;
  hardware.enableAllHardware = lib.mkForce false;
  system.stateVersion = "25.11";
}