#!/bin/bash

# Start the HTTP server in the background
socat TCP-LISTEN:8080,reuseaddr,fork EXEC:'/bin/echo -e HTTP/1.1 200 OK\\n\\nHello World' &

# Read the environment variable
# infinite loop the ECHO_NAMESPACE environment variable
while true; do
  echo "ECHO_NAMESPACE AND HTTP: $ECHO_NAMESPACE"
  sleep 5
done
