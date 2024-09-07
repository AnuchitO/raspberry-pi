#!/bin/bash
HOSTFILE=/etc/hosts # need to run as root
DNS_LOCAL_FILE=./_dns_local.txt

# Define the section markers
start_marker="# pi cluster local"
end_marker="# end pi cluster local"

# Find the starting and ending line numbers of the section
start_line=$(grep -n "$start_marker" $HOSTFILE | cut -f1 -d:)
end_line=$(grep -n "$end_marker" $HOSTFILE | cut -f1 -d:)

# Check if the section exists
if [[ -z "$start_line" || -z "$end_line" ]]; then
    echo "Section not found."
    exit 1
fi

# Replace each line in the section with the new content
#sed -i "${start_line},${end_line}s/.*/#hello/" $HOSTFILE

# Delete line from start to end
sed -i.bak "${start_line},${end_line}d" $HOSTFILE

cat $DNS_LOCAL_FILE >> $HOSTFILE

echo "Section updated successfully."
