#!/bin/bash
while :
do
# Menamplikan memory dalam ukuran satuan megabytes
memory_total=$(free -m | awk 'NR==2 {print $2}')
echo "total memory: $memory_total MB"
sleep 3s

# Menampilkan ruang disk pada filesystem dalam satuan gigabytes
usage_disk=$(df -B1G | awk '/\/dev/ {print $1, $3}')
echo "Penggunan pada ruang disk:"
echo "Filesystem Usage"
echo "$usage_disk" | awk '{print $1, $2 "G"}'
sleep 3s

# Menampilkan ruang disk pada filesystem (filesystem dan use%)
usage_disk_filtered=$(df -h | awk '/\/dev/ && !/tmpfs/ {print $1, $5}')
echo "Penggunan pada ruang disk (Filesystem dan Use%:)"
echo "Filesystem Use%"
echo "$usage_disk_filtered"
sleep 1m
done
