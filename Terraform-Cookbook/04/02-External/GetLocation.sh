#!/bin/bash

# Read the JSON payload from stdin
read -r jsonpayload

# Convert JSON to a string
environment=$(echo "$jsonpayload" | jq -r '.environment')

if [ "$environment" = "Production" ]; then
    location="westeurope"
else
    location="westus"
fi

# Write output to stdout
echo "{ \"location\" : \"$location\" }"