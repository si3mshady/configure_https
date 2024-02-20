#!/bin/bash

# Generate CA key
openssl genrsa -out ca.key 2048

# Generate CA certificate
openssl req -x509 -new -nodes -key ca.key -sha256 -days 365 -out ca.crt

# Generate domain key
openssl genrsa -out domain.key 2048

# Generate domain certificate signing request (CSR)
openssl req -new -key domain.key -out domain.csr

# Sign domain certificate with CA
openssl x509 -req -in domain.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out domain.crt -days 365 -sha256

# Edit hosts file for local testing 
sudo vi /etc/hosts

# 127.0.0.1 lamararnold.com
# 127.0.0.1 elliottarnold.com
# 127.0.0.1 elliottnewsaas.com