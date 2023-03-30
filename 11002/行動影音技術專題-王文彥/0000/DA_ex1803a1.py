import os

def current_path():
    print("current working directory before")
    print(os.getcwd())
    print()

current_path()
os.chdir('../')
current_path()