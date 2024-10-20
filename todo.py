import os
from fnmatch import fnmatch

sub = "AHK"
root = f'ahk/{sub}'
pattern = "*.md"

with open(f"{sub}.md", "wb") as outfile:
    for path, subdirs, files in os.walk(root):
        for name in files:
            if fnmatch(name, pattern):
                # print(os.path.join(path, name))
                with open(os.path.join(path, name), "rb") as infile:
                    outfile.write(infile.read())
                    outfile.write('\n\n'.encode('utf-8'))



    # for f in read_files:



