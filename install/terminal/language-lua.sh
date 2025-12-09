#!/bin/bash

# Install Lua via mise
mise use --global lua@latest

# Install LuaRocks from source
cd /tmp
LUAROCKS_VERSION="3.12.2"
wget -q https://luarocks.org/releases/luarocks-${LUAROCKS_VERSION}.tar.gz
tar zxpf luarocks-${LUAROCKS_VERSION}.tar.gz
cd luarocks-${LUAROCKS_VERSION}
./configure && make && sudo make install
cd -
rm -rf /tmp/luarocks-${LUAROCKS_VERSION} /tmp/luarocks-${LUAROCKS_VERSION}.tar.gz

# Install common Lua packages
sudo luarocks install luasocket
sudo luarocks install luafilesystem
sudo luarocks install busted
sudo luarocks install lapis