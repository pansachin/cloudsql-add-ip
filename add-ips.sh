#!/bin/bash

# Get Hosted Grafana ip's
grafana_ips=$(curl -s https://grafana.com/api/hosted-grafana/source-ips.txt)
echo "Hosted Grafana IP's: $grafana_ips"

## Save it to a file
echo "$grafana_ips" > ./grafana_ips.txt

# Read line by line from file
ip=""
while IFS= read -r line
do
  # Append ip to variable
    ip="$ip$line,"
done < ./grafana_ips.txt

# Trim last comma
ip=${ip%?}

## Print ip's
echo "IP's: $ip"

# Add ip's to coudsql instance
gcloud sql instances patch $1 --authorized-networks=$ip --project=$2