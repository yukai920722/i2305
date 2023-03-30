import csv

file = 'students.csv'

with open(file) as csvFile:

    csvReader = csv.reader(csvFile)

    datas = list(csvReader)

for data in datas:

    print(data)


