#!/bin/python

import xml.etree.ElementTree as ET
import sys
import tempfile

fname=sys.argv[1]

def main():
    # tree = ET.parse(sys.argv[1])
    lyxfile = open(fname,'r')
    tmp=tempfile.TemporaryFile('w+')
    lyxtabular=False
    for line in lyxfile:
        if 'lyxtabular' in line and lyxtabular:
            tmp.write(line)
            break
        if 'lyxtabular' in line and not lyxtabular:
            print('found')
            lyxtabular = True
        if lyxtabular and not ('features' in line or 'column' in line):
            print('printing')
            tmp.write(line)

    tmp.seek(0)
    print(tmp.read())

    # r=tree.getroot()

if __name__ == "__main__":
    main()
