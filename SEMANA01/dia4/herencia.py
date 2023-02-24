class Persona:
    def __init__(self,nom,ema):
        self.nombre = nom
        self.email = ema

    def mostrarDatosPersonales(self):
        print("Nombre : " + self.nombre)
        print("Email : " + self.email)

class Alumno(Persona):
    def __init__(self, nom, ema, nota):
        super().__init__(nom, ema)
        self.nota = nota

    def mostrar(self):
        print("Nombre : " + self.nombre)
        print("Email : " + self.email)
        print("Nota : " + str(self.nota))

class Profesor(Persona):
    pass

alumno1 = Alumno('Carlos Tello', 'carlos@gmail.com', 20)
alumno1.mostrarDatosPersonales()
alumno1.mostrar()

profesor1 = Profesor('César Mayta','cesarmayta@gmail.com')
profesor1.mostrarDatosPersonales()