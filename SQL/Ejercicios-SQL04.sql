--Fco Batista De Los Santos 
--1 ---A partir de las tablas PROFESORES y CENTROS, realizar una consulta en la que aparezcan por cada centro y cada especialidad el nº de profesores que hay. Si el centro no tiene profesores debe aparecer un 0 en la columna nº de profesores (OUTER JOIN).

SELECT
    C.NOMBRE,
    especialidad,
	count( P.especialidad)
FROM CENTROS C
    LEFT JOIN PROFESORES P ON C.COD_CENTRO = P.COD_CENTRO 
group by C.NOMBRE , especialidad;


--2--A partir de las tablas PERSONAL y CENTROS,obtener por cada centro el código, nombre y nº de empleados. Si el centro carece de empleados, igual que en la consulta anterior (OUTER JOIN).
SELECT
    C.COD_CENTRO,
    C.NOMBRE,
	count(P.DNI)
   
FROM CENTROS C
    LEFT JOIN PROFESORES P ON C.COD_CENTRO = P.COD_CENTRO 
group by C.COD_CENTRO,
    C.NOMBRE;

--3--A partir de la tabla PROFESORES, obtener la especialidad con menos profesores.
select MIN(especialidad)
from PROFESORES;

--MIN(ESPECIALIDAD)
--DIBUJO


--4--A partir de la tabla PERSONAL, obtener por cada función el nº de empleados.

select Funcion , Count(Distinct Apellidos)
from PERSONAL
group by Funcion;

--FUNCION	COUNT(DISTINCT APELLIDOS)
--CONSERJE	        2
--PROFESOR	        8
--ADMINISTRATIVO	4

--5 Visualizar los nombres de los alumnos de la tabla ALUM que aparezcan en alguna de estas tablas: ANTIGUOS y NUEVOS.

SELECT al.nombre
FROM alum al
LEFT JOIN antiguos an ON al.nombre = an.nombre
LEFT JOIN nuevos nu ON al.nombre = nu.nombre
WHERE an.nombre IS NOT NULL OR nu.nombre IS NOT NULL;

--NOMBRE
--JUAN
--ANA
--ERNESTO
--MARIA

--6--Realizar la consulta anterior de otras maneras.

SELECT al.nombre
FROM alum al
JOIN antiguos an ON al.nombre = an.nombre
union
SELECT al.nombre
FROM alum al
JOIN nuevos nu ON al.nombre = nu.nombre;


--NOMBRE
--ANA
--ERNESTO
--JUAN
--MARIA

--7--Visualizar los nombres de los alumnos de la tabla ALUM que aparezcan en la tabla ANTIGUOS y en la tabla NUEVOS.

SELECT al.nombre
FROM alum al
JOIN antiguos an ON al.nombre = an.nombre
JOIN nuevos nu ON al.nombre = nu.nombre;

--NOMBRE
--ERNESTO


--8--Realizar la consulta anterior de otras maneras.

SELECT al.nombre
FROM alum al
right JOIN antiguos an ON al.nombre = an.nombre
right JOIN nuevos nu ON al.nombre = nu.nombre
WHERE al.nombre IS NOT NULL;

--NOMBRE
--ERNESTO

--9--Visualizar los nombres de los alumnos de la tabla ALUM que no estén en la tabla ANTIGUOS ni en la tabla NUEVOS.

select nombre
from alum
MINUS
SELECT al.nombre
FROM alum al
LEFT JOIN antiguos an ON al.nombre = an.nombre
LEFT JOIN nuevos nu ON al.nombre = nu.nombre
WHERE an.nombre IS NOT NULL OR nu.nombre IS NOT NULL;


--NOMBRE
--LUISA
--PEDRO
--RAQUEL