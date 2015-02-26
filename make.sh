export TEXINPUTS=$PWD/common:

if [ -d tex/main/bin ]
then
	export PATH=$PWD/tex/main/bin/x86_64-linux:$PATH
fi

TEX=pdflatex
#TEX=/home/llaniewski/tex_test/aa/bin/x86_64-linux/pdflatex
mkdir -p aux
export AUX=$PWD/aux

ALL=$(find -name "*.tex" -not -path "./tex/*")
for i in $ALL
do
	DIR=$(dirname $i)
	echo Making $i
	mkdir -p $AUX/$DIR
	if ! ((cd $DIR; $TEX -interaction=nonstopmode -halt-on-error -output-directory=$AUX/$DIR $(basename $i)) >error.log 2>&1)
	then
		cat error.log
		echo Stoped on error at $i
		exit -1;
	fi
done
rm error.log
