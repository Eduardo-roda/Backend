""""
ingresar una lista de números y retornar el númeri ayor de la lista
Ejemplo: 
ingrese nro 1: 10
ingrese nro 2: 13
ingrese nro 3: 15
ingrese nro 4: 1
ingrese nro 5: 5

el nro mayor es 15
"""

#ENTRADA
numeros = []
for contador in range(5):
    numero = int(input("ingrese nro " + str(contador+1) + " : "))
    numeros.append(numero)

print(numeros)
#PROCESO
mayor = float("-inf")
for num in numeros:
    if (num > mayor):
        mayor = num
#SALIDA
print ("El nro mayor es : ", mayor)

numeros.sort(reverse=True)
print(numeros)
print(numeros[0])