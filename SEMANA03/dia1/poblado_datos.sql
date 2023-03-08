--POBLADO DE DATOS PARA DB_CODIGO_G19
--CURSOS    
INSERT INTO tbl_curso(curso_nombre) VALUES ('HTML Y CSS'),('JAVASCRIPT'),('REACT.JS'),('PYTHON'),('FLASK'),('MYSQL');
SELECT * FROM tbl_curso;

-- BOOTCAMP
INSERT INTO tbl_bootcamp(bootcamp_nombre) VALUES ('Desarrollo Web Fullstack'),('Desarrollo Web con Laravel'),('Desarrollo Web con MERN'),('Desarrollo Web con Flutter');

-- ALUMNO
INSERT INTO tbl_alumno(alumno_nombre,alumno_email,alumno_celular) 
VALUES ('Eduardo Rodriguez','eduardo@gmail.com','963963963'),
('Cesar Mayta','cesar@gmail.com','852741963'),
('Jesus Neyra', 'jesus@gmail.com','963815753');

-- MATRICULA
INSERT INTO tbl_matricula(matricula_grupo,alumno_id,bootcamp_id)
VALUES ('CODIGO G19',1,1),('CODIGO G19',2,1);
select * from tbl_matricula;

-- MATRICULA_CURSO
INSERT INTO tbl_matricula_curso(matricula_id,curso_id)
VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),
(2,1),(2,2),(2,3),(2,4),(2,5),(2,6);

--probamos la consulta inicial
select a.alumno_nombre as nombre,a.alumno_email as email,a.alumno_celular as celular,
b.bootcamp_nombre,
CASE
    WHEN count(c1.curso_nombre) >= 1 THEN "HTML Y CSS"
    ELSE ""
END as Curso1,
CASE
    WHEN count(c2.curso_nombre) >= 1 THEN "JAVASCRIPT"
    ELSE ""
END as Curso2
from tbl_alumno a
INNER JOIN tbl_matricula m ON m.alumno_id = a.alumno_id
INNER JOIN tbl_bootcamp b ON m.bootcamp_id = b.bootcamp_id
INNER JOIN tbl_matricula_curso mc on mc.matricula_id = m.matricula_id
LEFT JOIN tbl_curso c1 ON mc.curso_id = c1.curso_id and c1.curso_id = 1
LEFT JOIN tbl_curso c2 ON mc.curso_id = c2.curso_id and c2.curso_id = 2
GROUP BY a.alumno_nombre,a.alumno_email,a.alumno_celular,b.bootcamp_nombre
