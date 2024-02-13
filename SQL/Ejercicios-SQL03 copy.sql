--Fco Batista De Los Santos --- Nota final = 9,42


--1--Visualizar los departamentos en los que el salario medio es mayor o igual que la media de todos los salarios.
select dept_no, avg(SALARIO) 
from EMPLE 
group by dept_no 
having avg(SALARIO) >= (select avg(SALARIO) 
                        from EMPLE);

--   DEPT_NO AVG(SALARIO)
---------- ------------
--      20       282750
--      10   379166,667

--Nota = 10

--2--A partir de la tabla EMPLE, visualizar el nº de vendedores del departamento 'VENTAS'.

select COUNT(DEPT_NO) 
from EMPLE 
group by dept_no , OFICIO
having DEPT_NO = (SELECT DEPT_NO
                    FROM DEPART
                    WHERE DNOMBRE LIKE 'VENTAS'
                    AND OFICIO LIKE 'VENDEDOR');

--COUNT(DEPT_NO)
--------------
--           4

--Nota : 10

--3--Partiendo de la tabla EMPLE, visualizar por cada oficio de los empleados del departamento 'VENTAS' la suma de sus salarios.

SELECT  DEPT_NO , SUM(SALARIO) "Suma" ,OFICIO
FROM EMPLE
GROUP BY DEPT_NO , OFICIO
HAVING DEPT_NO = (SELECT DEPT_NO
                    FROM DEPART
                    WHERE DNOMBRE = 'VENTAS');

--   DEPT_NO       Suma OFICIO
---------- ---------- ----------
--    30     370500 DIRECTOR
--    30     123500 EMPLEADO
--    30     728000 VENDEDOR

--Nota : 10

--4--Seleccionar aquellos apellidos de la tabla EMPLE cuyo salario sea igual a la media de los salarios en su departamento.

select dept_no, APELLIDO,avg(SALARIO) 
from EMPLE 
group by dept_no , APELLIDO
having avg(SALARIO) = (select avg(SALARIO) 
                        from EMPLE);

--NADA

--Nota : 10

--5--A partir de la tabla EMPLE, visualizar el nº de empleados de cada departamento cuyo oficio sea 'EMPLEADO'.


select COUNT(OFICIO), dept_no
from EMPLE 
group by dept_no  , OFICIO
having OFICIO =  'EMPLEADO';

--COUNT(OFICIO)    DEPT_NO
------------- ----------
--          2         20
--          1         30
--          1         10

--Nota : 10

--6--Desde la tabla EMPLE, visualizar el departamento que tenga más empleados cuyo oficio sea 'EMPLEADO'.

select COUNT(*), dept_no
from EMPLE
group by dept_no  , OFICIO
having OFICIO =  'EMPLEADO'
AND COUNT(OFICIO) = (SELECT MAX(COUNT(*))
                    from EMPLE
                    WHERE OFICIO LIKE 'EMPLEADO'
                    group by dept_no);

  --  COUNT(*)    DEPT_NO
----   ------ ----------
 --        2         20

 --Nota: 10

--7--A partir de las tablas EMPLE y DEPART, visualizar el código y el nombre del departamento que tenga más empleados cuyo oficio sea 'EMPLEADO'.

select dept_no,dnombre 
from depart 
where dept_no=(select dept_no 
                from emple 
                where oficio= 'EMPLEADO' 
                group by dept_no 
                having count(*)=(select max(count(*)) 
                                    from emple 
                                    where oficio='EMPLEADO'
                                    group by dept_no));


select e.dept_no , dnombre
from depart d, emple e
where e.dept_no = d.dept_no
and oficio = 'EMPLEADO'
group by e.dept_no,dnombre
having count(*) = (select max(count(*)) 
                    from emple 
                    where oficio='EMPLEADO'
                    group by dept_no);

--   DEPT_NO DNOMBRE
--  -------- --------------
--    20 INVESTIGACION

--Nota : 10

--8--Buscar los departamentos que tienen más de dos personas trabajando en el mismo oficio.

SELECT OFICIO , COUNT(APELLIDO) , DEPT_NO
FROM EMPLE
GROUP BY DEPT_NO , OFICIO
HAVING COUNT(OFICIO) > 2;

--OFICIO     COUNT(APELLIDO)    DEPT_NO
---  ------- --------------- ----------
--VENDEDOR                 4         30

--Nota : 10

--9--Dada la tabla LIBRERIA, visualizar por cada estante la suma de los ejemplares.

SELECT SUM(ejemplares) 
FROM LIBRERIA
GROUP BY estante;

--SUM(EJEMPLARES)
-----------------
--             16
--             36
--             28
--             33
--              6

--Nota : 10

--10--Visualizar el estante con más ejemplares de la tabla LIBRERIA.

SELECT estante
FROM LIBRERIA
group BY EJEMPLARES,estante 
having EJEMPLARES = (SELECT max(sum(EJEMPLARES))
                    from LIBRERIA
                    group by estante);
--E
---
--B

--Nota : 2.5 

--11--Visualizar los diferentes estantes de la tabla LIBRERIA ordenados descendentemente por estante.

SELECT DISTINCT estante
FROM LIBRERIA
ORDER BY estante DESC;

--E
---
--E
--D
--C
--B
--A

--Nota : 10

--12--Listar cuantos temas tiene cada estante.

SELECT COUNT(TEMA) , estante
FROM LIBRERIA
GROUP BY estante
ORDER BY COUNT(TEMA) ASC;

--COUNT(TEMA) E
------------- -
--          1 E
--          2 D
--          2 B
--          3 C
--          3 A

--Nota : 10 , esta igual solo que yo los ordene por gusto personal .

--13--Visualizar los estantes que tengan tres temas.

SELECT estante
FROM LIBRERIA
GROUP BY estante
HAVING COUNT(TEMA) = 3;


--E
---
--A
--C

--Nota : 10 DELETE

