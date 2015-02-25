export TEXINPUTS=$PWD/common:

mkdir -p aux
export AUX=$PWD/aux

ALL=$(find -name "*.tex")
for i in $ALL
do
	DIR=$(dirname $i)
	echo Making $i
	mkdir -p $AUX/$DIR
	if ! ((cd $DIR; pdflatex -interaction=nonstopmode -halt-on-error -output-directory=$AUX/$DIR $(basename $i)) >error.log 2>&1)
	then
		cat error.log
		echo Stoped on error at $i
		exit -1;
	fi
done
rm error.log
