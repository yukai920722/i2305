
parent_dir = "D:\\"
Directory = "DMFinal"
path = os.path.join(parent_dir,Directory)
mode = 0o777
os.mkdir(path,mode)
print("directory '% s' created" % Directory)
os.chdir("D:\\DMFinal")
with open('1.txt',"w") as fp:
    fp.write("new file created")
    fp.close()
dir_list = os.listdir(path)
print("list of directories and files after creation:")
print(dir_list)
os.chdir("D:\\")
parent_dir = "D:\\DMFinal"
Directory = "D:\\DMFinal\subirctory"
path = os.path.join(parent_dir,Directory)
mode = 0o777
os.mkdir(path,mode)
print("Directory '% s' created" % Directory)
os.chdir("D:\\DMFinal\subirctory")
with open('2.txt','w') as fp:
    fp.write("new file created")
    fp.close()
dir_list = os.listdir(path)
print("list of directories and files after creation:")
print(dir_list)
os.chdir("D:\\")