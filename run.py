import os
import sys
import xml.etree.ElementTree
from subprocess import call

path = input("Write the XML file path (FileName.xml): ")

print("Colecting Posts Bodies...")

root1 = xml.etree.ElementTree.parse(path)

root = root1.getroot()



bodies={}
changed={}

for el in root.findall('.//row'):
    id = (el.attrib.get('Id'))
    bodies[id]=str(el.attrib.get('Body'))
    changed[id]=0

def start_parsing():
    nchanged=0
    nbodies=0
    with open(os.devnull, "w") as f:
            call(["make"], stdout=f)
    for k, v in bodies.items():
        nbodies+=1
        clexFile = open("input.txt", "w")
        clexFile.write(v)
        clexFile.close()
        sizeofFileIn = os.stat('input.txt').st_size
        with open(os.devnull, "w") as f:
            call(["make", "parsing"], stdout=f)
        sizeofFileOut = os.stat('final.out').st_size
        if ( sizeofFileIn<sizeofFileOut ):
            changed[k] = 1
            nchanged+=1
            print(nchanged," de ", nbodies," (",nchanged/nbodies*100,"% ) posts identificados com mais codigo - Last body: ",k)

            for el in root.findall('.//row'):
                id = (el.attrib.get('Id'))
                if id == k:
                    outputFile = open("final.out", "r")
                    el.set("Body", outputFile.read())
                    root1.write("Posts.xml")
            outputFile.close()
            #input("paused")
            sys.stdout.write("\033[F")
    print()






print("Parsing Bodies...")
start_parsing()
# for key,value in changed.items():
#     for el in root.findall('.//row'):
#         id = (el.attrib.get('Id'))
#         if id == key:
#             print(key,str(el.attrib.get('Body')))
    #print(key,bodies[key])
