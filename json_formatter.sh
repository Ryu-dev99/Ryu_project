#!/bin/bash
# Network Config JSON Validator and Formatter

echo "========================================="
echo "     JSON CONFIG VALIDATOR & FORMATTER   "
echo "========================================="

if [ -z "$1" ]; then
    echo "Usage: ./json_formatter.sh <path_to_json_file>"
    echo "Example: ./json_formatter.sh config.json"
    echo -e "\n[!] No file provided. Running self-test on dummy data..."
    JSON_DATA='{"network":{"protocol":"trojan","port":443,"security":"tls"}}'
else
    if [ -f "$1" ]; then
        JSON_DATA=$(cat "$1")
    else
        echo "Error: File $1 not found."
        exit 1
    fi
fi

# Validate JSON using python built-in tool
echo -e "\n[1] Checking JSON structure..."
if command -v python3 &> /dev/null; then
    echo "$JSON_DATA" | python3 -m json.tool &> /dev/null
    if [ $? -eq 0 ]; then
        echo " -> SUCCESS: JSON format is valid and correct!"
        echo -e "\n[2] Formatted Output:"
        echo "$JSON_DATA" | python3 -m json.tool
    else
        echo " -> ERROR: Invalid JSON structure. Please check your syntax/commas."
    fi
else
    echo " -> Python3 not found. Cannot format JSON dynamically."
    echo " -> Raw Data: $JSON_DATA"
fi

echo "========================================="
