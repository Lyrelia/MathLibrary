#/bin/bash
neatoarg="-Elen=${2:-3}"
if [ "$3" == "xlib" ]; then
  neatoarg="$neatoarg -Txlib"
else
  neatoarg="$neatoarg -Tpng -o $(basename -s.tex $1).png"
fi
./toxml.py "$1" | xsltproc graph.xsl - | neato $neatoarg
