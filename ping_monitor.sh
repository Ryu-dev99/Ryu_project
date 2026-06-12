#!/bin/bash
# Continuous Network Ping Monitor Utility

echo "========================================="
echo "       NETWORK PING MONITOR ENGINE       "
echo "========================================="

# Target host to monitor (Google Public DNS)
TARGET="8.8.8.8"
COUNT=5
INTERVAL=1

echo -e "\n[1] Monitoring connection stability to $TARGET..."
echo " -> Running $COUNT test probes with $INTERVAL second intervals..."
echo "-----------------------------------------"

# Run loop to monitor ping
for ((i=1; i<=COUNT; i++))
do
    PING_RES=$(ping -c 1 -W 2 $TARGET 2>/dev/null | grep 'time=' | awk -F 'time=' '{print $2}')
    
    if [ -z "$PING_RES" ]; then
        echo " Probe $i/$COUNT: [TIMEOUT] - Connection dropped or high latency!"
    else
        echo " Probe $i/$COUNT: Connected - Latency: $PING_RES"
    fi
    sleep $INTERVAL
done

echo "-----------------------------------------"
echo " -> Monitoring session complete."
echo "========================================="
