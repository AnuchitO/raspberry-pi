# raspberry-pi

## list of devices in same network in unix
ARP, or Address Resolution Protocol, is a communication protocol that’s used for exploring the link layer address associated with a network layer address.
```sh
arp -a
```


# Experiment 1:
- use pocket Wi-Fi ZTE MU5002
- connnect raspberry pi 5 via Lan cabel
- use my laptop to connect pocker Wi-Fi
- use `arp -a` to find the pi IP address
- ssh into pi `ssh anuchito@192.168.0.14`
- it success.

note: I need to setup pi image with ssh key from my ssh-key laptop.
