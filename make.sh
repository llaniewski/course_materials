#!/bin/bash

SCRDIR=$PWD/$(dirname $0)


ALL=$(find -name "*.tex" -not -path "./tex/*")
for i in $ALL
do
	if ! $SCRDIR/textify.sh $i
	then
		echo Stoped on error at $i
		exit -1;
	fi
done

cat .travis.yml | sed '/file:/q' > n.travis.yml
for i in $ALL
do
	F=$(basename $i)
	F=${F%.*}
	F=pdf/$F.pdf
	echo "    - $F" >> n.travis.yml
done
mv n.travis.yml .travis.yml