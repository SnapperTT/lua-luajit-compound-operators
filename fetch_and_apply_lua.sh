mkdir lua52
cd lua52
LUA_VERSION=5.2.4
curl -R -O http://www.lua.org/ftp/lua-$LUA_VERSION.tar.gz
tar zxf lua-$LUA_VERSION.tar.gz
cd lua-$LUA_VERSION/src/
patch <../../../lua52.patch
echo -e "######## Lua Patched #########\n\n"

