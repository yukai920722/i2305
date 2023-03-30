import os
from statistics import mode
directory = "geeksforgeeks"
parent_dir = "C:\\Users\\kay92\\Desktop\\0000"
path = os.path.join(parent_dir, directory)
os.mkdir(path)
print("Directory '% s' created" % directory)
directory =  "geeks"
parent_dir = "C:\\Users\\kay92\\Desktop\\0000"
mode = 0o666
path = os.path.join(parent_dir,directory)
os.mkdir(path,mode)
print("directory '% s ' creatrd" % directory)