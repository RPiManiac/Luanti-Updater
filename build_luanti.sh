#!/bin/bash

echo "This script will clone the Luanti repository and build it."
read -p "Do you want to continue? (y/n): " response

if [[ "$response" != "y" && "$response" != "Y" ]]; then
  echo "Oh, okay then, goodbye."
  exit 0
fi

echo "Cloning repository luanti-org/luanti to $(pwd)"
git clone https://github.com/luanti-org/luanti
cd luanti
cmake .
echo "Note: If you would like to install Luanti system-wide, edit line 16 in build_luanti.sh that says 'make' to 'make install'"
make