-- PROCEDIMIENTO PARA MATRICULA DE ALUMNOS
DELIMITER $

DROP PROCEDURE IF EXISTS sp_matricula_alumno
$
CREATE PROCEDURE sp_matricular_alumno(IN alumnoId INT, IN bootcampId INT, IN grupo VARCHAR(255))
BEGIN 
    --VARIABLES
    DECLARE matriculaId INT;
    DECLARE cursoId INT;
    DECLARE totalCursos INT;

    SET matriculaId = 0;
    SET cursoId = 1;
    SET totalCursos = 0;

    -- REGISTRAMOS LA MATRICULA
    INSERT INTO tbl_matricula(alumno_id,bootcamp_id,matricula_grupo) 
    VALUES (alumnoId,bootcampId,grupo);

    SELECT MAX(matricula_id) INTO matriculaId FROM tbl_matricula;

    SELECT COUNT(*) INTO totalCursos FROM tbl_curso;

    -- REGISTRAMOS LOS CURSOS A MATRICULAR POR ALUMNO
    WHILE cursoId <= totalCursos DO
        INSERT INTO tbl_matricula_curso(matricula_id,curso_id)
        VALUES (matriculaId,cursoId);

        SET cursoId = cursoId + 1;
    END WHILE;
END
$

DELIMITER ;

CALL sp_matricular_alumno(1,2,'CODIGO 2023-01');

SELECT * FROM tbl_matricula;

SELECT * FROM tbl_matricula_curso;