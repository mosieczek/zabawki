# from mpmath import mp

# # ustawienie dokładności obliczeń na 100 miejsc po przecinku
# mp.dps = 100

# # obliczenie wartości liczby pi z zadaną dokładnością
# pi = mp.pi

# # wyświetlenie wyniku
# print(pi)

from mpmath import mp

# ustawienie precyzji na 200 bitów
mp.prec = 1000

# ustawienie strategii zaokrąglania na "floor", czyli zawsze w dół
mp.pretty = True
mp.rounding = "floor"

# obliczenie wartości liczby pi z zadaną dokładnością
pi = mp.pi

# wyświetlenie wyniku
print(mp.nstr(pi, 100))