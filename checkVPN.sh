# Script checks if openvpn connection is alive by curling from VPN server host with 3 sec timeout
#!/bin/bash

# Check if VPN connection established
curl 10.8.0.1 -m 3

# Check the exit status
if [ $? -eq 0 ]; then
  echo "Connection is alive"
else
  sudo systemctl restart openvpn@client
  echo "VPN Connection reset$?."
fi
