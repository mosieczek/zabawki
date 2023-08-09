from asyncore import write
from random import randint
from csv import writer 
import numpy as np

for i in range (0,100):
    newline = []
    for _ in range(6):
        value = randint(1, 49)
        newline.append(value)
    print(newline)
    x = np.array(newline)
    newlineinorder = np.sort(x)
    with open('lotto\wygenerowanelotko100.csv', 'a', newline='') as f_obj:
        writer_object = writer(f_obj)
        writer_object.writerow(newlineinorder)
        f_obj.close()