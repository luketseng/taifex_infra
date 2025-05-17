#!/bin/bash
set -e

# Install the correct version of chromedriver (v101)
echo "🔧 Updating chromedriver to match Chrome 101..."
wget -q https://chromedriver.storage.googleapis.com/101.0.4951.41/chromedriver_linux64.zip && \
    unzip -o chromedriver_linux64.zip && \
    mv -f chromedriver /usr/local/bin/chromedriver && \
    chmod +x /usr/local/bin/chromedriver && \
    rm chromedriver_linux64.zip

# Display installed Chrome version
echo "🧭 Chrome Version: $(/opt/google/chrome/chrome --version)"

# Display installed ChromeDriver version
echo "🧪 ChromeDriver Version: $(chromedriver --version)"

# Execute the default container command (keeps the container running)
# exec "$@"
