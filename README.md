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

## TODOs

- [ ] Document
- [ ] Check on direnv
- [ ] Check certificate management (security.pki)
- [ ] Install neovim properly
- [ ] Configure git signing
