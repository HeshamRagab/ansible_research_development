#!/bin/bash

export pass="p@\$\$W0RD123-=-="
set -e

echo "[*] generating private key = ca-key.pem" > output.txt
openssl genrsa -passout env:pass -aes256 -out ca-key.pem 4096

echo "[*] generating CA certificate = ca-key.pem" >> output.txt
openssl req -passin env:pass -subj "/C=EG/ST=Cairo/L=Cairo/O=Corp EG" -new -x509 -sha256 -days 365 -key ca-key.pem -out ca.pem
