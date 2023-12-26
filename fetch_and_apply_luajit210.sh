mkdir -p luajit210
cd luajit210
rm -rf *

LATEST=LuaJIT/LuaJIT/archive/refs/tags/v2.1.0-beta3.tar.gz

echo "Downloading: $LATEST"
wget https://github.com/$LATEST
TARFILE=${LATEST##*/}
tar -xvf $TARFILE --strip 1
cd src/
patch <../../luajit210.patch
# Create symlink to src
cd ..
rm -f ../link_to_luajit210
ln -s `pwd` ../link_to_luajit210
echo -e "######## LuaJit Patched #########\n\n"

