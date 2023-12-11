--No NULL
CREATE TABLE alums_dam
(
dni CHAR(9),
nombre VARCHAR(50),
apellidos VARCHAR(50),
telefono CHAR(9) NOT NULL
);

-- Por si no sabes el nombre

SELECT * FROM CAT;
---------------------------------------------------------------------------------------------------------------
--Unico
CREATE TABLE Zapatero
(
num_identificativo NUMBER(3),
modelo VARCHAR(30),
color CHAR(1),
marca VARCHAR(20),
CONSTRAINT Zapatero_num_identificativo_u
UNIQUE(num_identificativo));

-------------------------------------------------------------------------------------------------------------
--Clave primaria
CREATE TABLE ZApateria
(
id_zapato VARCHAR2(9),
modelo VARCHAR2(30),
color VARCHAR2(1),
marca VARCHAR2(20),
CONSTRAINT ZApateria_pk_id_zapato_pk
PRIMARY KEY(id_zapato));

CREATE TABLE ZApateria
(
id_zapato VARCHAR2(9) CONSTRAINT ZApateria_id_zapato_pk PRIMARY KEY,
modelo VARCHAR2(30),
color VARCHAR2(1),
marca VARCHAR2(20)
);
--Para borrar restriciones  DROP TABLE Zapatero CASCADE CONSTRAINT;
--------------------------------------------------------------------------------------------------------
--Buscar las retricciones
SELECT constraint_name,constraint_type , table_name
FROM user_constraints
WHERE table_name = 'ZAPATERIA_PK'; 
-- con * te dice todo
SELECT *
FROM user_constraints
WHERE table_name = 'ZAPATERIA_PK';
--describe todas las contraints de una tabla
DESC user_constraints;
--Clave foranea 
CREATE TABLE ALUMNOS	
(dni CHAR(9),
 nombre VARCHAR2(20),
 cod_provincia NUMBER(2),
CONSTRAINT ALUMNOS_cod_provincia_fk FOREIGN KEY(cod_provincia)
REFERENCES PROVINCIAS(cod_prov)
ON DELETE CASCADE
);

CREATE TABLE PROVINCIAS
(cod_prov NUMBER(2) CONSTRAINT PROVINCIAS_cod_prov_pk PRIMARY KEY
);

-- ACT FOREIGN se necesita de 2 tablas y tiene que tener una clave primaria 

CREATE TABLE PROPIETARIOS
(dni CHAR(9) CONSTRAINT PROPIETARIOS_dni_pk PRIMARY KEY ,
 nombre VARCHAR2(20),
 apellido VARCHAR2(20),
 telefono CHAR(9)
 );
 
 CREATE TABLE MOTOCICLETAS
 (matricula CHAR(7) CONSTRAINT MOTOCICLETAS_MATRICULA_pk PRIMARY KEY ,
  marca VARCHAR2(20),
  modelo VARCHAR2(20),
  color VARCHAR2(10),
  dni_propietario CHAR(9),
CONSTRAINT PROPIETARIOS_dni_fk FOREIGN KEY(dni_propietario)
REFERENCES PROPIETARIOS(dni)
ON DELETE CASCADE);
-- Restricción tipo check (se usa para comprobar que una variable sea lo que queramos)
CREATE TABLE zapateria_CK
(id_zapato VARCHAR2(9) CONSTRAINT zapateria_marca_pk PRIMARY KEY,
marca VARCHAR2(50),
modelo VARCHAR2(50),
color VARCHAR2(9) ,
CONSTRAINT zapateria_color_ck CHECK (color
='negro'
OR color ='verde'
OR color ='azul'
OR color ='dorado'));

--SELECT = selecciona que es lo que quieres , where = filtro de donde quieres sacar la info y from = nombre de que quieres sacar .
-- Filtra con user_table
SELECT constraint_name, constraint_type , table_name
FROM user_constraints
WHERE table_name = 'ZAPATERIA_CK';
-- Con add CONSTRAINT se añade una Restricción y MODIFY modifica. 
