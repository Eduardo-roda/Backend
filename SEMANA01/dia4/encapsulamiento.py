class Usuario:
    __email = 'cesar@gmail.com'
    __password = 'qwerty123'

    def __init__(self):
        pass

    def login(self,email,password):
        if(self.__email == email and self.__password == password):
            print("Bienvenido " + self.__email)
        else:
            print("datos de accseso incorrecto")

usuario1 = Usuario()
usuario1.login('cesar@gmail.com','1223')

usuario2 = Usuario()
usuario2.login('cesar@gmail.com','qwerty123')
