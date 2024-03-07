# cloudsql-add-ip
Add Grafana Hosted Allowlist IP's to CloudSQL Secure Networking

GCP Cloud SQL instance needs to know clients' IPs in order to make a secure connection b/w client and db. Grafana Cloud offers a range of IPs which could be tedious to add manually. Having a script to add IPs to Cloud SQL will help us avoid repetitive work as same problem can occur for other projects as well. This script will add Hosted Grafana allowlist IPs to CloudSQL instance secure connection.

## Steps
1. Clone the repo in local
```bash
git clone git@github.com:pansachin/cloudsql-add-ip.git
```

2. Give execute permission to file
```bash
chmod +x add-ips.sh
```

3. Run the script by passing instance name and project-name
```bash
./add-ips.sh -i <instance-name> -p <project-name>
```

4. Example
```bash
./add-ips.sh -i sample -p pantheon-sample
```

5 Help
```bash
./add-ips.sh -h
```
