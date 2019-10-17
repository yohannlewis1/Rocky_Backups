import json
import sys

def prettify(inFile):
    with open(inFile, 'r') as rawFile:
       contents = rawFile.read()
    outFile = inFile
    with open(outFile, 'w') as jsonFile:
        jsonFile.write(json.dumps(json.loads(contents), indent=4))

def main():
    prettify(sys.argv[1])

if __name__ == '__main__':
    prettify(sys.argv[1])
