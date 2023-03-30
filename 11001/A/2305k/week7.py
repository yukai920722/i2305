while 1:
    mun = input("輸入一個數字: ")
    if not num.isalnum():
            print("....輸入的值非整數值!")
        elif(int(num) % 2) == 0:
            print("{0} 是偶數".format(num))
        elif(int(num) % 2) != 0:
            print("{0} 是奇數".format(num))