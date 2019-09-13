#!/bin/bash

cd "$(dirname "$0")"


echo
echo "Downloading MDCGen ..."
echo
wget https://github.com/CN-TU/mdcgen-matlab/archive/master.zip
unzip master.zip
rm master.zip


echo
echo "Downloading MSDGen ..."
echo
wget https://github.com/CN-TU/mdcstream-matlab/archive/master.zip
unzip master.zip
rm master.zip

echo
echo "Download complete!"
echo


echo
echo "Running Tests for MDCGen ..."
echo
matlab -nodisplay -nosplash -nodesktop -r "run('mdcgen-matlab-master/runUnitTests.m');exit;" | tail -n +11


echo
echo "Running Tests for MDCStream ..."
echo
matlab -nodisplay -nosplash -nodesktop -r "run('mdcstream-matlab-master/runUnitTests.m');exit;" | tail -n +11

echo
echo "Installation complete!"
echo
