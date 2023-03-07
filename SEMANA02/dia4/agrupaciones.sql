-- Active: 1678158717966@@127.0.0.1@3306@cursos
--SENTENCIAS DE AGRUPACION
select count(*) from alumno;
select COUNT(*) from alumno where pais='Peru';
SELECT sum(nota) / COUNT(*) FROM alumno;
SELECT AVG(nota) as PROMEDIO ,MIN(nota) as MINIMO ,MAX(nota) as MAXIMO from alumno;

--GROUP BY
SELECT pais,COUNT(*) as CANTIDAD from alumno
GROUP BY pais
ORDER BY COUNT(*) DESC;
SELECT pais,COUNT(*) as CANTIDAD from alumno
WHERE pais IN ('Peru','Chile')
GROUP BY pais
ORDER BY COUNT(*) DESC;
--CREAR CONSULTA QUE RETORNE LA NOTA PROMEDIO POR PAIS MIN Y MAX DE ALUMNOS APROBADOS
SELECT pais, AVG(nota) as PROMEDIO, MIN(nota) as MINIMO, MAX(nota) as MAXIMO 
FROM alumno
WHERE nota > 10 
GROUP BY pais
ORDER BY AVG(nota) DESC;
SELECT pais, AVG(nota) as PROMEDIO, MIN(nota) as MINIMO, MAX(nota) as MAXIMO 
FROM alumno
WHERE nota > 10 
GROUP BY pais
HAVING AVG(nota) <= 16
ORDER BY AVG(nota) DESC
