# Docker image for Proxmoz Vitual Environment

This image install vma and lzop image utils to manipulate Proxmox backups without a Proxmox VE machine.

Debian packages are installed from official repositories.

## Usage

```
docker run --rm -it -v /pve_backup_path:/pve -v /raw_img_dst:/dst fradelg/pve lzop -dc /pve/my_backup.vma.lzo | vma extract -v /dst/data -
```
