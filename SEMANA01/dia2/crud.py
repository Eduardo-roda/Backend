import os
import time
""""
alumno = {
    'nombre' : 'Cesar Mayta',
    'email' : 'cesarmayta@gmail.com',
    'celular' : '987521631'
}
"""
alumno = {}
listaAlumnos = [alumno]

ANCHO = 50

opcion = "0"
while(opcion != "5"):
    time.sleep(1)
    print("=" * ANCHO)
    print("PROGRAMA PARA MATRICULA DE ALUMNOS")
    print("="*ANCHO)
    print("""
            [1] REGISTRAR ALUMNO
            [2] MOSTRAR ALUMNOS
            [3] ACTUALIZAR ALUMNO
            [4] ELIMINAR ALUMNO
            [5] SALIR DEL PROGRAMA
            """)
    print("="*ANCHO)

    opcion = input("INGRESE UNA OPCION DEL MENU: ")
    os.system("clear")

    if(opcion == "1"):
        print("[1] REGISTRO DE ALUMNO NUEVO")
        nombre = input("NOMBRE : ")
        email = input("EMAIL : ")
        celular = input("CELULAR : ")
        dicNuevoAlumno = {
            'nombre' :nombre,
            'email' :email,
            'celular' :celular
        }
        listaAlumnos.append(dicNuevoAlumno)

    elif(opcion == "2"):
        print("[2] RELACION DE ALUMNOS")
        for dicAlumno in listaAlumnos:
            print('*' * ANCHO)
            for clave, valor in dicAlumno.items():
                print(clave + " : " + valor)
        input("PRESIONE ENTER PARA CONTINUAR....")

    elif(opcion == "3"):
        print("[3] ACTUALIZACION DE ALUMNOS")
        valorBusqueda = input('INGRESE EL EMAIL DEL ALUMNO A ACTUALIZAR : ')
        posicionBusqueda = -1
        for posicion in range(len(listaAlumnos)):
            dicAlumno = listaAlumnos[posicion]
            for clave,valor in dicAlumno.items():
                if(clave == "email" and valor == valorBusqueda):
                    posicionBusqueda = posicion
                    break
        if (posicionBusqueda == -1):
            print("NO SE ENCONTRO EL ALUMNO SOLICITADO")
        else:
            print("""ALUMNO ENCONTRADO : 
                    """ + listaAlumnos[posicionBusqueda].get("nombre") + """
                    """ + listaAlumnos[posicionBusqueda].get("email") + """
                    """ + listaAlumnos[posicionBusqueda].get("celular"))
            
            nombre = input('NUEVO NOMBRE: ')
            email = input('NUEVO EMAIL: ')
            celular = input('NUEVO CELULAR: ')

            dicAlumnoEditar = {
                'nombre' : nombre,
                'email' : email,
                'celular' : celular
            }
            listaAlumnos[posicionBusqueda] = dicAlumnoEditar
            print('ALUMNO ACTUALIZADO !!!')

    elif(opcion == "4"):
        print("[4] ELIMINACION DE ALUMNO")
        valorBusqueda = input('INGRESE EL EMAIL DEL ALUMNO A ELIMINAR : ')
        posicionBusqueda = -1
        for posicion in range(len(listaAlumnos)):
            dicAlumno = listaAlumnos[posicion]
            for clave,valor in dicAlumno.items():
                if(clave == "email" and valor == valorBusqueda):
                    posicionBusqueda = posicion
                    break
        if (posicionBusqueda == -1):
            print("NO SE ENCONTRO EL ALUMNO SOLICITADO")
        else:
            listaAlumnos.pop(posicionBusqueda)
            print("ALUMNO ELIMINADO !!!")

    elif(opcion == "5"):
        print("[5] ESTA SALIENDO DEL PROGRAMA")
    else:
        print("OPCION NO VALIDA!!!")