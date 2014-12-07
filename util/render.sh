#!/bin/sh
./toxml.py "$1" | xsltproc graph.xsl - | neato -Txlib
