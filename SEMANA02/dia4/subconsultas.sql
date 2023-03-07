-- Active: 1678158717966@@127.0.0.1@3306@cursos
--SUBCONSULTAS 
SELECT nombre,nota FROM alumno
WHERE nota > (SELECT AVG(nota) FROM alumno);

--QUIEN ES EL ALUMNO QUE TIENE LA MEJOR NOTA POR PAÍS
/*
SELECT nombre, nota FROM alumno
WHERE pais = 'Peru'
AND nota >= (SELECT MAX(nota) from alumno WHERE pais = 'Peru')
*/
SELECT COUNT(*) FROM alumno
WHERE pais = 'Peru'
AND nota >= (SELECT MAX(nota) from alumno WHERE pais = 'Peru');
SELECT pais,COUNT(*) FROM alumno
WHERE nota > (SELECT AVG(nota) FROM alumno)
GROUP BY pais
ORDER BY COUNT(*) DESC;

--CREAR CONSULTA QUE RETORNE EL TOTAL DE ALUMNOS QUE SALIERON DESAPROBADOS POR PAIS 
SELECT pais, COUNT(*) FROM alumno
WHERE nota < (SELECT AVG(nota) FROM alumno)
GROUP BY pais
ORDER BY COUNT(*) DESC




