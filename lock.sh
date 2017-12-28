#!/bin/bash
# Script unlock dropbear, webmin, squid3, openvpn, openssh
# Dev by Tepsus
read -p "Username : " Login
usermod -L $Login