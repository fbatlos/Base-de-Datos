-- ************ TABLAS
-- ************ datos01.sql


ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY';
SET LINESIZE 150
SET PAGESIZE 50 

-- ******** TABLA DEPART: ***********
DROP TABLE DEPART cascade constraints; 

CREATE TABLE DEPART (
 DEPT_NO NUMBER(2) NOT NULL,
 DNOMBRE VARCHAR2(14), 
 LOC VARCHAR2(14) ) ;

INSERT INTO DEPART VALUES (10,'CONTABILIDAD','SEVILLA');
INSERT INTO DEPART VALUES (20,'INVESTIGACION','MADRID');
INSERT INTO DEPART VALUES (30,'VENTAS','BARCELONA');
INSERT INTO DEPART VALUES (40,'PRODUCCION','BILBAO');
COMMIT;

-- ******** TABLA EMPLE: *************

DROP TABLE EMPLE cascade constraints; 

CREATE TABLE EMPLE (
 EMP_NO NUMBER(4) NOT NULL,
 APELLIDO VARCHAR2(10) ,
 OFICIO VARCHAR2(10) ,
 DIR NUMBER(4) ,
 FECHA_ALT DATE ,
 SALARIO NUMBER(10),
 COMISION NUMBER(10),
 DEPT_NO NUMBER(2) NOT NULL) ;

INSERT INTO EMPLE VALUES (7369,'SANCHEZ','EMPLEADO',7902,'17/12/1980', 104000,NULL,20);
INSERT INTO EMPLE VALUES (7499,'ARROYO','VENDEDOR',7698,'20/02/1980', 208000,39000,30);
INSERT INTO EMPLE VALUES (7521,'SALA','VENDEDOR',7698,'22/02/1981', 162500,65000,30);
INSERT INTO EMPLE VALUES (7566,'JIMENEZ','DIRECTOR',7839,'02/04/1981', 386750,NULL,20);
INSERT INTO EMPLE VALUES (7654,'MARTIN','VENDEDOR',7698,'29/09/1981', 162500,182000,30);
INSERT INTO EMPLE VALUES (7698,'NEGRO','DIRECTOR',7839,'01/05/1981', 370500,NULL,30);
INSERT INTO EMPLE VALUES (7782,'CEREZO','DIRECTOR',7839,'09/06/1981', 318500,NULL,10);
INSERT INTO EMPLE VALUES (7788,'GIL','ANALISTA',7566,'09/11/1981', 390000,NULL,20);
INSERT INTO EMPLE VALUES (7839,'REY','PRESIDENTE',NULL,'17/11/1981', 650000,NULL,10);
INSERT INTO EMPLE VALUES (7844,'TOVAR','VENDEDOR',7698,'08/09/1981', 195000,0,30);
INSERT INTO EMPLE VALUES (7876,'ALONSO','EMPLEADO',7788,'23/09/1981', 143000,NULL,20);
INSERT INTO EMPLE VALUES (7900,'JIMENO','EMPLEADO',7698,'03/12/1981', 123500,NULL,30);
INSERT INTO EMPLE VALUES (7902,'FERNANDEZ','ANALISTA',7566,'03/12/1981', 390000,NULL,20);
INSERT INTO EMPLE VALUES (7934,'MU�OZ','EMPLEADO',7782,'23/01/1982', 169000,NULL,10);
COMMIT;

-- ******** TABLA NOTAS_ALUMNOS: ***********

Drop table notas_alumnos cascade constraints;

create table notas_alumnos
 (
 NOMBRE_ALUMNO VARCHAR2(25) NOT NULL ,
 nota1 number(2),
 nota2 number(2),
 nota3 number(2)
 ) ;
 
insert into NOTAS_ALUMNOS VALUES ('Alcalde Garcia, M. Luisa',5,5,5);
insert into NOTAS_ALUMNOS VALUES ('Benito Martin, Luis',7,6,8);
insert into NOTAS_ALUMNOS VALUES ('Casas Martinez, Manuel',7,5,5);
insert into NOTAS_ALUMNOS VALUES ('Corregidor Sanchez, Ana',6,9,8);
insert into NOTAS_ALUMNOS VALUES ('Diaz Sanchez, Maria',NULL,NULL,7);
COMMIT;

