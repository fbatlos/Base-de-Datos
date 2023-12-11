-- Prueba
DROP TABLE Persona;

CREATE TABLE Persona
(
dni CHAR(9),
nombre VARCHAR(50),
apellidos VARCHAR(35),
frecha_nac DATE DEFAULT SYSDATE,
num_hermanos NUMBER(2),
estado_civil CHAR(1) DEFAULT 'S'
);

ALTER TABLE Persona
ADD(num_miembros NUMBER(2));
	
COMMENT ON COLUMN Persona.dni
IS 'Dato referentes al dni de los asociados';

SELECT TABLE_NAME , COMMENTS
FROM USER_TAB_COMMENTS;


DESCRIBE USER_COL_COMMENTS;
SELECT TABLE_NAME ,COLUMN_NAME , COMMENTS
FROM USER_COL_COMMENTS

ALTER TABLE Persona
MODIFY (num_hermanos NUMBER(2) DEFAULT (0),
apellidos VARCHAR(85));

ALTER TABLE Persona
DROP COLUMN num_hermanos;