# 模擬抽兩張牌為10的機率
# 請 dubug

import random
def card():
    return random.randint(1,52)

def ex():
    X=card()
    Y=card()
    return X+Y==10

def simulate(experiment, times):
    success=0
    for i in range(times):
        if experiment():
            success+=1
    return success/times

#估計兩張牌總和為10的機率
print(simulate(ex,100)) #模擬抽牌100次
print(simulate(ex,1000)) #模擬抽牌1000次
print(simulate(ex,10000)) #模擬抽牌10000次
print(simulate(ex,100000)) #模擬抽牌100000次
 