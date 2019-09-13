#!/bin/bash

cd "$(dirname "$0")"


echo
echo "Downloading MDCGen ..."
echo
wget https://github.com/CN-TU/mdcgen-matlab/archive/master.zip
unzip master.zip
rm master.zip


echo
echo "Downloading MDCStream ..."
echo
wget https://github.com/CN-TU/mdcstream-matlab/archive/master.zip
unzip master.zip
rm master.zip

echo
echo "Download complete!"
echo


