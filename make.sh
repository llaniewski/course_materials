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
