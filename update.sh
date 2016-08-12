#!/bin/bash

cd "$(dirname $0)/src"

echo "Creating the archive..."
rm -rf ../archive.tar.gz*
tar cpfz ../archive.tar.gz .

echo "Creating a self-extracting shell script..."
cd ..
cat base_script.sh > archive.run
cat archive.tar.gz | openssl enc -base64 >> archive.run
rm -rf archive.tar.gz
chmod a+x archive.run

echo "Done!"
