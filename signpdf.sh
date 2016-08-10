#!/bin/bash
# Place signature on A4 PDF

if ! [ $3 ]; then
    echo "Usage: ${0##*/} document coord-x coord-y [scale]"
    echo "Coordinates from center"
    exit 1
fi

coords=$2'cm '$3'cm'
datetime=$(date +"%Y-%m-%d_%H%M")
signature='tmp_'$datetime'_sign'
signaturepdf=$signature'.pdf'
signaturepdfjam=$signature'-pdfjam.pdf'
output=${1%.*}'_signed.pdf'
scale=$4
if ! [ $4 ]; then
	scale=0.2
fi

convert ~/templates/signature.png $signaturepdf
pdfjam --paper 'a4paper' --scale $scale --offset "$coords" $signaturepdf
pdftk "$1" stamp $signaturepdfjam output "$output"

# Clean up temp files
rm $signaturepdf
rm $signaturepdfjam

# Open sigened document
evince "$output"
