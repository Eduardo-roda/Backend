-- Active: 1678158717966@@127.0.0.1@3306@cursos
--RELACIONES
--RELACION DE UNO A MUCHOS 
CREATE TABLE IF NOT EXISTS alumno(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(200),
    nota DOUBLE DEFAULT 0
);

CREATE TABLE IF NOT EXISTS asistencia(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    alumno_id INT NOT NULL,
    fecha_asistencia DATE NOT NULL,
    asistio TINYINT(1) DEFAULT 1,
    FOREIGN KEY (alumno_id) REFERENCES alumno(id)
);

INSERT INTO asistencia(alumno_id,fecha_asistencia,asistio)
VALUES 
(1,CURDATE(),1),
(2,CURDATE(),1),
(3,CURDATE(),0),
(4,CURDATE(),1),
(5,CURDATE(),1),
(6,CURDATE(),0),
(7,CURDATE(),1),
(8,CURDATE(),0),
(9,CURDATE(),1),
(10,CURDATE(),1);

--INTEGRIDAD REFERENCIAL
INSERT INTO asistencia(alumno_id,fecha_asistencia,asistio)
VALUES (0,CURDATE(),1);

DELETE FROM alumno WHERE ID = 10;

--RELACIONES DE UNO A UNO 
INSERT INTO asistencia(alumno_id,fecha_asistencia,asistio)
VALUES 
(1,'2023-02-28',1),
(1,'2023-03-02',0);

SELECT * FROM asistencia 
WHERE alumno_id  = 1 ORDER BY fecha_asistencia ASC;

CREATE TABLE IF NOT EXISTS usuario(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    usuario_nombre VARCHAR(20) NOT NULL UNIQUE,
    usuario_password VARCHAR(20) NOT NULL 
);
/*
CREATE TABLE IF NOT EXISTS alumno(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(200),
    nota DOUBLE DEFAULT 0,
    usuario_id INT,
    FOREIGN KEY(usuario_id) REFERENCES usuario(id)
);
*/

ALTER TABLE alumno 
ADD COLUMN usuario_id INT UNIQUE;
INSERT INTO usuario(usuario_nombre,usuario_password)
VALUES('admin','admin');
ALTER TABLE alumno 
ADD CONSTRAINT fk_alumno_usuario FOREIGN KEY(usuario_id) REFERENCES usuario(id);

--LE AGREGAMOS UNIQUE PARA QUE EL USUARIO NO SE REPITA EN LA TABLA ALUMNO
ALTER TABLE alumno 
MODIFY COLUMN usuario_id INT UNIQUE;