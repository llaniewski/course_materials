#!/bin/bash

SCRDIR=$PWD/$(dirname $0)

find -name "*.tex" -not -path "./tex/*" | sort | sed 's/^[.][/]//' >.list1
git ls-files | grep 'tex$' | sort >.list2
ALL=$(cat .list1)
GITALL=$(cat .list2)
if ! diff .list1 .list2 >.list_diff
then
	echo "-----------------------------------------------"
	echo "WARNING: Difference between git and ls"
	echo "         Maybe not all tex files are commited: "
	cat .list_diff
	echo "-----------------------------------------------"
fi
rm .list1 .list2 .list_diff

for i in $ALL
do
	if ! $SCRDIR/textify.sh $i
	then
		echo Stoped on error at $i
		exit -1;
	fi
done

GITALL=$(git ls-files | grep 'tex$')
cat .travis.yml | sed '/file:/q' > n.travis.yml
for i in $GITALL
do
	F=$(basename $i)
	F=${F%.*}
	F=pdf/$F.pdf
	echo "    - $F" >> n.travis.yml
done

if diff n.travis.yml .travis.yml >/dev/null
then
	rm n.travis.yml
else
	echo Updating travis
	mv n.travis.yml .travis.yml
fi


