Vaultwarden Admin UI needs a .env file with the ADMIN_TOKEN set. 
The ADMIN_TOKEN is the argon2id hash of your master password.

.gitignore includes .env, so make your own file.

Make sure ports 80 & 443 are open in firewall

Router Port Forwarding Rules
| Protocol | WAN port | LAN port |
| ----------- | ----------- | ----------- |
| TCP | 80 | 80 |
| TCP | 443 | 443 |

Port 8222 is vaultwarden
Port 80 is for nginx
Port 443 is for https
