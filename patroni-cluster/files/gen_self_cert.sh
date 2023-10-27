#!/bin/bash

export pass="DummyPassword"
set -e
echo "[*] generating server private key for certificate = cert-key.pem" >> output.txt
openssl genrsa -out cert-key.pem 4096

echo "[*] generating certificate sign request = cert.csr" >> output.txt
openssl req -new -sha256 -subj "/CN=$(hostname)" -key cert-key.pem -out cert.csr

echo "subjectAltName=DNS:$(hostname),IP:${1}" > extfile.cnf
echo "[*] last step generating server certificate = cert.pem" >> output.txt
openssl x509 -req -sha256 -days 365 -in cert.csr -CA ca.pem -CAkey ca-key.pem -out cert.pem -extfile extfile.cnf -CAcreateserial -passin env:pass

cat cert.pem > ./fullchain.pem

cat ca.pem >> ./fullchain.pem

openssl x509 -in ca.pem -text
