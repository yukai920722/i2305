while 1:
    iu = input("請輸入一個整數值")
    try:
        if int(iu) == 0:
            print("我是零")
        elif int(iu) < 0:
            print("...是負數")
        elif (int(iu) % 2) == 0:
            print("{}是偶數".format(iu))
        elif (int(iu) % 2) != 0:
            print("{}是奇數".format(iu))
    except:
        if not iu.isalnum():
            print("...輸入的不適整數")