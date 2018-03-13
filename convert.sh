#!/bin/bash

OUT=$1

shopt -s nullglob
numfiles=($OUT/endOfBatch)
numfiles=${#numfiles[@]}

if [ $numfiles -gt 0 ]
then
	echo "endOfBatch found in $OUT/"
	mkdir $OUT/tmp
	for i in $OUT/*.tif
	do
	   convert "$i" $OUT/tmp/a.pdf
	   wait
	   echo "Conversion of $i done."
	   if [ -s $OUT/tmp/file.pdf ]
	   then
		gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$OUT/tmp/b.pdf $OUT/tmp/file.pdf $OUT/tmp/a.pdf
		wait
	   else
		mv $OUT/tmp/a.pdf $OUT/tmp/b.pdf
	   fi
	   mv $OUT/tmp/b.pdf $OUT/tmp/file.pdf
	done
	mv $OUT/tmp/file.pdf $OUT.pdf
fi

bash ./sync.sh
wait
