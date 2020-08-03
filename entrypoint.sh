#!/bin/sh -l

mkdir ~/.oci
echo "[DEFAULT]" >> ~/.oci/config
echo "user=$1" >> ~/.oci/config
echo "fingerprint=$2" >> ~/.oci/config
echo "region=$3" >> ~/.oci/config
echo "tenancy=$4" >> ~/.oci/config
echo "key_file=~/.oci/key.pem" >> ~/.oci/config
echo "$5" >> ~/.oci/key.pem
cat ~/.oci/config
curl -LSs https://raw.githubusercontent.com/fnproject/cli/master/install | sh

echo "::set-output name=message::Successfully created OCI environment"