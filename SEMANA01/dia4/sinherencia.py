class Alumno:

    def __init__(self,nom,ema,nota):
        self.nombre = nom
        self.email = ema
        self.nota = nota

    def mostrar(self):
        print("NOMBRE : " + self.nombre)
        print("EMAIL : " + self.email)
        print("NOTA : " + str(self.nota))

class Profesor:

    def __init__(self,nom,ema,esp):
        self.nombre = nom
        self.email = ema
        self.especialidad = esp

    def mostrar(self):
        print("Nombre : " + self.nombre)
        print("Email : " + self.email)
        print("Especialidad : " + self.especialidad)

alumno1 = Alumno('cesar mayta', 'cesar@gmail.com', 20)
alumno1.mostrar()

profesor1 = Profesor('eduardo rodriguez', 'eduardo@gmail.com', 'Java')
profesor1.mostrar()