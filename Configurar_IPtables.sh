#!/bin/bash

input="file.txt"

iptables -F

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

while IFS= read line
do
        iptables -A INPUT -p tcp --dport $line -j ACCEPT
        echo "$line"
done <"$input"
