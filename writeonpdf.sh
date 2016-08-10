#!/bin/bash
# Place text on A4 PDF

if ! [ $4 ]; then
	echo "Usage: ${0##*/} text document coord-x coord-y [scale] [quiet]"
	echo "Coordinates of center"
	exit 1
fi

coords=$3'cm '$4'cm'
datetime=$(date +"%Y-%m-%d_%H%M")
text='tmp_'$datetime'_text'
textpdf=$text'.pdf'
textpdfjam=$text'-pdfjam.pdf'
output=${2%.*}'_written.pdf'
scale=$5
if ! [ $5 ]; then
	scale=0.08
fi
size=72

echo $1 | convert -background white -fill black -font Helvetica -pointsize $size -border 2 -bordercolor white -transparent white label:@- $textpdf
if ! [ $6 ]; then
	pdfjam --paper 'a4paper' --scale $scale --offset "$coords" $textpdf
else
	pdfjam --paper 'a4paper' --quiet --scale $scale --offset "$coords" $textpdf
fi
pdftk "$2" stamp $textpdfjam output "$output"

# Clean up temp files
rm $textpdf
rm $textpdfjam

# Open sigened document
if ! [ $6 ]; then
	evince "$output"
fi
