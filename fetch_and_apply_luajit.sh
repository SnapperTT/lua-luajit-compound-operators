mkdir luajit210
cd luajit210
rm -rf *

fetch_git_release() {
        local URL_RAW=$(curl -s $1/releases | grep -m 1 "tar.gz")
        local URL1=$(echo $URL_RAW | cut -d \" -f2)
        local URL2=$(echo $URL_RAW | cut -d \" -f4)
	if [[ "$URL1" == *"tar.gz"* ]]; then
                echo $URL1
                return 0
        fi
        if [[ "$URL2" == *"tar.gz"* ]]; then
                echo $URL2
                return 0
        fi
        
        local URL_RAW2=$(curl -s $1/tags | grep -m 1 "tar.gz")
        local URL3=$(echo $URL_RAW2 | cut -d \" -f2)
        local URL4=$(echo $URL_RAW2 | cut -d \" -f4)
        if [[ "$URL3" == *"tar.gz"* ]]; then
                echo $URL3
                return 0
        fi
        if [[ "$URL4" == *"tar.gz"* ]]; then
                echo $URL4
                return 0
        fi
        
        return 1
        }


LATEST=$(fetch_git_release "https://github.com/LuaJIT/LuaJIT")
echo "Downloading: $LATEST"
wget https://github.com/$LATEST
TARFILE=${LATEST##*/}
tar -xvf $TARFILE --strip 1
cd src/
patch <../../luajit210.patch
echo -e "######## LuaJit Patched #########\n\n"

