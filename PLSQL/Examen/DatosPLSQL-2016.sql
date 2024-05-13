REM *************** CREACION DE LAS TABLAS*******************************************************

DROP TABLE Alumnos CASCADE CONSTRAINTS;
CREATE TABLE Alumnos(
  Codigo_al		NUMBER(6)	PRIMARY KEY,
  Apellidos_al	VARCHAR2(20),
  Nombre_al		VARCHAR2(10),
  Domicilio_al	VARCHAR2(20),
  Localidad_al	VARCHAR2(10),
  Notamedia_al	NUMBER(5,2)		
);

DROP TABLE Profesores CASCADE CONSTRAINTS;
CREATE TABLE Profesores(
  Codigo_pr		NUMBER(6)	PRIMARY KEY,
  Apellidos_pr	VARCHAR2(20),
  Nombre_pr		VARCHAR2(10)		
);

DROP TABLE Asignaturas CASCADE CONSTRAINTS;
CREATE TABLE Asignaturas(
	Codigo_as		NUMBER(3) PRIMARY KEY,
	Nombre_as		VARCHAR(30),
	Profesor_as		NUMBER(3) REFERENCES Profesores(Codigo_pr),
	Notamedia_as	NUMBER(5,2)
);
	
DROP TABLE Matriculas CASCADE CONSTRAINTS;
CREATE TABLE Matriculas(
	CodAl_ma	NUMBER(3) REFERENCES Alumnos (Codigo_al),
	CodAs_ma	NUMBER(3) REFERENCES Asignaturas (Codigo_as),
	Nota_ma		NUMBER(5,2),
	Repite_ma	CHAR(1),  
	PRIMARY KEY (CodAl_ma, CodAs_ma)
);


REM *************** INSERCION DE DATOS EN LAS TABLAS*********************************************

SET LINESIZE 150
SET PAGESIZE 35


REM ********** TABLA Alumnos ********************************************************************
INSERT INTO Alumnos VALUES ( 1, 'SANOGO', 'BAFLE MOR','c/ Feria 100', 'SEVILLA', NULL);
INSERT INTO Alumnos VALUES ( 2, 'ALVAREZ CAMINO', 'JOAQUIN', 'c/ Sierpes 3', 'SEVILLA', NULL);
INSERT INTO Alumnos VALUES ( 3, 'BAENA QUINTERO', 'FRANCISCO', 'c/ Sierpes 3', 'SEVILLA', NULL);
INSERT INTO Alumnos VALUES ( 4, 'BENITEZ MORALES', 'PEDRO L.', 'c/ Sierpes 3', 'SEVILLA', NULL);
INSERT INTO Alumnos VALUES ( 5, 'BERNABEU DE LOPE', 'ARTURO', 'c/ Sierpes 3', 'SEVILLA', NULL);
INSERT INTO Alumnos VALUES ( 6, 'CASTRO EXPOSITO', 'ABRAHAM', 'c/ Sierpes 3', 'SEVILLA', NULL);
INSERT INTO Alumnos VALUES ( 7, 'CASTRO GARCIA', 'ALEJANDRO', 'c/ Real 3', 'CASTILLEJA', NULL);
INSERT INTO Alumnos VALUES ( 8, 'ESCAMILLA PEREJON', 'MANUEL', 'c/ Sierpes 3', 'SEVILLA', NULL);
INSERT INTO Alumnos VALUES ( 9, 'FRANCO DOMINGUEZ', 'DIEGO J.', 'c/ Sierpes 3', 'SEVILLA', NULL);
INSERT INTO Alumnos VALUES (10, 'GORDILLO REINA', 'ALVARO A.', 'c/ Sierpes 3', 'SEVILLA', NULL);
INSERT INTO Alumnos VALUES (11, 'HERRERO SAN ROMAN', 'ESTEBAN', 'c/ Sierpes 3', 'SEVILLA', NULL);
INSERT INTO Alumnos VALUES (12, 'JIMENEZ NAVARRO', 'DAVID', 'c/ Real 3', 'CASTILLEJA', NULL);
INSERT INTO Alumnos VALUES (13, 'LOPEZ BARBAZAN', 'MANUEL', 'c/ Sierpes 3', 'SEVILLA', NULL);
INSERT INTO Alumnos VALUES (14, 'MARIN GELO', 'JOSE M.', 'c/ Sierpes 3', 'SEVILLA', NULL);
INSERT INTO Alumnos VALUES (15, 'MAYA MILES', 'SAMUEL', 'c/ Sierpes 3', 'SEVILLA', NULL);
INSERT INTO Alumnos VALUES (16, 'MORALES LUNA', 'JORGE', 'c/ Real 3', 'CASTILLEJA', NULL);
INSERT INTO Alumnos VALUES (17, 'ORDOÑEZ BERNALDEZ', 'JAVIER', 'c/ Real 3', 'CASTILLEJA', NULL);
INSERT INTO Alumnos VALUES (18, 'PONCE RODRIGUEZ', 'JOSE M.', 'c/ Real 3', 'CASTILLEJA', NULL);
INSERT INTO Alumnos VALUES (19, 'ROMERO PEREZ', 'TERESA', 'c/ Sierpes 3', 'SEVILLA', NULL);
INSERT INTO Alumnos VALUES (20, 'RUA CONDE', 'JOAQUIN', 'c/ Sierpes 3', 'SEVILLA', NULL);


