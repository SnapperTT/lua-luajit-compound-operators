A=../luajit/src/
B=luajit2.1.0-beta3/src/
diff -rup $A $B > luajit210.patch
AE=`echo "$A" | sed 's/[\.\/]/\\\&/g'`
BE=`echo "$B" | sed 's/[\.\/]/\\\&/g'`
sed -i "s/$AE//g" luajit210.patch
sed -i "s/$BE//g" luajit210.patch
cat luajit210.patch
