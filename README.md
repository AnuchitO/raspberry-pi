# Raspberry Pi

## [Official Document](https://www.raspberrypi.com/documentation/)

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



# `vcgencmd` check status

```
vcgencmd get_throttled
```
[CPU Throttled](https://www.raspberrypi.com/documentation/computers/os.html#get_throttled)

will give us important information on throttling status, which is a direct consequence of an Undervoltage issue.
The command will return us a value that summarizes both the current and historical status (from the last boot). Possible results are:

throttled=**0x0** -> this means a clean status, where voltage is ok
throttled=**0x50000** -> this means that throttling happened at least 1 time from the boot, but now the voltage status is ok
throttled=**0x50005** -> this means that throttling happened at least 1 time from the boot, and the problem is currently active

The value near the “throttled=0x” string shown is the sum of the Hex Values from the previous table. For example, a value of 5005 is the sum of:
```
1 (Under-voltage detected)
4 (Currently throttled)
1000 (Under-voltage has occurred)
4000 (Throttling has occurred)
```



OFF the Raspberry Pi 5's power consumption
https://www.jeffgeerling.com/blog/2023/reducing-raspberry-pi-5s-power-consumption-140x
