# 使い方
# ./rename.sh ap_server animals
# prefixをrenameするためのシェル
# !/bin/sh
echo "検索対象ディレクトリ：" $1
echo "prefix：" $2
cd $1
prefix=$2
ls | awk '{print $1 " "prefix $1 }' prefix=$prefix"_" | xargs -n 2 mv
