#!/bin/bash
set -e

# Start the cron service
service cron start

# Run init_chromedriver.sh first
echo "🔧 Running init_chromedriver.sh..."
/usr/local/bin/init_chromedriver.sh

# Display current system time
echo "🕒 Current Time: $(date)"

# Execute the default container command (keeps the container running)
exec "$@"
