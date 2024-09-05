- go to raspberry pi
  `cat /etc/os-release`

```
PRETTY_NAME="Debian GNU/Linux 12 (bookworm)"
NAME="Debian GNU/Linux"
VERSION_ID="12"
VERSION="12 (bookworm)"
VERSION_CODENAME=bookworm
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
```

[install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-debian)

```bash
UBUNTU_CODENAME=jammy \
wget -O- \ "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" | sudo gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg \
echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/ansible.list \
sudo apt update && sudo apt install ansible
```

## pre-requisist

- add ssh-key from control node into all nodes
- [] enable PasswordAuthentication yes then systemctl restart sshd
- [] ssh-copy-id pi@cooba-1
- `ansible all -i inventory.yml -m ping`


location Debian wifi connection
```sh
/etc/NetworkManager/system-connections
```