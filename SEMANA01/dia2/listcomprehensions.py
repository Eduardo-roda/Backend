"""
numero = [1,2,3,4,5,6,7,8,9,10]
retorna una lista solo con los numeros pares

para sacar el residuo de un numero se usa %
4 % 2 = 0
"""

#ENTRADA 
numeros = [1,2,3,4,5,6,7,8,9,10]
pares = []
for num in numeros:
    if (num % 2 == 0):
        pares.append(num)

print(pares)


#usando list comprehensions
pares = [num for num in numeros if num % 2 == 0]
print (pares)