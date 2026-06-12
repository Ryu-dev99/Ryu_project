#!/bin/bash
# Simple Network Speed Test Utility

echo "========================================="
echo "       LIGHTWEIGHT SPEED TEST UTILITY    "
echo "========================================="

# Target test file (10MB sample file from stable source)
TEST_URL="http://speedtest.tele2.net/10MB.zip"
OUTPUT_FILE="speedtest_sample.zip"

echo -e "\n[1] Starting download speed test..."
echo " -> Downloading 10MB test file from Tele2 Server..."

if command -v curl &> /dev/null; then
    START_TIME=$(date +%s)
    curl -s -o $OUTPUT_FILE $TEST_URL
    END_TIME=$(date +%s)
elif command -v wget &> /dev/null; then
    START_TIME=$(date +%s)
    wget -q -O $OUTPUT_FILE $TEST_URL
    END_TIME=$(date +%s)
else
    echo " -> Error: Neither curl nor wget is installed. Cannot run speed test."
    exit 1
fi

# Calculate duration
DURATION=$((END_TIME - START_TIME))

if [ $DURATION -le 0 ]; then
    DURATION=1
fi

# Clean up the downloaded test file
rm -f $OUTPUT_FILE

echo " -> Test finished!"
echo -e "\n[2] Results:"
echo " -> Total Time: $DURATION seconds"
echo " -> Estimated Speed: $((10 / DURATION)) MB/s"
echo "========================================="
