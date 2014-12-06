#!/bin/python

import sys


def main():
    tabular=False
    rows=[]
    for line in open(sys.argv[1]):
        if '\\begin{tabular}' in line:
            tabular=True
        if tabular and '\\tabularnewline' in line:
            rows.append([c.strip() for c in line.rsplit('\\tabularnewline',1)[0].split('&')])
        if '\\end{tabular}' in line:
            tabular=False

    print(rows)

if __name__ == "__main__":
    main()
