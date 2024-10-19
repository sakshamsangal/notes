import os
from fnmatch import fnmatch

root = 'BackEnd/Python'
pattern = "*.md"

with open("result_python.md", "wb") as outfile:
    for path, subdirs, files in os.walk(root):
        for name in files:
            if fnmatch(name, pattern):
                # print(os.path.join(path, name))
                with open(os.path.join(path, name), "rb") as infile:
                    outfile.write(infile.read())
                    outfile.write('\n\n'.encode('utf-8'))



    # for f in read_files:



