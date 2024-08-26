#!/bin/bash

# Shell Script to Get country code of an IP address


# Function to get the country code for an IP address
get_country_code() {
    local ip="$1"
   # local api_url="https://ipinfo.io/$ip/country"
     local api_url="https://api.country.is/$ip"

    # Make a GET request to the API
    local country_code=$(curl -s "$api_url")

    echo "$country_code"
}

# Example usage: Pass the IP address as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <IP address>"
    exit 1
fi

ip_address="$1"
country_code=$(get_country_code "$ip_address")

if [ -z "$country_code" ]; then
    echo "Failed to retrieve country code for $ip_address"
    exit 1
fi

echo "Country code for $ip_address is: $country_code"
