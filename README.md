# cloudsql-add-ip
Add Grafana Hosted Allowlist IP's to CloudSQL Secure Networking

## Steps
1. Copy the script to local machine and save it to a file.
  Lets call the file as add-ips.sh

2. Give execute permission to file
```bash
chmod +x add-ips.sh
```

3. Run the script by passing instance name and project-name
```bash
./add-ips.sh <instance-name> <project-name>
```

4. Example
```bash
./add-ips.sh sample pantheon-sample
```
