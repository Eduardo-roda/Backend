-- JOINS 
-- INNER JOIN
SELECT alumno.*, asistencia.*
FROM alumno INNER JOIN asistencia 
ON alumno.id = asistencia.alumno_id;

SELECT alumno.nombre, asistencia.fecha_asistencia, asistencia.asistio
FROM alumno INNER JOIN asistencia
ON alumno.id = asistencia.alumno_id;

-- LEFT JOIN
SELECT curso.nombre, alumno_curso.nota 
FROM curso LEFT JOIN alumno_curso
ON curso.id = alumno_curso.id;

SELECT c.nombre as CURSO, AVG(ac.nota) as NOTA_PROMEDIO
FROM curso c LEFT JOIN alumno_curso ac 
ON c.id = ac.curso_id
GROUP BY c.nombre
ORDER BY AVG(ac.nota) DESC;

--RIGHT JOIN
SELECT c.nombre, COUNT(ac.alumno_id) as CANTIDAD
FROM alumno_curso ac RIGHT JOIN curso c
ON ac.curso_id = c.id
GROUP BY c.nombre;

SELECT a.nombre AS Alumno, c.nombre AS Curso, ac.nota AS Nota
FROM alumno_curso ac INNER JOIN alumno a
ON ac.alumno_id = a.id
INNER JOIN curso c 
ON ac.curso_id = c.id;

-- CREAR CONSULTA PARA RETORNAR EL NOMBRE DEL ALUMNO
-- Y EL PROMEDIO DE NOTA DE TODOS LOS CURSOS;
SELECT a.nombre AS ALUMNO, AVG(ac.nota) AS PROMEDIO
FROM alumno a INNER JOIN alumno_curso ac
ON a.id = ac.alumno_id
GROUP BY a.nombre;

-- CREAR CONSULTA PARA RETORNAR UN LISTADO DE ALUMNOS CON SUS DIFERENTES NOTAS X CURSO
-- INCLUYENDO EL PROMEDIO FINAL DE TODAS LAS NETWORK_NAMESPACE
-- EJEMPLO: DEBE TENER LAS SIGUIENTES COLUMNAS
-- ALUMNO | HTML Y CSS | JAVASCRIPT | REACT | PYTHON | MYSQL | PROMEDIO
SELECT a.nombre AS ALUMNO, 
(SELECT AVG(ac.nota) FROM alumno_curso ac WHERE ac.curso_id = 1 AND ac.alumno_id = a.id) AS 'HTML Y CSS'
FROM alumno a LIMIT 10;
--
SELECT a.nombre AS ALUMNO,
COALESCE(n1.nota,0) as 'HTML Y CSS',
COALESCE(n2.nota,0) as 'JAVASCRIPT',
COALESCE(n3.nota,0) as 'REACT',
COALESCE(n4.nota,0) as 'PYTHON',
COALESCE(n5.nota,0) as 'FLASK',
COALESCE(n6.nota,0) as 'MYSQL',
AVG(COALESCE(n.nota,0)) as PROMEDIO
FROM alumno a 
INNER JOIN alumno_curso n ON n.alumno_id = a.id
LEFT JOIN alumno_curso n1 ON n1.alumno_id = a.id AND n1.curso_id = 1
LEFT JOIN alumno_curso n2 ON n2.alumno_id = a.id AND n2.curso_id = 2
LEFT JOIN alumno_curso n3 ON n3.alumno_id = a.id AND n3.curso_id = 3
LEFT JOIN alumno_curso n4 ON n4.alumno_id = a.id AND n4.curso_id = 4
LEFT JOIN alumno_curso n5 ON n5.alumno_id = a.id AND n5.curso_id = 5
LEFT JOIN alumno_curso n6 ON n6.alumno_id = a.id AND n6.curso_id = 6
GROUP BY a.nombre, n1.nota,n2.nota,n3.nota,n4.nota,n5.nota,n6.nota;

-- TRAER  UN REPORTE DE ASISTENCIAS POR ALUMNO DE LOS PRIMEROS 3 DIAS DEL MES DE MARZO
-- DEBE TRAER LAS SIGUIENTES COLUMNAS
-- ALUMNO | 01/03/2023 | 02/03/2023 | 03/03/2023
-- CESAR  | 1          | 0          | 0
SELECT a.nombre AS ALUMNO, 
f1.asistio AS '01/03/2023',
f1.asistio AS '02/03/2023',
f1.asistio AS '03/03/2023'
FROM alumno a
LEFT JOIN asistencia f1 ON f1.alumno_id = a.id AND f1.fecha_asistencia = '2023-03-01'
LEFT JOIN asistencia f2 ON f2.alumno_id = a.id AND f2.fecha_asistencia = '2023-03-02'
LEFT JOIN asistencia f3 ON f3.alumno_id = a.id AND f3.fecha_asistencia = '2023-03-03'
LIMIT 10;