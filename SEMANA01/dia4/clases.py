# Ejemplo de clases

#CREAR CLASE
class Automovil: 
    #crear atributos 
    def __init__(self,aa,pl,col,mar):
        self.__anio = aa
        self.placa = pl
        self.color = col
        self.marca = mar

    #crear metodos
    def getAnio(self):
        return self.__anio

    #crear metodos
    def encender(self):
        print('encender ' + self.marca)

    def avanzar(self):
        print('avanzar ' + self.marca) 

    def acelerar(self):
        print('acelerar ' + self.acelerar)

    def frenar(self):
        print('frenar ' + self.frenar)

#CREAR OBJETO
vw = Automovil(1970,'CH-158','Amarillo','Volkswagen')
print('se creo el objeto VW con los siguientes datos: ')
print("año : " + str(vw.getAnio()))
print("color : " + vw.color)
print("color : " + vw.placa)
print("color : " + vw.marca)
vw.encender()

print('se creo el objeto Tico con los siguientes datos: ')
tico = Automovil(1990, 'TC-2233', 'Rojo', 'Tico')
#print("Año del Tico : " + str(tico.anio))
print("Año del Tico : " + str(tico.getAnio()))
tico.acelerar

print('se creo el objeto LB con los siguientes datos: ')
lb = Automovil(2000, 'AC-5258', 'Azul', 'Lamborghini')
print("La Placa del " + lb.marca + " es " + lb.placa)
lb.frenar