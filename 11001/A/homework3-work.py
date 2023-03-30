def function(y):
    return lambda x : x * y

double = function(2)

print(double(13))