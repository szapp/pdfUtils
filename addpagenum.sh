#!/bin/bash
# Add page numbers to A4 PDF

if ! [ $1 ]; then
	echo "Usage: ${0##*/} document [offset]"
	exit 1
fi

doc=$1
final=${1%.*}'_pagenum.pdf'
datetime=$(date +"%Y-%m-%d_%H%M")
new='tmpAP_'$datetime'_new.pdf'
new1='tmpAP_'$datetime'_new1.pdf'
text='tmpAP_'$datetime'_text.pdf'
textWritten='tmpAP_'$datetime'_text_written.pdf'

offset=0
if [ $2 ]; then
	offset=$2
fi

total=$( pdftk $doc dump_data | grep NumberOfPages )
total=${total:15}
totaloffset=$[$total+$offset]

echo "" | ps2pdf -sPAPERSIZE=a4 - $new

for i in `seq 1 $total`; do
	num=$[$i+$offset]
	pdftk $doc cat $i output $text
	./writeonpdf.sh "$num / $totaloffset" $text 0 -13 0.045 false # A4
	# ./writeonpdf.sh "- $num / $totaloffset -" $text 0 13.5 0.15 false # Slides
	rm $text
	pdftk $new $textWritten output $new1
	mv $new1 $new
	rm $textWritten
done
pdftk $new cat 2-end output $final
rm $new
