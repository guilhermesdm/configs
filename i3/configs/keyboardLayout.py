#!/usr/bin/env python3

import subprocess

def getLayout():
    try:
        layout = subprocess.run(['xkblayout-state print "%s"'], shell = True, capture_output = True, text = True)
        return layout.stdout.upper()
    except Exception as e:
        return str(e)

if __name__ == "__main__":
    print(getLayout())
