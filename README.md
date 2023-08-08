# ADDD
### Small script for adding domain names and their IPs in /etc/hosts and delete old entries.

Usage:
```bash
addd.sh <ip> <domain name>
```
```
addd.sh --clean
```
Examples:
```
addd.sh 10.10.10.50 contoso.com
```

- This adds the domain 'contoso.htb' to the IP above in the same line.
```
addd.sh 10.10.10.50 contoso.htb
```

-------

Assign execute permissions before use:
```bash
chmod +x addd.sh
```
