#!/bin/bash -e

# Does not work on OSX
filepath=$(pwd)/$0

# Extract the contents to ~/tmp
cd ~
echo 'Extracting to home/tmp, continue?'
read
mkdir -p tmp
cd tmp
sed -e '1,/^exit$/d' "$filepath" | openssl enc -base64 -d | tar xzvf -

# Do stuff
ls -alh
./example.sh

exit
