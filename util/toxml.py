#!/bin/python

import xml.etree.ElementTree as ET
import re
import sys

def main():
    tabular=False
    colheader=[]
    table = ET.Element('table')
    for line in open(sys.argv[1]):
        if '\\begin{tabular}' in line:
            tabular=True
        if '\\end{tabular}' in line:
            tabular=False
        if tabular and '\\tabularnewline' in line:
            if colheader == []:
                colheader = [re.sub(' ','_',c.strip().lower()) 
                        for c in line.rsplit('\\tabularnewline',1)[0].split('&')]
                print(colheader)
            else:
                row = ET.SubElement(table,'row')
                cols = [c.strip() for c in line.rsplit('\\tabularnewline',1)[0].split('&')]
                print(cols)
                for i in range(len(colheader)):
                    c = ET.SubElement(row,colheader[i])
                    c.text=cols[i]

    print(ET.tostring(table))



if __name__ == "__main__":
    main()
