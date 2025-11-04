{ hostName, ...}: {
    networking = {
        computerName = hostName;
        hostName = hostName;
        localHostName = hostName;
    };
}