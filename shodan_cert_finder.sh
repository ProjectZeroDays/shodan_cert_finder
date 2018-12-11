#!/bin/bash
RESULTS_FILE="/tmp/serial_searcher"

if [ $# -eq 0 ]; then
    echo ""
    echo "please provide FQDN as an argument"
    echo ""
    echo "example: bash shodan_serial_searcher.sh www.google.com"
    echo ""
    exit 1
fi

SERIAL=$(openssl s_client -connect "$1":443 -servername "$1" < /dev/null 2>/dev/null | openssl x509 -serial -noout -in /dev/stdin | awk -F= '{print $2}' )
echo "SERIAL: $SERIAL "
shodan search --fields ip_str,port,org,hostnames ssl.cert.serial:"$SERIAL" > "$RESULTS_FILE"
cat "$RESULTS_FILE"
rm "$RESULTS_FILE"