REM ********** TABLA Profesores ********************************************************************
INSERT INTO Profesores VALUES ( 1, 'RIVERA CALVETE', 'JOSE M.');
INSERT INTO Profesores VALUES ( 2, 'DEL NIDO BENAVENTE', 'JOSE M.');
INSERT INTO Profesores VALUES ( 3, 'RUIZ DE LOPERA', 'MANUEL');
     
REM ********** TABLA Asignaturas ********************************************************************
INSERT INTO Asignaturas VALUES ( 1, 'Desarrollo de interfaces', 1, NULL);
INSERT INTO Asignaturas VALUES ( 2, 'Acceso a datos', 2, NULL);
INSERT INTO Asignaturas VALUES ( 3, 'Java', 3, NULL);
COMMIT;

REM ********** TABLA Matriculas ********************************************************************

INSERT INTO Matriculas VALUES ( 2, 1, 5, 'N');
INSERT INTO Matriculas VALUES ( 3, 1, 7, 'S');
INSERT INTO Matriculas VALUES ( 4, 1, 9, 'N');
INSERT INTO Matriculas VALUES ( 5, 1, 2, 'N');
INSERT INTO Matriculas VALUES ( 6, 1, 7, 'S');
INSERT INTO Matriculas VALUES ( 7, 1, 1, 'N');
INSERT INTO Matriculas VALUES ( 8, 1, 10, 'N');
INSERT INTO Matriculas VALUES ( 9, 1, 10, 'S');
INSERT INTO Matriculas VALUES (10, 1, 8, 'N');
INSERT INTO Matriculas VALUES (12, 1, 1, 'S');
INSERT INTO Matriculas VALUES (13, 1, 6, 'N');
INSERT INTO Matriculas VALUES (14, 1, 7, 'N');
INSERT INTO Matriculas VALUES (15, 1, 8, 'S');
INSERT INTO Matriculas VALUES (16, 1, 4, 'N');
INSERT INTO Matriculas VALUES (17, 1, 7, 'N');
INSERT INTO Matriculas VALUES (18, 1, 2, 'S');
INSERT INTO Matriculas VALUES (19, 1, 8, 'N');
INSERT INTO Matriculas VALUES (20, 1, 9, 'N');
INSERT INTO Matriculas VALUES ( 1, 2, 10, 'S');
INSERT INTO Matriculas VALUES ( 2, 2, 3, 'N');
INSERT INTO Matriculas VALUES ( 3, 2, 5, 'N');
INSERT INTO Matriculas VALUES ( 4, 2, 8, 'S');
INSERT INTO Matriculas VALUES ( 5, 2, 6, 'N');
INSERT INTO Matriculas VALUES ( 6, 2, 9, 'N');
INSERT INTO Matriculas VALUES ( 7, 2, 2, 'S');
INSERT INTO Matriculas VALUES ( 8, 2, 5, 'N');
INSERT INTO Matriculas VALUES ( 9, 2, 7, 'N');
INSERT INTO Matriculas VALUES (10, 2, 8, 'S');
INSERT INTO Matriculas VALUES (12, 2, 9, 'N');
INSERT INTO Matriculas VALUES (13, 2, 8, 'S');
INSERT INTO Matriculas VALUES (14, 2, 8, 'N');
INSERT INTO Matriculas VALUES (15, 2, 4, 'N');
INSERT INTO Matriculas VALUES (16, 2, 6, 'S');
INSERT INTO Matriculas VALUES (17, 2, 8, 'N');
INSERT INTO Matriculas VALUES (18, 2, 3, 'N');
INSERT INTO Matriculas VALUES (19, 2, 3, 'S');
INSERT INTO Matriculas VALUES (20, 2, 1, 'N');
INSERT INTO Matriculas VALUES ( 1, 3, 7, 'N');
INSERT INTO Matriculas VALUES (11, 3, 3, 'S');
INSERT INTO Matriculas VALUES ( 2, 3, 6, 'N');
INSERT INTO Matriculas VALUES (12, 3, 8, 'N');
INSERT INTO Matriculas VALUES ( 3, 3, 10, 'S');
INSERT INTO Matriculas VALUES (13, 3, 4, 'N');
INSERT INTO Matriculas VALUES ( 4, 3, 5, 'N');
INSERT INTO Matriculas VALUES (14, 3, 8, 'S');


REM ********** FIN ******************************************************************************

SELECT * FROM Alumnos;
SELECT * FROM Profesores;
SELECT * FROM Asignaturas;
SELECT * FROM Matriculas;