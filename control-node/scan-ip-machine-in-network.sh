#!/bin/bash
DNS_LOCAL_FILE=_dns_local.txt
rm -rf $DNS_LOCAL_FILE

START_MAKER="# pi cluster local"
END_MAKER="# end pi cluster local"

iplan=192.168.0.0

# VERSION 3 fasted
# step 1: scan
nmap -v -sn $iplan/24 | grep -vE "Starting|Scanning|Initiating|Completed|Host is up|host down|Nmap done" &> /dev/null

# step 2: arp -1
arp_output=$(arp -a)

# MAC address to Hostname
declare -A mac_to_hostname

# TODO: add your MAC address to hostname mapping
mac_to_hostname["1a:ab:11:8b:89:2c"]="hostname-1"
mac_to_hostname["la:ab:11:8b:99:2d"]="hostname-2"

echo "$START_MAKER" >> $DNS_LOCAL_FILE
for mac in "${!mac_to_hostname[@]}"; do
#       ip=$(arp -a | grep $mac | awk '{print $2}' | tr -d '()')
        ip=$(echo "$arp_output" | grep -w "$mac" | awk '{print $2}' | tr -d '()')
        hn=${mac_to_hostname[${mac}]}
        printf "%-15s %-15s\n" "$ip" "$hn" >> $DNS_LOCAL_FILE
done
echo "$END_MAKER" >> $DNS_LOCAL_FILE

echo "done. check your $DNS_LOCAL_FILE content"
cat $DNS_LOCAL_FILE

#for i in {1..254}; do
   # VERSION 2
   #  myIP=192.168.0.$i
   #  ping -c 1 -s 8 -w 1 $myIP &> /dev/null
   #  if [ $? -eq 0 ]; then
   #      echo "FOUND: $myIP"
   #      hn=$(ssh -n -o ConnectTimeout=1 pi@$myIP hostname)
   #      if [[ -n "$hn" ]]; then
   #          echo "hostname: $hn"
   #          echo "$myIP       $hn" >> $NAME
   #      fi
   #  else
   #    echo "NOT FOUND $myIP"
   #  fi

    # VERSION 1
    # arp_output=$(arp -a $myIP)
    # if [[ "$arp_output" != *"incomplete"* && "$arp_output" != *"no match"* ]]; then
    #     echo "FOUND: $arp_output"
    #     hn=$(ssh -n -o ConnectTimeout=1 pi@$myIP hostname)
    #     if [[ -n "$hn" ]]; then
    #         echo "hostname: $hn"
    #         echo "$myIP       $hn" >> $NAME
    #     fi
    # else
    #   echo "NOT FOUND $myIP"
    # fi
#done
