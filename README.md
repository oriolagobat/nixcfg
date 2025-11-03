# Commands

sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .#HOST
sudo darwin-rebuild switch

# TO DO in this configuration:

- [ ] Configure system with current defaults
- [ ] Set up homebrew
- [ ] Document
- [ ] Check on direnv
- [ ] Check certificate management (security.pki)
- [ ] Create justfile properly
- [ ] Document that it the code should live on /etc/nix-darwin
- [ ] Install neovim properly
- [ ] Configure git
- [ ] Configure git signing
- [X] Configure zsh
- [X] Add nix environment.pathsToLink = [ "/share/zsh" ]
