# shodan_cert_finder
Simple script that grabs serial number from desired host and searches for that serial on shodan

## usage 
How to run the script
```
bash shodan_cert_finder.sh shodan.io
```
Example output
```
root@kali:~# bash shodan_cert_finder.sh shodan.io
SERIAL: 99C1A887DFEFC558692F64B4E2F37E96
104.25.90.97    443     Cloudflare
104.25.89.97    443     Cloudflare
2606:4700:20::6819:5a61 443
2400:cb00:2048:1::6819:5a61     2083
2400:cb00:2048:1::6819:5961     443
```
Output returns 4 columns:
ip, port, organization and hostname(s) if they exist

## requirements 
```
pip install shodan 
shodan init <your api key>
```

  
More information about [shodan's cli interface](https://cli.shodan.io/)
