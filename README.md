# ADDD
### Small script for adding domain names and their IPs in '/etc/hosts' and deleting old entries.

Usage as root permissions:
```bash
addd.sh <ip> <domain name>
```
```
addd.sh --clean
```
# Features:
- When run for the first time, the script makes a backup copy of the original '/etc/hosts' file with the extension .old.
- The script checks if the IP entered in the '/etc/hosts' file exists with another domain name. 
- Each time a new entry is entered, the script checks if the domain IP exists, and if it does, it adds the new domain name to the line with the existing IP.
- The --clean option removes all existing domains under the '# Others' line of the /etc/hosts file.

# Examples:
```
addd.sh 10.10.10.50 contoso.com
```

- This line adds the domain 'contoso.htb' to the IP above in the same line.
```
addd.sh 10.10.10.50 contoso.htb
```
# Assign execute permissions before use:
```bash
chmod +x addd.sh
```
