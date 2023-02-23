#Abrir archivos con permisos de escritura
f = open('alumnos.txt','w')
f.write('cesar mayta, cesarmayta@gmail.com,96385271')
f.write('\nana lopez, ana@gmail.com,96385271')
f.close()

#Abrir archivo en modo append para adicionar informacion
fa = open('alumnos.txt','a')
fa.write('\n')
fa.write('jorge perez,jorge@gmail.com,852741963')
fa.close()

#Abrir archivo con permisos de lectura
fr = open('alumnos.txt','r')
dataAlumnos = fr.read()
print(dataAlumnos)
fr.close()
print(type(dataAlumnos))

#Convertir text en una lista de diccionarios
listaAlumnos = dataAlumnos.splitlines()
print(listaAlumnos)
print(type(listaAlumnos))
print(listaAlumnos[0])

#Convertir una lista de alumnos a un diccionario de datos 
listaAlumnosFinal = []
for strAlumno in listaAlumnos:
    listaAlumnoIndividual = strAlumno.split(',')
    #print(listaAlumnoIndividual)
    dicAlumno = {
        'nombre' : listaAlumnoIndividual[0],
        'email' : listaAlumnoIndividual[1],
        'celular' : listaAlumnoIndividual[2]
    }
    listaAlumnosFinal.append(dicAlumno)

print(listaAlumnosFinal)