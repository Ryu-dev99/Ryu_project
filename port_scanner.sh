#!/bin/bash
# Lightweight Local Port Scanner Utility

echo "========================================="
echo "       LIGHTWEIGHT PORT SCANNER          "
echo "========================================="

# Target definition (localhost for safe self-testing)
TARGET_HOST="127.0.0.1"
# Common network ports to test
PORTS=(80 443 8080 1080)

echo -e "\n[1] Scanning common ports on target: $TARGET_HOST..."
echo "-----------------------------------------"

for PORT in "${PORTS[@]}"
do
    # Test connection using bash internal TCP helper if available
    (echo > /dev/tcp/$TARGET_HOST/$PORT) >/dev/null 2>&1
    
    if [ $? -eq 0 ]; then
        echo " -> Port $PORT: OPEN / ACTIVE"
    else
        echo " -> Port $PORT: CLOSED / FILTERED"
    fi
done

echo "-----------------------------------------"
echo " Scan finished. Network security check complete."
echo "========================================="
