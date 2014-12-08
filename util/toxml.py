#!/bin/python

import xml.etree.ElementTree as ET
import re
import sys

tag = { 'children' : lambda s: commasplit('children',s),
        'attributed_text' : lambda s: linkstohyperref('attributed_text',s) }

def commasplit(t,s):
    r=ET.Element(t)
    if s=='': return r
    for c in s.split(','):
        e=ET.Element('t')
        e.text=c
        r.append(e)
    return r

def linkstohyperref(t,s):
    r=ET.Element(t)
    r.text=re.sub('\\\\href{(.*?)}{(.*?)}','\hyperref[\\1]{\\2}',s)
    return r

def linkstoxml(t,s):
    sl=re.split('\\\\href\\{(.*?)\\}\\{(.*?)\\}',s)
    tb=ET.TreeBuilder()
    tb.start(t)
    for i in range(len(sl)):
        if i % 3 == 0: # between matches
            tb.data(sl[i])
        elif i % 3 == 1: # i, i+1 matching groups
            tb.start('a',{'href' : sl[i]})
            tb.data(sl[i+1])
            tb.end('a')
    tb.end(t)
    return tb.close()

def maketree(t,s):
    if t in tag.keys():
        return tag[t](s)
    else: # default handling
        r=ET.Element(t)
        r.text=s
        return r

def main():
    xml = readfile(sys.argv[1])
    print(ET.tostring(xml).decode())

def readfile(fname):
    text=open(fname).read()
    text=text.split('\\begin{tabular}',1)[1]
    text=text.split('}',1)[1]
    text=text.rsplit('\\end{tabular}',1)[0]
    text=re.sub('\\\\hline','',text)
    rows=text.split('\\tabularnewline')[:-1]
    mat=[[c.strip() for c in r.split('&')] for r in rows]

    colheader=[re.sub(' ','_',c.lower()) for c in mat[0]]
    mat=mat[1:]

    graph=ET.Element('graph')
    for row in mat:
        r=ET.SubElement(graph,'node')
        for i in range(len(colheader)):
            e=maketree(colheader[i],row[i])
            r.append(e)

    return graph

if __name__ == "__main__":
    main()
