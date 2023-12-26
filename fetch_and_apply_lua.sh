mkdir -p lua52
cd lua52
LUA_VERSION=5.2.4
curl -R -O https://www.lua.org/ftp/lua-$LUA_VERSION.tar.gz
tar zxf lua-$LUA_VERSION.tar.gz
cd lua-$LUA_VERSION/src/
patch <../../../lua52.patch
# Create symlink to src
cd ..
rm -f ../../link_to_lua52
ln -s `pwd` ../../link_to_lua52
echo -e "######## Lua Patched #########\n\n"

