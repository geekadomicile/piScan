#!/bin/bash

# Settings

DIR="./piScan"
OUTDIR="$DIR/$(date +%Y%m%dT%H%M%S)"


# Working dir creation

mkdir -p $DIR
mkdir -p $OUTDIR

# Scan batch

scanimage \
-x 216 \
-y 355.6 \
--page-width 216 \
--page-height 355.6 \
--format=tiff \
--batch=$OUTDIR/p%04d.tif \
--source "ADF Duplex" \
--resolution 300 \
--mode Lineart \
--brightness 50 \
--sleeptimer 0
wait


# Cleanup empty dir

shopt -s nullglob
numfiles=($OUTDIR/*)
numfiles=${#numfiles[@]}

if [ $numfiles -gt 0 ]
then
	touch $OUTDIR/endOfBatch
else
	rm -r $OUTDIR
fi

./convert.sh $OUDTDIR
