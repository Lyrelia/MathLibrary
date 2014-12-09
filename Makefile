bname=table
ibname=index
edgelen=3

dotargs=

$(bname).xml: $(bname).tex
	util/toxml.py $< > $@

$(bname).dot: $(bname).xml
	xsltproc util/graph.xsl $< > $@

show: $(bname).dot
	dot -Txlib $(dotargs) $<

$(bname).png $(bname).map: $(bname).dot
	dot -Tpng -o$(bname).png -Tcmapx -o$(bname).map $(dotargs) $<

$(bname).html: $(bname).xml $(bname).map $(bname).png tooltip.js
	xsltproc util/gtohtml.xsl $(bname).map > $@

$(ibname).tex: $(bname).xml $(bname).map
	xsltproc util/index.xsl $< > $@

$(ibname).html: $(ibname).tex $(bname).png tooltip.js
	htlatex $< "util/ht5mjlatex.cfg,charset=utf-8,3,next" " -cunihtf -utf8"

tooltip.js:
	cp util/tooltip.js tooltip.js

clean:
	rm -f $(bname).{xml,dot,png,map,html} $(ibname)* tooltip.js


# #/bin/bash
# if [ "$3" == "xlib" ]; then
#   neatoarg="$neatoarg -Txlib"
# else
#   neatoarg="$neatoarg -Tpng -o $(basename -s.tex $1).png"
# fi
# ./toxml.py "$1" | xsltproc graph.xsl - | neato $neatoarg
