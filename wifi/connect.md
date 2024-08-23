## Connect to WiFi via command line

## Brief:
- `sudo raspi-config`
- select **System Options**
- select **Wireless LAN      Enter SSID and passphrase**
- enter wifi SSID
- enter wifi password
- verify using command `iwconfig wlan0`
- find the ip by using command `ifconfig`

# step 1:

```bash
sudo raspi-config
```

## step 2:

select **1 System Options       Configure system settings**
 
```bash
Raspberry Pi 5 Model B Rev 1.0, 8GB
┌──────────────────────────────────┤ Raspberry Pi Software Configuration Tool (raspi-config) ├───────────────────────────────────┐
│                                                                                                                                │
│                                1 System Options       Configure system settings                                                │
│                                2 Display Options      Configure display settings                                               │
│                                3 Interface Options    Configure connections to peripherals                                     │
│                                4 Performance Options  Configure performance settings                                           │
│                                5 Localisation Options Configure language and regional settings                                 │
│                                6 Advanced Options     Configure advanced settings                                              │
│                                8 Update               Update this tool to the latest version                                   │
│                                9 About raspi-config   Information about this configuration tool                                │
│                                                                                                                                │
│                                                                                                                                │
│                                                                                                                                │
│                                                                                                                                │
│                                                                                                                                │
│                                     <Select>                                     <Finish>                                      │
│                                                                                                                                │
└────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

## step 3:

 select **S1 Wireless LAN      Enter SSID and passphrase**

```bash
┌──────────────────────────────────┤ Raspberry Pi Software Configuration Tool (raspi-config) ├───────────────────────────────────┐
│                                                                                                                                │
│                                S1 Wireless LAN      Enter SSID and passphrase                                                  │
│                                S2 Audio             Select audio out through HDMI or 3.5mm jack                                │
│                                S3 Password          Change password for the 'anuchito' user                                    │
│                                S4 Hostname          Set name for this computer on a network                                    │
│                                S5 Boot / Auto Login Select boot into desktop or to command line                                │
│                                S6 Splash Screen     Choose graphical splash screen or text boot                                │
│                                S7 Power LED         Set behaviour of power LED                                                 │
│                                S8 Browser           Choose default web browser                                                 │
│                                                                                                                                │
│                                                                                                                                │
│                                                                                                                                │
│                                                                                                                                │
│                                                                                                                                │
│                                     <Select>                                     <Back>                                        │
│                                                                                                                                │
└────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

## step 4:

enter wifi SSID 

```bash

                                   ┌──────────────────────────────────────────────────────────┐
                                   │ Please enter SSID                                        │
                                   │                                                          │
                                   │ AnuchitO_2.4G___________________________________________ │
                                   │                                                          │
                                   │                                                          │
                                   │                                                          │
                                   │                                                          │
                                   │                                                          │
                                   │                                                          │
                                   │                                                          │
                                   │                                                          │
                                   │                                                          │
                                   │                                                          │
                                   │                                                          │
                                   │                                                          │
                                   │                                                          │
                                   │              <Ok>                  <Cancel>              │
                                   │                                                          │
                                   └──────────────────────────────────────────────────────────┘
```

## step 5:

enter wifi password

```bash
                                   ┌──────────────────────────────────────────────────────────┐
                                   │ Please enter passphrase. Leave it empty if none.         │
                                   │                                                          │
                                   │ **********______________________________________________ │
                                   │                                                          │
                                   │                                                          │
                                   │                                                          │
                                   │                                                          │
                                   │                                                          │
                                   │                                                          │
                                   │                                                          │
                                   │                                                          │
                                   │                                                          │
                                   │                                                          │
                                   │                                                          │
                                   │                                                          │
                                   │                                                          │
                                   │              <Ok>                  <Cancel>              │
                                   │                                                          │
                                   └──────────────────────────────────────────────────────────┘
```

## step 6: 
it will come back to **Raspberry Pi Software Configuration Tool (raspi-config)** page
the select **<Finish>**

## step 7: 
verify using command `iwconfig wlan0`

```bash
wlan0     IEEE 802.11  ESSID:"AnuchitO_2.4G"
          Mode:Managed  Frequency:2.412 GHz  Access Point: 44:F9:71:6C:4A:E2
          Bit Rate=11 Mb/s   Tx-Power=31 dBm
          Retry short limit:7   RTS thr:off   Fragment thr:off
          Encryption key:off
          Power Management:on
          Link Quality=45/70  Signal level=-65 dBm
          Rx invalid nwid:0  Rx invalid crypt:0  Rx invalid frag:0
          Tx excessive retries:0  Invalid misc:0   Missed beacon:0
```

see the ip by using command `ifconfig`

```bash
wlan0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.1.110  netmask 255.255.255.0  broadcast 192.168.1.255
        inet6 fe80::9da:c020:78b7:df38  prefixlen 64  scopeid 0x20<link>
        ether 2c:cf:67:3e:62:57  txqueuelen 1000  (Ethernet)
        RX packets 171  bytes 33540 (32.7 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 89  bytes 10568 (10.3 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```
