#!/bin/bash

handle_request() {
  REQUEST_DETAILS="Path: $REQUEST_URI\nHeaders:\n$(env)"
  echo -e "HTTP/1.1 200 OK\n\nHello World\n\n$REQUEST_DETAILS"
  echo -e "Request received:\n$REQUEST_DETAILS" >&2
  LAST_REQUEST=$REQUEST_DETAILS
}
