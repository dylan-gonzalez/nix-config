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
- [ ] gnome-terminal profile config

## Vim
### Intellisense
- [ ] MD
- [x] Nix
- [ ] C++
    - clion?
- [ ] Python

## Homelab
- [x] Password manager
- [ ] better way to remember master password / access -- for Vaultwarden and PC
- [ ] Storage
- [x] VPN (Tailscale)
    - https://www.ethanmad.com/post/jellyfin_remote_access/ -- how to login using nix?
    - e.g. https://tailscale.com/blog/nixos-minecraft
- [ ] Wake on LAN
    - [x] nixos configuration
    - [x] nixos firewall rule for udp 9
    - [x] BIOS resume pcie device enabled
    - [ ] router broadcast address enabled? 
        - don't think Telstra Smart modem 3 supports broadcast address?
        - don't think Telstra smart modem 3 supports ARP table entries to bypass this ^
        - jump server?
- [x] DNS
    - [x] add new DNS records for: jellyfin.dylangonzalez.dev, vault.dylangonzalez.dev. Then add these as new virtual hosts for nginx.
- [ ] Fix torrented movies crashing / data loss
    - frequently happens not just with jellyfin but also vlc... must be something with the downloaded files. Seems to be consistent with 'The Boys'
- [ ] fix errors on harddrive disk (to allow to mount on boot)
- [x] Services Page
    - [x] point www.dylangonzalz.dev to this page
- [x] [paperless-ngx](https://github.com/paperless-ngx/paperless-ngx)
- [ ] torrenting request page using transmission
- [ ] start transmission-daemon on startup
- [ ] fix `mv` operation taking up 100% storage on mounted disk
   - after running `du` on /mnt/hdd, only 81G are taken up by /mnt

## Nix
- [ ] Hydra
- [ ] Oracle Cloud / ARDC Nectar VMs
- [ ] Pin nixpkgs
- [ ] Multiple Host configuration

### Home-manager
- [ ] default sleep time

# Misc
- [ ] Monitor setups
