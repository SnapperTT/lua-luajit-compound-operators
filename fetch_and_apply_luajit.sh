mkdir luajit210
cd luajit210
LATEST=$(curl -s https://github.com/LuaJIT/LuaJIT/releases | grep -m 1 "tar.gz" | cut -d \" -f4)
 wget https://github.com/$LATEST
TARFILE=${LATEST##*/}
tar -xvf $TARFILE --strip 1
cd src/
patch <../../luajit210.patch
echo -e "######## LuaJit Patched #########\n\n"

