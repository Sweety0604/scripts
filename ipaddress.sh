#!/bin/bash

#shows the list of ip address

# saving all the ip addresses
ip_addresses=$(hostname -I)

# splitting them by space
ip_addresses=(${ip_addresses//" "/ })

# Print each ip address line by line
echo "LIST OF IP ADDRESSES"
for ip in "${ip_addresses[@]}";
do
  printf "$ip\n"
done
