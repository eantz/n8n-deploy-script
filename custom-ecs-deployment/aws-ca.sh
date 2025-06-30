#!/bin/sh

REGION_NAME="{{YOUR_REGION_NAME}}"
CERTIFICATE_NAME="$REGION_NAME-bundle.pem"
OUTPUT_DIR="opt/custom-certificates"

mkdir -p $OUTPUT_DIR

if test -f "$CERTIFICATE_NAME" 
then
  echo "source certificate already exists, skipping download."
else
  wget https://truststore.pki.rds.amazonaws.com/$REGION_NAME/$CERTIFICATE_NAME
fi


# Initialize counter
CERT_COUNT=0

# Read and split certificates
awk -v outdir="$OUTPUT_DIR" '
  /-----BEGIN CERTIFICATE-----/,/-----END CERTIFICATE-----/ {
    print >> outdir "/cert" cert_index ".pem"
    if (/-----END CERTIFICATE-----/) {
      cert_index++
    }
  }
' cert_index=0 "$CERTIFICATE_NAME"

echo "Certificates have been saved in the '$OUTPUT_DIR' directory."





