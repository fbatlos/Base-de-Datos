--Francisco José Batista DE Los Santos
--Tablas EMPLE Y DEPART
--1 ----Seleccionar de la tabla EMPLE, aquellas filas cuyo APELLIDO empiece por "A" y el OFICIO tenga una "E" en cualquier posición.  --> 10
SELECT *
FROM EMPLE
where APELLIDO LIKE 'A%' 
    and OFICIO LIKE '%E%';

--2--Seleccionar el APELLIDO, OFICIO y LOCALIDAD de los empleados que son ANALISTAS. --> 2.5
SELECT APELLIDO , OFICIO , LOC
FROM EMPLE , DEPART
WHERE OFICIO = 'ANALISTA'
  AND EMPLE.DEPT_NO = DEPART.DEPT_NO; --Faltaba esto .

--3--Mostrar los empleados (nombre, oficio, salario y fecha de alta) que desempeñen el mismo oficio que "JIMENEZ" o que tengan un salario mayor o igual que "FERNANDEZ". ->10

SELECT APELLIDO , OFICIO , SALARIO , FECHA_ALT
FROM EMPLE
WHERE OFICIO = (SELECT OFICIO
                FROM EMPLE
                WHERE APELLIDO = 'JIMENEZ') 
OR SALARIO >= (SELECT SALARIO
                FROM EMPLE
                WHERE APELLIDO = 'FERNANDEZ');

--4--Mostrar en pantalla el nombre, oficio y salario de los empleados del departamento de "FERNANDEZ" que tengan su mismo salario. -> 10

SELECT APELLIDO , OFICIO , SALARIO
FROM EMPLE
WHERE SALARIO = (SELECT SALARIO
                FROM EMPLE
                WHERE APELLIDO = 'FERNANDEZ');

--5--Mostrar los nombres y oficios de los empleados que tienen el mismo trabajo que "JIMENEZ".  -> 10

SELECT APELLIDO , OFICIO
FROM EMPLE
WHERE OFICIO = (SELECT OFICIO
                FROM EMPLE
                WHERE APELLIDO = 'JIMENEZ');

----------------Libreria-----------

--1--Visualizar el tema, estante y ejemplares de las filas de LIBRERIA con ejemplares comprendidos entre 8 y 15. -> 10

SELECT *
from Libreria
WHERE EJEMPLARES>=8 AND EJEMPLARES<=15;

--2--Visualizar las columnas tema, estante y ejemplares de las filas cuyo ESTANTE no esté comprendido entre la "B" y la "D". -> 10

SELECT *
FROM Libreria
where ESTANTE not between 'B' and 'D';

--3--Visualizar con una única orden SELECT (subconsulta) todos los temas de LIBRERIA cuyo numero de ejemplares sea inferior a los que hay en "Medicina". -> 2.5

select TEMA
from libreria 
where EJEMPLARES < (select EJEMPLARES 
                    from libreria 
                    where LOWER(tema) = 'medicina');

--4--Visualizar los temas de LIBRERIA cuyo número de ejemplares no esté entre 15 y 20, ambos incluidos. -> 10


SELECT tema
FROM Libreria
where EJEMPLARES not between 15 and 20;

----------------------Alumnos ,Asignatura y Notas.---------

--1--Visualizar todas las ASIGNATURAS que contengan tres letras "o" en su nombre y tengan alumnos matriculados en "Madrid". -> 0

select DISTINCT A.cod , NOMBRE , pobla
from asignaturas A, alumnos AL , Notas N
where A.cod = N.cod 
and N.DNI = AL.DNI
and nombre like '%o%o%o%' 
and pobla ='Madrid';

--2--Visualizar los nombres de los alumnos que tengan una nota entre 7 y 8 en la asignatura "FOL". -> 5 

SELECT APENOM , nombre , nota                                   -- Para el join tienes que igualar las cosas que sean iguales .
FROM alumnos AL , ASIGNATURAS A, Notas N
WHERE A.cod = N.cod
and N.DNI = AL.DNI
and (nota>=7 AND nota<=8) AND nombre = 'FOL';

--3--Mostrar los nombres de los alumnos de Madrid que tengan alguna asignatura suspendida. -> 2.5

SELECT APENOM 
FROM alumnos AL, Notas N
WHERE N.DNI = AL.DNI
and pobla = 'Madrid' AND nota<5;

--4 --Mostrar los nombres de las asignaturas que no tengan suspensos. --> 8

SELECT NOMBRE
FROM ASIGNATURAS a
WHERE NOT EXISTS ( SELECT *       --no existe 
FROM NOTAS
WHERE a.COD = COD
AND NOTA < 5);


--5--Mostrar los nombres de los alumnos que tengan la misma nota que tiene "Diaz Fernandez, Maria" en "FOL" en alguna asignatura -> 0



SELECT DISTINCT APENOM AS NOMBRE_COMPLETO 
FROM ALUMNOS
JOIN NOTAS ON ALUMNOS.DNI = NOTAS.DNI
WHERE NOTAS.NOTA IN ( SELECT NOTA
                        FROM NOTAS
                          WHERE DNI = (SELECT DNI
                                        FROM ALUMNOS
                                         WHERE APENOM = 'Diaz Fernandez, Maria')
                          AND COD = (SELECT COD
                                       FROM ASIGNATURAS
                                         WHERE NOMBRE = 'FOL'));



-- Aprender a hacer join cuando haya 3 tablas.
--            
--Final -> 6.6428571 / 10