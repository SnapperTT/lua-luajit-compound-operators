mkdir luajit210
cd luajit210
rm -rf *

LATEST=LuaJIT/LuaJIT/archive/refs/tags/v2.1.0-beta3.tar.gz

echo "Downloading: $LATEST"
wget https://github.com/$LATEST
TARFILE=${LATEST##*/}
tar -xvf $TARFILE --strip 1
cd src/
patch <../../luajit210.patch
echo -e "######## LuaJit Patched #########\n\n"

