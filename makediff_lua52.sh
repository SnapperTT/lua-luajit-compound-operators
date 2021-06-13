A=../lua52/lua-5.2.4/src/
B=lua5.2/src/
diff -rup $A $B > lua52.patch
AE=`echo "$A" | sed 's/[\.\/]/\\\&/g'`
BE=`echo "$B" | sed 's/[\.\/]/\\\&/g'`
sed -i "s/$AE//g" lua52.patch
sed -i "s/$BE//g" lua52.patch
cat lua52.patch
