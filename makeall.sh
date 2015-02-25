export TEXINPUTS=$PWD/common:

ALL=$(find -name "*.tex")
for i in $ALL
do
	echo Making $i
	if ! ((cd $(dirname $i); latexmk -pdf -interaction=nonstopmode $(basename $i)) >error.log 2>&1)
	then
		cat error.log
		echo Stoped on error
		exit -1;
	fi
done
rm error.log
