#!/bin/bash

# Variable to store the last request details
LAST_REQUEST="No requests received yet."

# Source the handle_request function
source /usr/local/bin/handle_request.sh

# Start the HTTP server in the background
socat TCP-LISTEN:8080,reuseaddr,fork SYSTEM:'/usr/local/bin/handle_request.sh; handle_request' &

# Read the environment variable
# Infinite loop for the ECHO_NAMESPACE environment variable
while true; do
  echo "ECHO_NAMESPACE AND HTTP: $ECHO_NAMESPACE"
  echo -e "Last request details:\n$LAST_REQUEST"
  sleep 25
done
