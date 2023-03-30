while 1:
    iu = int(input("請輸入一正整數:"))
    x=0
    if iu < 0:
        print("...所輸入非一正整數")
        continue
    for i in range(1,iu+1):
        x+=i
    print("0加到此數{}的總和數{}".format(iu,x))