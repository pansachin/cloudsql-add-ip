#!/bin/bash

# Parse flags
while getopts ":hi:p:" opt; do
  case $opt in
    h)
      echo "Usage: ./add-ips.sh -i <instance> -p <project>"
      echo "-i - CloudSQL instance name"
      echo "-p - GCP Project name"
      echo "-h - Help"
      exit 1
    ;;
    i) instance="$OPTARG"
    ;;
    p) project="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

# Validate flags
if [ -z "$instance" ] || [ -z "$project" ]; then
  echo "Usage: ./add-ips.sh -i <instance> -p <project>"
  echo "Run ./add-ips.sh -h for help"
  exit 1
fi

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
gcloud sql instances patch $instance --authorized-networks=$ip --project=$project