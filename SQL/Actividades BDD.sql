-- Act 1 -------------------------------------------------------------------------------------------------------
--La tabla guerdará la id del departamento como numero con un maximo de 6 digitos , el nombre
--se guardará de tal forma que si los caracteres no llegan a 40 solo guardará los que esten 
--llenos.

CREATE TABLE DEPARTAMENTO 
(id_departamento NUMBER(6),
 nombre_departamento VARCHAR2(40)
);

--Act 2 --------------------------------------------------------------------------------------
CREATE TABLE EMPLEADO
(id_empleado NUMBER(6) ,
 nombre VARCHAR2 (30),
 apellidos VARCHAR2(50),
 numero_departamento NUMBER(6)
);

--Act 3----------------------------------------------------------------------------------------
ALTER TABLE EMPLEADO
MODIFY (nombre VARCHAR2(60));

--Act 4 -----------------------------------------------------------------------------------------------

DESC EMPLEADO

DESC DEPARTAMENTO

--Act 5 -----------------------------------------------------------------------------------------
--La tabla guerdará el numero de empleado como numero con un maximo de 9 digitos , el nombre
--se guardará de tal forma que si los caracteres no llegan a 30 solo guardará los que esten 
--llenos y numero departamento tendrá un maximo de 6 digitos.
CREATE TABLE EMPLEADO2
(numero_empleado NUMBER(9),
 nombre VARCHAR2(30),
 numero_departamento NUMBER(6)
);

--Act 6 ------------------------------------------------------------------------------------------

DROP TABLE EMPLEADO;

--Act 7 ------------------------------------------------------------------------------------------

RENAME EMPLEADO2 TO EMPLEADO;

--Act 8 -----------------------------------------------------------------------------------------

--todo lo comentado

--Restricciones
--Act 1------------------------

CREATE TABLE EMPLEADO
(id_empleado NUMBER(6) CONSTRAINT numero_empleado PRIMARY KEY,
 nombre VARCHAR2 (30),
 apellidos VARCHAR2(50),
 numero_departamento NUMBER(6)
);

--Act 2 -------------------------

CREATE TABLE DEPARTAMENTO 
(id_departamento NUMBER(6) CONSTRAINT id_departamento PRIMARY KEY,
 nombre_departamento VARCHAR2(40)
);

--Act 3 ---------------------------

CREATE TABLE EMPLEADO
(id_empleado NUMBER(6),
 nombre VARCHAR2 (30),
 apellidos VARCHAR2(50),
 num_departamento NUMBER(6) CONSTRAINT numero_departamento PRIMARY KEY,
CONSTRAINT EMPLEADO_num_departamento_fk FOREIGN KEY(num_departamento)
REFERENCES DEPARTAMENTO(id_departamento)
ON DELETE CASCADE
);

--Act 4 --------------------------------------

SELECT constraint_name,constraint_type , table_name
FROM user_constraints
WHERE table_name = 'EMPLEADO'; 
