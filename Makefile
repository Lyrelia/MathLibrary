bname=table
edgelen=3

neatoargs=-Elen=$(edgelen)

$(bname).xml: $(bname).tex
	util/toxml.py $< > $@

$(bname).dot: $(bname).xml
	xsltproc util/graph.xsl $< > $@

show: $(bname).dot
	neato -Txlib $(neatoargs) $<

$(bname).png $(bname).map: $(bname).dot
	neato -Tpng -o$(bname).png -Tcmapx -o$(bname).map $(neatoargs) $<





# #/bin/bash
# if [ "$3" == "xlib" ]; then
#   neatoarg="$neatoarg -Txlib"
# else
#   neatoarg="$neatoarg -Tpng -o $(basename -s.tex $1).png"
# fi
# ./toxml.py "$1" | xsltproc graph.xsl - | neato $neatoarg
