
```bash
mkdir cloudflare-ddns
cd cloudflare-ddns
curl -o cf-ddns-update.sh https://raw.githubusercontent.com/AnuchitO/cloudflare-ddns-updater/main/cloudflare-template.sh
chmod +x cf-ddns-update.sh
```

Go to Cloudflare.com

go to your domain
https://dash.cloudflare.com/profile/api-tokens
auth_email=""                                       # The email used to login 'https://dash.cloudflare.com'
auth_method="global"                                 # Set to "global" for Global API Key or "token" for Scoped API Token
auth_key=""                                         # Your API Token or Global API Key
zone_identifier=""                                  # Can be found in the "Overview" tab of your domain
record_name=""                                      # Which record you want to be synced
ttl=1                                               # Set the DNS TTL (seconds)  Time To Live (TTL) of the DNS record in seconds. Setting to 1 means 'automatic'. Value must be between 60 and 86400, with the minimum reduced to 30 for Enterprise zones.
proxy="true"                                       # Set the proxy to true or false
sitename=""                                         # Title of site "Example Site"


```bash
./cf-ddns-update.sh
```
