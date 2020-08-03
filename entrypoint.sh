#!/bin/sh -l

mkdir ~/.oci
echo "[DEFAULT]" >> ~/.oci/config
echo "user=$1" >> ~/.oci/config
echo "fingerprint=$2" >> ~/.oci/config
echo "region=$3" >> ~/.oci/config
echo "tenancy=$4" >> ~/.oci/config
echo "key_file=~/.oci/key.pem" >> ~/.oci/config
echo "$5" >> ~/.oci/key.pem
yum install -y python36
curl -L -O https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh
chmod +x install.sh
./install.sh --accept-all-defaults
echo "::add-path::/github/home/bin/oci"
exec -l $SHELL
oci setup repair-file-permissions --file /home/runner/.oci/config
oci setup repair-file-permissions --file /home/runner/.oci/key.pem
curl -LSs https://raw.githubusercontent.com/fnproject/cli/master/install | sh
python -m pip install --upgrade pip
if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

echo "::set-output name=message::Successfully created OCI environment"