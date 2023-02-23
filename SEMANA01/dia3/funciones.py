def suma(n1,n2):
    resultado = n1 + n2
    return resultado 

r1 = suma(3,4)
r2 = suma(r1,8)
print(r2)

#parametros args y kwargs
def sumainfinito(*args):
    resultado = 0
    for numero in args:
        resultado += numero
    return resultado

r3 = sumainfinito(3,4,5,10,20)
print(r3)

"""
def calculadora(ope,n1,n2):
    if(ope == "suma"):
        resultado = n1 + n2
    elif(ope == "resta"):
        resultado = n1 - n2
    else:
        resultado = "operador incorrecto"
    return resultado

print(calculadora('resta',14,5))
"""
def calculadora(**kwargs):
    ope = kwargs.get('ope')
    n1 = kwargs.get('n1')
    n2 = kwargs.get('n2')
    if(ope == "suma"):
        resultado = n1 + n2
    elif(ope == "resta"):
        resultado = n1 - n2
    else:
        resultado = "operador incorrecto"

    return resultado

print(calculadora(n1=5,n2=2,ope='suma'))

