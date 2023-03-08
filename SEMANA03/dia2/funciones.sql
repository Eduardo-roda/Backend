--funciones
USE db_codigo_g19;
DELIMITER $
CREATE FUNCTION fn_contar_cursos(alumnoId INT)
    RETURNS INT UNSIGNED
    DETERMINISTIC
BEGIN
    DECLARE total INT UNSIGNED;

    SELECT COUNT(*) INTO total
    FROM tbl_matricula_curso mc 
    INNER JOIN tbl_matricula m ON mc.matricula_id = m.matricula_id
    WHERE m.alumno_id = alumnoId;

    RETURN total;
END
$

DELIMITER ;

select fn_contar_cursos(2);

select alumno_nombre,fn_contar_cursos(alumno_id)
from tbl_alumno;


