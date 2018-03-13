#!/bin/bash

shopt -s nullglob
numfiles=($1/endOfBatch)
numfiles=${#numfiles[@]}

if [ $numfiles -gt 0 ]
then
	echo "endOfBatch found in $1/"
	mkdir $1/tmp
	for i in $1/*.tif
	do
	   convert "$i" $1/tmp/a.pdf
	   wait
	   echo "Conversion of $i done."
	   if [ -s $1/tmp/file.pdf ]
	   then
		gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$1/tmp/b.pdf $1/tmp/file.pdf $1/tmp/a.pdf
		wait
	   else
		mv $1/tmp/a.pdf $1/tmp/b.pdf
	   fi
	   mv $1/tmp/b.pdf $1/tmp/file.pdf
	done
	mv $1/tmp/file.pdf $1.pdf
fi

bash ./sync.sh
wait
