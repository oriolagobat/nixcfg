# Nix-Darwin Configuration

This repository contains my Nix-Darwin configuration for managing macOS settings and packages using Nix.

## Code Location

The code should be placed in `/etc/nix-darwin`.

## Commands

### First time running this configuration

```bash
sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .#HOST  # Replace HOST with your machine's hostname
```

### Subsequent updates

```bash
sudo darwin-rebuild switch # Or use the switch alias defined in zsh.nix
```

### Build rpi image
#### ISO

```bash 
nix build .#<hostname>-sd-image
```

This will produce a `.img.zst` file in the `result/sd-image` directory.
To transform it into a `.iso` file, use:

```bash
nix run nixpkgs#zstd -- -d result/sd-image/<image>.img.zst
```

#### Rebuild it and flash it remotely
```bash
nix run nixpkgs#nixos-rebuild-ng -- \
  switch \
  --flake .#syl \
  --target-host syl \
  --sudo \
  --ask-sudo-password
```

### Fix linux builder errors:
```bash
sudo chown "$USER" /etc/nix/builder_ed25519
sudo chmod 600 /etc/nix/builder_ed25519
```


## TODOs

- [ ] Document
- [ ] Check on direnv
- [ ] Configure git signing
