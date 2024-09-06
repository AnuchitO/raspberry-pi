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

`ansible-playbook -i inventory.yml playbook.yml`

`for i in {1..254}; do nslookup 192.168.0.$i >> names.txt; done`
`for i in {1..254}; do ping -c 1 192.168.0.$i; done`

## steps setup

### mac to shifu

1. ssh to shifu then config tunnel `cloudflared`

### macair to all cooba

1. [No need] setup root password for all cooba and shifu # no need because sudo su without password working on pi
1. [Manual Once] enable shifu and all cooba by copy cooba/.ssh/authorized_keys to ~/.ssh/authorized_keys this file contain macair and shifu public key
1. `scp

1. copy public key from shifu to all cooba


### scan all ip

```bash
 nmap -v -sn 192.168.1.0/24 \
 | grep -vE "Starting|Scanning|Initiating|Completed|Host is up|host down|Nmap done" \
 | awk '{print $5}' | xargs -n1 nmap -p 22
```

note: nmap scan is faster than ping scan that me I can make steps faster by
1. use nmap to scan all ip in subnet
1. arp -a to get all ip in subnet
1. filter ip that is up
1. ssh to check hostname


```bash
while read IP FQDN HOST SUBNET; do
  ssh-copy-id pi@${IP}
done < machines.txt
```

1. copy `~/.ssh/authorized_keys` into `/root/.ssh/authorized_keys` in each cooba pi
