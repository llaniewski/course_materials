#!/bin/bash

SCRDIR=$(readlink -f $0)
SCRDIR=$(dirname $SCRDIR)

IN=$1
if [ "x$IN" == "x" ]
then
	echo No input provided
	echo usage: textify.sh file.tex
	exit -1;
fi

#echo SCRDIR:$SCRDIR
export TEXINPUTS=$SCRDIR/common:

if [ -d $SCRDIR/tex/main/bin ]
then
	export PATH=$SCRDIR/tex/main/bin/x86_64-linux:$PATH
fi

TEX=pdflatex
mkdir -p $SCRDIR/aux
mkdir -p $SCRDIR/pdf
export AUX=$SCRDIR/aux

DIR=$(dirname $IN)
FILE=$(basename $IN)
PDF=${FILE%.*}.pdf
OUT=$SCRDIR/pdf/$PDF
if [ $OUT -nt $IN ]
then
	echo "Omitting $IN"
	exit 0;
fi
	echo "Textify  $IN"
mkdir -p $AUX/$DIR

cd $DIR

#echo AUX : $AUX
#echo DIR : $DIR
#echo TEX : $TEX
#echo FILE: $FILE
#echo PDF : $PDF
#echo OUT : $OUT
#echo IN  : $IN

	if ! $TEX -interaction=nonstopmode -halt-on-error -output-directory=$AUX/$DIR $FILE >error.log 2>&1
	then
		cat error.log
		echo Stoped on error at $IN
		exit -1;
	else
		$TEX -interaction=nonstopmode -halt-on-error -output-directory=$AUX/$DIR $FILE >error.log 2>&1
		$TEX -interaction=nonstopmode -halt-on-error -output-directory=$AUX/$DIR $FILE >error.log 2>&1
		if [ -f "$AUX/$DIR/$PDF" ]
		then
			mv $AUX/$DIR/$PDF $OUT
		else
			echo pdf not created at $IN
			exit -2;
		fi
	fi
rm error.log
exit 0;