#!/bin/bash
set -e

echo "Starting WireGuard inside container..."
wg-quick up /etc/wireguard/wg.conf

echo "Starting XrayR..."
cd /opt
./XrayR -c config.yml
