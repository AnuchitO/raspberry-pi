# Cloudflrae Tunnesls 

allow to access local network without require public IP

## Using Cloudflare Dashboard
[Create a remotely-managed tunnel](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/get-started/create-remote-tunnel/)

## Using Cloudflare CLI

on raspberry pi machines:

1. install `cloudflared` [Windows, MacOS, Linux](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/get-started/create-local-tunnel/#1-download-and-install-cloudflared)
1. `cloudflared tunnel login`  แนะนำให้ copy link แล้ว login  ผ่าน browser ง่ายกว่า
1. `cloudflared tunnel create <NAME>` e.g. `cloudflared tunnel create ssh.example.com`


Edit public hostname for ashram

Public hostname
Subdomain
`ssh`

Domain(Required)
`example.com`

Service
Type(Required)

`SSH://` URL(Required) `localhost:22`

on raspberry pi 
`cloudflared tunnel --hostname ashram.anuchito.com --url ssh://localhost:22`


on client machine
`ssh pi@ssh.example.com`  อันนี้ถือว่า ssh ใช้ได้อยู่แล้้ว และเคยตั้งค่า ssh key ใส่ใน `~/.ssh/authorized_keys` แล้ว

สำเร็จ


คราวนี้มาตั้งค่าให้ cloudflared tunnel รันอัตโนมัติ ตอนเปิดเครื่อง 
[Configure cloudflared as a service](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/configure-tunnels/local-management/as-a-service/linux/#1-configure-cloudflared-as-a-service)

```/home/pi/.cloudflared/config.yml
url: ssh://localhost:22
tunnel: <Tunnel-UUID>
credentials-file: /home/pi/.cloudflared/<Tunnel-UUID>.json
```

check status tunnel 
```bash
cloudflared tunnel info ssh
```

```bash
cloudflared tunnel route dns ssh ssh.example.com
```

open tunnel connection on raspberry pi
```bash
cloudflared tunnel run ashram
```

connect throught tunnel from client machine
```bash
ssh pi@ssh.example.com
```


## install cloudflared in service for linux
```bash
cloudflared --config /etc/cloudflared/config.yml service install
```

```/home/pi/.cloudflared/<Tunnel-UUID>.json
{"AccountTag":"accountID","TunnelSecret":"secret tunnel token","TunnelID":"Tunnel-UUID"}
```

start cloudflared tunnel on boot os
```bash
 systemctl enable cloudflared
```
