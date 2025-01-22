#!/bin/bash

# Variable to store the last request details
LAST_REQUEST="No requests received yet."

# Function to handle HTTP requests
handle_request() {
  REQUEST_DETAILS="Path: $REQUEST_URI\nHeaders:\n$(env)"
  echo -e "HTTP/1.1 200 OK\n\nHello World\n\n$REQUEST_DETAILS"
  echo -e "Request received:\n$REQUEST_DETAILS" >&2
  LAST_REQUEST=$REQUEST_DETAILS
}

# Start the HTTP server in the background
socat TCP-LISTEN:8080,reuseaddr,fork SYSTEM:'handle_request' &

# Read the environment variable
# infinite loop the ECHO_NAMESPACE environment variable
while true; do
  echo "ECHO_NAMESPACE AND HTTP: $ECHO_NAMESPACE"
  echo -e "Last request details:\n$LAST_REQUEST"
  sleep 25
done
