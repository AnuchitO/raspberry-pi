
### Generate and Distribute SSH Keys

In this section you will generate and distribute an SSH keypair to all machines. Run the following commands from the `jumpbox` machine.

Generate a new SSH key:

```bash
ssh-keygen
```

```text
Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa): 
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /root/.ssh/id_rsa
Your public key has been saved in /root/.ssh/id_rsa.pub
```

Copy the SSH public key to each machine:

```bash
while read IP FQDN HOST SUBNET; do 
  ssh-copy-id root@${IP}
done < machines.txt
```

Once each key is added, verify SSH public key access is working:

```bash
while read IP FQDN HOST SUBNET; do 
  ssh -n root@${IP} uname -o -m
done < machines.txt
```

```text
aarch64 GNU/Linux
aarch64 GNU/Linux
aarch64 GNU/Linux
```
