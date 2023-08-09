import csv
from collections import Counter
import numpy as np
import operator
import matplotlib.pyplot as plt

sourcedir = 'lotto'
resultdir = 'lotto\wyniki'
name='\lotko100'
filename = sourcedir + name +'.csv'
matrix = []
for i in range(49):
    input
    matrix.append({'n':str(i+1),'v':0})

with open(filename, 'r') as f:
    line = csv.reader(f)
    for val in line:
        for v in val:
            temp = matrix[int(v)-1]
            tempcounter = temp['v']
            tempcounter = tempcounter + 1
            matrix[int(v)-1] = {'n':v,'v':tempcounter}
x = []
y = []
for m in matrix:
    x.append(int(m['n']))
    y.append(int(m['v']))
plt.plot(x,y)
plt.grid()
plt.xlabel('Liczby')
plt.ylabel('Częstotliwość')
plt.title('Częstotliwość występowania liczb w losowaniach Lotto')
plt.show()

newmatrix = matrix.sort(key=operator.itemgetter('v'))
with open(resultdir + name+ '.txt', 'w+', newline='') as file:
    for m in matrix:
        file.write(str(m) + '\n')

