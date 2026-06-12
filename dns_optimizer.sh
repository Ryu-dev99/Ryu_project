#!/bin/bash
# Network Optimization and DNS Switcher Utility

echo "========================================="
echo "     NETWORK & DNS OPTIMIZER UTILITY     "
echo "========================================="

# 1. Clear Network Cache
echo -e "\n[1] Clearing local network and DNS cache..."
if command -v systemd-resolve &> /dev/null; then
    sudo systemd-resolve --flush-caches
    echo " -> Systemd DNS Cache flushed."
elif command -v killall &> /dev/null; then
    sudo killall -HUP dnsmasq 2>/dev/null || echo " -> dnsmasq not running."
else
    echo " -> Local DNS cache flush skipped (utility not found)."
fi

# 2. Network Latency Comparison
echo -e "\n[2] Comparing DNS Server Latencies..."

echo -n " -> Cloudflare DNS (1.1.1.1): "
ping -c 2 1.1.1.1 | grep 'avg' | awk -F '/' '{print $5 " ms"}' || echo "Timeout"

echo -n " -> Google DNS (8.8.8.8):     "
ping -c 2 8.8.8.8 | grep 'avg' | awk -F '/' '{print $5 " ms"}' || echo "Timeout"

echo -n " -> Quad9 DNS (9.9.9.9):      "
ping -c 2 9.9.9.9 | grep 'avg' | awk -F '/' '{print $5 " ms"}' || echo "Timeout"

# 3. Optimization Suggestion
echo -e "\n[3] Optimization Tip:"
echo " To manually set the fastest DNS on your device, update your"
echo " network interface configuration or your build.prop / resolv.conf file."

echo -e "\n========================================="
echo " Optimization check completed successfully."
echo "========================================="
