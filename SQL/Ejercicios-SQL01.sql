--Tablas EMPLE Y DEPART
--1
SELECT *
FROM EMPLE
where APELLIDO LIKE 'A%' and OFICIO LIKE '%E%';

--2
SELECT APELLIDO , OFICIO , LOC
FROM EMPLE , DEPART
WHERE OFICIO = 'ANALISTA';

--3
SELECT EMP_NO , OFICIO , SALARIO , FECHA_ALT
FROM EMPLE;

SELECT APELLIDO , OFICIO , SALARIO , FECHA_ALT
FROM EMPLE
WHERE OFICIO = (SELECT OFICIO
                FROM EMPLE
                WHERE APELLIDO = 'JIMENEZ') 
OR SALARIO >= (SELECT SALARIO
                FROM EMPLE
                WHERE APELLIDO = 'FERNANDEZ');

--4 

SELECT APELLIDO , OFICIO , SALARIO
FROM EMPLE
WHERE SALARIO = (SELECT SALARIO
                FROM EMPLE
                WHERE APELLIDO = 'FERNANDEZ');

--5

SELECT APELLIDO , OFICIO
FROM EMPLE
WHERE OFICIO = (SELECT OFICIO
                FROM EMPLE
                WHERE APELLIDO = 'JIMENEZ');

----------------Libreria-----------

--1

SELECT *
from Libreria
WHERE EJEMPLARES>=8 AND EJEMPLARES<=15;

--2

SELECT*
FROM Libreria
where ESTANTE not between 'B' and 'D';

--3

select *
from libreria 
where EJEMPLARES <(select EJEMPLARES from libreria where tema like 'medicina');

--4

SELECT tema
FROM Libreria
where EJEMPLARES not between 15 and 20;

----------------------Alumnos ,Asignatura y Notas.---------

--1

select NOMBRE
from asignaturas, alumnos 
where nombre like '%O%O%O%' and pobla ='Madrid';

--2

SELECT APENOM , nombre , nota
FROM alumnos , ASIGNATURAS , Notas
WHERE (nota>=7 AND nota<=8) AND nombre = 'FOL';

--3

SELECT APENOM , nombre , nota
FROM alumnos , asignaturas , Notas
WHERE nombre = 'Madrid' AND nota<5;

--4 

select nombre 
from asignaturas, notas 
where nota between 5 and 10;

--5

select apenom 
from alumnos 
where dni in (select dni from notas where nota=(select nota from notas where dni = (select dni from alumnos where apenom = 'Díaz Fernández. María')
and cod = (select cod from asignaturas where nombre = 'FOL')));