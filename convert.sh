#!/bin/bash

shopt -s nullglob
numfiles=($1/endOfBatch)
numfiles=${#numfiles[@]}

if [ $numfiles -gt 0 ]
then
	echo "endOfBatch found in $1/"
	rm -f /tmp/file.pdf
	for i in $1/*.tif
	do
	   convert "$i" /tmp/a.pdf
	   wait
	   echo "Conversion of $i done."
	   if [ -s /tmp/file.pdf ]
	   then
		gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=/tmp/b.pdf /tmp/file.pdf /tmp/a.pdf
	   wait
	   else
		mv /tmp/a.pdf /tmp/b.pdf
	   fi
	   mv /tmp/b.pdf /tmp/file.pdf
	done
	mv /tmp/file.pdf $1.pdf
	rm -rf $1/
fi

./sync.sh
