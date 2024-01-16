--Tablas EMPLE Y DEPART
--1 ----Seleccionar de la tabla EMPLE, aquellas filas cuyo APELLIDO empiece por "A" y el OFICIO tenga una "E" en cualquier posición.
SELECT *
FROM EMPLE
where APELLIDO LIKE 'A%' 
    and OFICIO LIKE '%E%';

--2--Seleccionar el APELLIDO, OFICIO y LOCALIDAD de los empleados que son ANALISTAS.
SELECT APELLIDO , OFICIO , LOC
FROM EMPLE , DEPART
WHERE OFICIO = 'ANALISTA';

--3--Mostrar los empleados (nombre, oficio, salario y fecha de alta) que desempeñen el mismo oficio que "JIMENEZ" o que tengan un salario mayor o igual que "FERNANDEZ".

SELECT APELLIDO , OFICIO , SALARIO , FECHA_ALT
FROM EMPLE
WHERE OFICIO = (SELECT OFICIO
                FROM EMPLE
                WHERE APELLIDO = 'JIMENEZ') 
OR SALARIO >= (SELECT SALARIO
                FROM EMPLE
                WHERE APELLIDO = 'FERNANDEZ');

--4--Mostrar en pantalla el nombre, oficio y salario de los empleados del departamento de "FERNANDEZ" que tengan su mismo salario. 

SELECT APELLIDO , OFICIO , SALARIO
FROM EMPLE
WHERE SALARIO = (SELECT SALARIO
                FROM EMPLE
                WHERE APELLIDO = 'FERNANDEZ');

--5--Mostrar los nombres y oficios de los empleados que tienen el mismo trabajo que "JIMENEZ".

SELECT APELLIDO , OFICIO
FROM EMPLE
WHERE OFICIO = (SELECT OFICIO
                FROM EMPLE
                WHERE APELLIDO = 'JIMENEZ');

----------------Libreria-----------

--1--Visualizar el tema, estante y ejemplares de las filas de LIBRERIA con ejemplares comprendidos entre 8 y 15.

SELECT *
from Libreria
WHERE EJEMPLARES>=8 AND EJEMPLARES<=15;

--2--Visualizar las columnas tema, estante y ejemplares de las filas cuyo ESTANTE no esté comprendido entre la "B" y la "D".

SELECT*
FROM Libreria
where ESTANTE not between 'B' and 'D';

--3--Visualizar con una única orden SELECT (subconsulta) todos los temas de LIBRERIA cuyo numero de ejemplares sea inferior a los que hay en "Medicina".

select *
from libreria 
where EJEMPLARES <(select EJEMPLARES from libreria where tema like 'medicina');

--4--Visualizar los temas de LIBRERIA cuyo número de ejemplares no esté entre 15 y 20, ambos incluidos.


SELECT tema
FROM Libreria
where EJEMPLARES not between 15 and 20;

----------------------Alumnos ,Asignatura y Notas.---------

--1--Visualizar todas las ASIGNATURAS que contengan tres letras "o" en su nombre y tengan alumnos matriculados en "Madrid".

select NOMBRE
from asignaturas, alumnos 
where nombre like '%O%O%O%' and pobla ='Madrid';

--2--Visualizar los nombres de los alumnos que tengan una nota entre 7 y 8 en la asignatura "FOL".

SELECT APENOM , nombre , nota
FROM alumnos , ASIGNATURAS , Notas
WHERE (nota>=7 AND nota<=8) AND nombre = 'FOL';

--3--Mostrar los nombres de los alumnos de Madrid que tengan alguna asignatura suspendida.

SELECT APENOM , nombre , nota
FROM alumnos , asignaturas , Notas
WHERE nombre = 'Madrid' AND nota<5;

--4 --Mostrar los nombres de las asignaturas que no tengan suspensos.

select nombre 
from asignaturas, notas 
where nota between 5 and 10;

--5--Mostrar los nombres de los alumnos que tengan la misma nota que tiene "Diaz Fernandez, Maria" en "FOL" en alguna asignatura

select apenom 
from alumnos 
where dni in (select dni from notas where nota=(select nota from notas where dni = (select dni from alumnos where apenom = 'Díaz Fernández. María')
and cod = (select cod from asignaturas where nombre = 'FOL')));