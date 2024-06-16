# Usage

**NixOS**

`sudo ln -s ~/nix-config /etc/nixos/nix-config`

In `/etc/nixos/configuration.nix`:

```
imports =
    [ # Include the results of the hardware scan.
      <home-manager/nixos>
      ./hardware-configuration.nix
      ./nix-config/modules/nixos
      ./nix-config/homelab 
    ];
```

**Nix**
In `~/.config/home-manager/home.nix`:
```
imports = [
    ./nix-config/modules/home
]
```

# To do
## Desktop
### Browser
- [ ] Default browser
_Edit: can't do these with Google Chrome, only with Chromium. Defeats the purpose since I wanted my extensions to be shared across different OS's_
- [ ] Browser extensions
- [ ] Browser bookmarks
- [ ] Browser accounts
- [ ] setup Firefox and sync-server to be able to do all this

### Terminal
- [ ] Gruvbox theme
- [ ] tmux keybindings
   - https://github.com/christoomey/vim-tmux-navigator
- [ ] open on startup

## Vim
### Intellisense
- [ ] MD
- [x] Nix
- [ ] C++
    - clion?
- [ ] Python

## Homelab
- [ ] Password manager
    - having trouble trying to get SSL certificate to work
- [ ] Storage
- [x] VPN (Tailscale)
    - https://www.ethanmad.com/post/jellyfin_remote_access/ -- how to login using nix?
    - e.g. https://tailscale.com/blog/nixos-minecraft
- [ ] Wake on LAN
    - [x] nixos configuration
    - [x] nixos firewall rule for udp 9
    - [x] BIOS resume pcie device enabled
    - [ ] router broadcast address enabled? 
        - not sure if the Telstra Smart Modem 3 supports broadcast address
- [ ] DNS
- [ ] Fix torrented movies crashing / data loss
    - frequently happens not just with jellyfin but also vlc... must be something with the downloaded files. Seems to be consistent with 'The Boys'

## Nix
- [ ] Hydra
- [ ] Oracle Cloud / ARDC Nectar VMs
- [ ] Pin nixpkgs
- [ ] Multiple Host configuration
- [ ] fix mount hdd on boot

### Home-manager
- [ ] default sleep time

# Misc
- [ ] Monitor setups
