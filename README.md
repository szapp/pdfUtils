PDF command-line utilities
==========================

Collection of useful shell scripts for quickly modifying pdf files from command-line.

Features
--------

 - Add page numbers on each page of either a A4 pdf document or on typical pdf presentation slides
 - Easily write any text anywhere on a A4 pdf
 - Sign A4 pdfs with your signature with one easy command (requires the file ``~/templates/signature.png`` to exist)

Requirements
------------

- [PDFtk (command-line)](https://www.pdflabs.com/tools/pdftk-server/)
- [PDFjam](http://www2.warwick.ac.uk/fac/sci/statistics/staff/academic-research/firth/software/pdfjam/)
- [ps2pdf (Ghostscript)](http://www.ghostscript.com/doc/current/Ps2pdf.htm)
- [convert (ImageMagick 6.7.7-10 2016-06-01 Q16)](http://www.imagemagick.org)
- [Evince document viewer (optional for viewing)](https://help.ubuntu.com/community/Evince)

Usage
-----

1. Clone or [download](../../archive/master.zip) this repository.
2. Start the terminal and navigate to the scripts.
3. You may have to set the scripts to executable.

```bash
$ chmod +x addpagenum.sh addpagenumSlides.sh signpdf.sh writeonpdf.sh
```

Execute any command without parameters to retrieve the usage information.
The scripts are short and intuitive and will offer more information on parameters settings.

```bash
$ ./writeonpdf.sh
Usage: writeonpdf.sh text document coord-x coord-y [scale] [quiet]
Coordinates of center
```
```bash
$ ./signpdf.sh
Usage: signpdf.sh document coord-x coord-y [scale]
Coordinates from center
```

```bash
$ ./addpagenum.sh
Usage: addpagenum.sh document [offset]
```

```bash
$ ./addpagenumSlides.sh
Usage: addpagenumSlides.sh document [offset]
```
