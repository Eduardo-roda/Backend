-- Active: 1677891141085@@127.0.0.1@3306@cursos
--SENTENCIAS SELECT 
select DISTINCT pais FROM alumno;
SELECT nombre,email FROM alumno WHERE pais='Chile';
SELECT nombre,email,nota FROM alumno WHERE pais='Peru' AND nota > 10;
SELECT nombre,email,nota FROM alumno WHERE pais='Colombia' AND nota BETWEEN 14 AND 18;
SELECT nombre,email,nota from alumno
WHERE pais='Chile' OR pais='Venezuela';
SELECT nombre,email,nota FROM alumno
WHERE pais IN ('Chile','Peru','Ecuador');
SELECT nombre,email from alumno
WHERE pais NOT IN ('Peru');
SELECT nombre,email,pais,nota FROM alumno
WHERE nombre like 'A%';
SELECT nombre,email,pais from alumno
WHERE email like '%@gmail.com';
--SELECT DISTINCT SUBSTR(email,POSITION('@' in email),LENGTH(email)) FROM alumno LIMIT 10;
SELECT DISTINCT SUBSTR(email,POSITION('@' in email) + 1,LENGTH(email) - POSITION('@' in email)) FROM alumno LIMIT 10;


