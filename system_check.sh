#!/bin/bash
# Network and System Status Checker Utility

echo "========================================="
echo "   SYSTEM & NETWORK STATUS CHECKER       "
echo "========================================="

# 1. Check System Information
echo -e "\n[1] System Information:"
uname -a
uptime

# 2. Check Network Interfaces
echo -e "\n[2] Network Interfaces Status:"
if command -v ip &> /dev/null; then
    ip r | grep default
else
    ifconfig | grep -E "inet |status"
fi

# 3. Test Internet Latency
echo -e "\n[3] Testing Connectivity to Cloudflare DNS (1.1.1.1)..."
ping -c 3 1.1.1.1

echo -e "\n========================================="
echo " Check complete."
echo "========================================="