-- ******** TABLA LIBRERIA: *************

Drop table LIBRERIA cascade constraints;

create table LIBRERIA
 (TEMA CHAR(15) NOT NULL ,
 ESTANTE CHAR(1),
 EJEMPLARES NUMBER(2)
 ) ;

INSERT INTO LIBRERIA VALUES ('Informatica', 'A',15);
INSERT INTO LIBRERIA VALUES ('Economia', 'A',10);
INSERT INTO LIBRERIA VALUES ('Deportes', 'B',8);
INSERT INTO LIBRERIA VALUES ('Filosofia', 'C',7);
INSERT INTO LIBRERIA VALUES ('Dibujo', 'C',10);
INSERT INTO LIBRERIA VALUES ('Medicina', 'C',16);
INSERT INTO LIBRERIA VALUES ('Biologia', 'A',11);
INSERT INTO LIBRERIA VALUES ('Geologia', 'D',7);
INSERT INTO LIBRERIA VALUES ('Sociedad', 'D',9);
INSERT INTO LIBRERIA VALUES ('Labores', 'B',20);
INSERT INTO LIBRERIA VALUES ('Jardineria', 'E',6);
COMMIT;

-- ******** TABLAS ALUMNOS, ASIGNATURAS, NOTAS: ***********

DROP TABLE ALUMNOS cascade constraints;

CREATE TABLE ALUMNOS
(
 DNI VARCHAR2(10) NOT NULL,
 APENOM VARCHAR2(30),
 DIREC VARCHAR2(30),
 POBLA VARCHAR2(15),
 TELEF VARCHAR2(10) 
) ;

DROP TABLE ASIGNATURAS cascade constraints;

CREATE TABLE ASIGNATURAS
(
 COD NUMBER(2) NOT NULL,
 NOMBRE VARCHAR2(25)
) ;

DROP TABLE NOTAS cascade constraints;

CREATE TABLE NOTAS
(
 DNI VARCHAR2(10) NOT NULL,
 COD NUMBER(2) NOT NULL,
 NOTA NUMBER(2)
) ;

INSERT INTO ASIGNATURAS VALUES (1,'Prog. Leng. Estr.');
INSERT INTO ASIGNATURAS VALUES (2,'Sist. Informaticos');
INSERT INTO ASIGNATURAS VALUES (3,'Analisis');
INSERT INTO ASIGNATURAS VALUES (4,'FOL');
INSERT INTO ASIGNATURAS VALUES (5,'RET');
INSERT INTO ASIGNATURAS VALUES (6,'Entornos Graficos');
INSERT INTO ASIGNATURAS VALUES (7,'Aplic. Entornos 4 Gen');

INSERT INTO ALUMNOS VALUES ('12344345','Alcalde Garcia, Elena', 'C/Las Matas, 24','Madrid','917766545');
INSERT INTO ALUMNOS VALUES ('4448242','Cerrato Vela, Luis', 'C/Mina 28 - 3A', 'Madrid','916566545');
INSERT INTO ALUMNOS VALUES ('56882942','Diaz Fernandez, Maria', 'C/Luis Vives 25', 'Mostoles','915577545');


INSERT INTO NOTAS VALUES('12344345', 1,6);
INSERT INTO NOTAS VALUES('12344345', 2,5);
INSERT INTO NOTAS VALUES('12344345', 3,6);

INSERT INTO NOTAS VALUES('4448242', 4,6);
INSERT INTO NOTAS VALUES('4448242', 5,8);
INSERT INTO NOTAS VALUES('4448242', 6,4);
INSERT INTO NOTAS VALUES('4448242', 7,5);

INSERT INTO NOTAS VALUES('56882942', 4,8);
INSERT INTO NOTAS VALUES('56882942', 5,7);
INSERT INTO NOTAS VALUES('56882942', 6,8);
INSERT INTO NOTAS VALUES('56882942', 7,9);

COMMIT;
PURGE recyclebin;
SELECT * FROM EMPLE;
SELECT * FROM DEPART;
SELECT * FROM NOTAS_ALUMNOS;
SELECT * FROM LIBRERIA;
SELECT * FROM ALUMNOS;
SELECT * FROM ASIGNATURAS;
SELECT * FROM NOTAS;
-- ******** FIN ***********************
