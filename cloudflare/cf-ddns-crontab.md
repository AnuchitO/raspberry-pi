# set update ddns on cloudflare record 

1. `crontab -e` then select IDE if needed. 
1.  add `*/1 * * * * /bin/bash /path/to/cf-ddns.sh` then save and exit (update every one minute)
1. `sudo systemctl restart cron`
1.  check the DNS record in Cloudflare https://dash.cloudflare.com/
