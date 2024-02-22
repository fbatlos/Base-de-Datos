--1-Un nuevo registro mediante una orden INSERT rellenando todos los campos.

INSERT INTO ALUMNOS4 
VALUES (99,'Francisco','Batista',SYSDATE,'12345678', 'H');

--2--Un nuevo registro mediante una orden INSERT rellenando sólo algunos campos.

INSERT INTO ALUMNOS4 
VALUES (77,'Raul','Muñoz','','12345678', 'L');

INSERT INTO ALUMNOS4 
VALUES (69,'Maricon','Tamayo',SYSDATE,'', 'G');

--3-Todos los datos de la tablas ALUMNOS  a partir de una SELECT modificando los campos adecuadamente.

INSERT INTO ALUMNOS4
SELECT COD_AL ,RTRIM(SUBSTR(NOMBRE_AL ,INSTR (NOMBRE_AL, ',')+2)) ,RTRIM(SUBSTR(NOMBRE_AL , 1,INSTR (NOMBRE_AL, ',')-1)),FECINC_AL,
SUBSTR(DNI_AL ,1,8),
SUBSTR(DNI_AL ,9)
FROM ALUMNOS;

ALTER TABLE ALUMNOS4
MODIFY APELLIDO_AL  VARCHAR2(35);

ALTER TABLE ALUMNOS4
MODIFY NOMBRE_AL  VARCHAR2(25);
