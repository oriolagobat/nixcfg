{
  tokendrain,
  ...
}: 
{
  imports = [
    tokendrain.nixosModules.tokendrain
  ];
  services.tokendrain = {
    enable = true;
    web = {
      listenAddress = "127.0.0.1";
      port = 8742;
      publicUrl = "https://tokendrain.home.agost.info";
    };
    concurrency = 2;
    auth = {
      mode = "none";
    };
    microvm = {
      hypervisor = "firecracker";
      defaults = {
        vcpus = 4;
        memoryMiB = 4096;
        diskGiB = 40;
      };
      networking.allowLan = false;
    };
    stateDirectory = "/data/tokendrain";
  };
}