-- 1.- Visualizar los departamentos en los que el salario medio 
-- es mayor o igual que la media de todos los salarios
-- (de todos los empleados independientemente del departamento).
SELECT DEPT_NO, AVG(SALARIO) "Sal medio"
	FROM EMPLE
	GROUP BY DEPT_NO
	HAVING AVG(SALARIO) >= (SELECT  AVG(SALARIO) FROM EMPLE);
			
   DEPT_NO  Sal medio
---------- ----------
        20     282750
        10 379166,667
	
-- 2.- A partir de la tabla EMPLE, visualizar el nº de vendedores del departamento 'VENTAS'.

--Opcion1:
SELECT count(*)
	FROM emple
	WHERE dept_no = (SELECT dept_no FROM depart WHERE dnombre='VENTAS')
	and oficio = 'VENDEDOR';
	
  COUNT(*)
----------
         4

--Opcion2:	
SELECT count(*)
  FROM emple e, depart d
 WHERE e.dept_no = d.dept_no
   and dnombre='VENTAS'
   and oficio = 'VENDEDOR';

  COUNT(*)
----------
         4
		 


	
-- 3.- Partiendo de la tabla EMPLE, 
--visualizar por cada oficio de los empleados 
--del departamento 'VENTAS' la suma de sus salarios.

--Opcion1:
SELECT oficio, SUM(SALARIO)
	FROM emple
	WHERE dept_no = (select dept_no from depart WHERE dnombre='VENTAS')
	GROUP BY oficio;
	
OFICIO     SUM(SALARIO)
---------- ------------
VENDEDOR         728000
EMPLEADO         123500
DIRECTOR         370500


--Opcion2:
SELECT oficio, SUM(SALARIO)
	FROM emple e, depart d
	WHERE e.dept_no = d.dept_no
	and dnombre='VENTAS'	
	GROUP BY oficio;
		
OFICIO     SUM(SALARIO)
---------- ------------
VENDEDOR         728000
EMPLEADO         123500
DIRECTOR         370500

-- 4.- Seleccionar aquellos apellidos de la tabla EMPLE
--cuyo salario sea igual a la media de los salarios en su departamento.

-- Si lo hacemos tal cual, nos devolverá nada: 

SELECT apellido, salario
	FROM emple
	WHERE (salario,dept_no) in
	(SELECT avg(salario), dept_no FROM emple GROUP BY dept_no);
	
--Nos devuelve:
ninguna fila seleccionada	


-- Puesto que el salario de ningun empleado que tenemos en la base de datos coincide con la media de su departamento.

SELECT * FROM EMPLE;

-- Sin embargo, si introducimos un nuevo empleado en el departamento 40, donde hasta ahora no habia ningun empleado,
-- al ser un unico empleado en ese departamento, su salario medio coincidirá con el salario medio de su departamento.
-- Para ello se utiliza la sentencia INSERT que veremos en otro tema.
	
INSERT INTO EMPLE 
VALUES (8000,'GONZALO','DIRECTOR',NULL,'23/01/1982', 300000,NULL,40);
 

--Opcion1 (con subconsulta utilizando el group by y luego el IN):
SELECT apellido, salario
	FROM emple
	WHERE (salario,dept_no) in
	(SELECT avg(salario), dept_no FROM emple GROUP BY dept_no);

--Opcion2 (con subconsulta correlacionada):	
SELECT apellido, salario
	FROM EMPLE E
	WHERE SALARIO = (SELECT AVG(SALARIO)
						FROM EMPLE
						WHERE DEPT_NO = E.DEPT_NO);
						
					
						
						
-- 5.- A partir de la tabla EMPLE, 
--visualizar el nº de empleados de cada departamento 
--cuyo oficio sea 'EMPLEADO'.


--Opcion1 (agrupando por el codigo de departamento, 
-- el problema es que no mostramos el nombre del departamento)
SELECT dept_no, COUNT(*) "Nºemple"
   FROM EMPLE
   WHERE OFICIO = 'EMPLEADO'
   GROUP BY DEPT_NO;
   
      DEPT_NO    Nºemple
---------- ----------
        30          1
        20          2
        10          1

--Opcion2 (agrupando por el nombre de departamento, 
-- pero entonces necesitamos ir tambien a la tabla DEPART, consulta multitabla)
SELECT DNOMBRE, COUNT(*) "Nºemple"
	FROM EMPLE E, DEPART D
	WHERE OFICIO LIKE 'EMPLEADO'
		AND E.DEPT_NO = D.DEPT_NO
	GROUP BY DNOMBRE;
	
DNOMBRE           Nºemple
-------------- ----------
INVESTIGACION           2
VENTAS                  1
CONTABILIDAD            1


--Opcion3 (agrupando por el codigo y nombre de departamento, 
--pero aqui hay que tener cuidado de poner bien 
-- el alias para evitar ambiguedades)

SELECT E.DEPT_NO,DNOMBRE, COUNT(*) "Nºemple"
	FROM EMPLE E, DEPART D
	WHERE OFICIO LIKE 'EMPLEADO'
		AND E.DEPT_NO = D.DEPT_NO
	GROUP BY DNOMBRE, E.DEPT_NO;
	
	   DEPT_NO DNOMBRE           Nºemple
---------- -------------- ----------
        30 VENTAS                  1
        10 CONTABILIDAD            1
        20 INVESTIGACION           2

   
-- 6.- Desde la tabla EMPLE, 
--visualizar el departamento que tenga más empleados 
--cuyo oficio sea 'EMPLEADO'.


--Primero necesitamos, cuando el oficio es empleado, 
--saber cual es el numero maximo de empleados de cualquier departamento:

-- Vemos el numero de empleados de cada departamento:
SELECT DEPT_NO,COUNT(*)
    FROM EMPLE
   WHERE OFICIO = 'EMPLEADO'
GROUP BY DEPT_NO;

   DEPT_NO   COUNT(*)
---------- ----------
        30          1
        20          2
        10          1

--Calculamos el maximo:

SELECT MAX(COUNT(*))
    FROM EMPLE
   WHERE OFICIO = 'EMPLEADO'
GROUP BY DEPT_NO;

MAX(COUNT(*))
-------------
            2

-- Y finalmente hacemos la consulta completa

SELECT dept_no, COUNT(*) "Nºemple"
   FROM EMPLE
   WHERE OFICIO = 'EMPLEADO'
   GROUP BY DEPT_NO
   HAVING COUNT(*) = (SELECT MAX(COUNT(*))
						FROM EMPLE
						WHERE OFICIO = 'EMPLEADO'
						GROUP BY DEPT_NO);
						
   DEPT_NO    Nºemple
---------- ----------
        20          2									
						
					
-- 7.- A partir de las tablas EMPLE y DEPART, 
--visualizar el código y el nombre del departamento 
--que tenga más empleados cuyo oficio sea 'EMPLEADO'.

-- Es igual que el ejercicio 6, 
--simplemente hay que añadir el nombre de departamento 
--que está en la tabla DEPART,
-- y para ello hay que cruzar las tablas por el codigo 
--que tienen en coumun (el codigo de departamento), 
--y agrupar por codigo de departamento y por nombre empleado

SELECT E.DEPT_NO, DNOMBRE, COUNT(*) "Nºemple"
   FROM EMPLE E, DEPART D
   WHERE OFICIO = 'EMPLEADO'
	AND E.DEPT_NO = D.DEPT_NO
   GROUP BY E.DEPT_NO, DNOMBRE
   HAVING COUNT(*) = (SELECT MAX(COUNT(*))
						FROM EMPLE
						WHERE OFICIO = 'EMPLEADO'
						GROUP BY DEPT_NO);
						
						
   DEPT_NO DNOMBRE           Nºemple
---------- -------------- ----------
        20 INVESTIGACION           2	

	
						
-- 8.- Buscar los departamentos que tienen 
-- más de dos personas trabajando en el mismo oficio.

--Opcion1: 
SELECT DEPT_NO, OFICIO, COUNT(*) 
	FROM EMPLE 
	GROUP BY DEPT_NO, OFICIO  
	HAVING COUNT(*) > 2;
	
	
   DEPT_NO OFICIO       COUNT(*)
---------- ---------- ----------
        30 VENDEDOR            4
	

--Opcion2:

SELECT DISTINCT DEPT_NO 
	FROM EMPLE 
	GROUP BY DEPT_NO, OFICIO  
	HAVING COUNT(*) > 2;
	
	
   DEPT_NO
----------
        30

	
-- 9.- Dada la tabla LIBRERIA, visualizar por cada estante 
-- la suma de los ejemplares.

SELECT ESTANTE, SUM(EJEMPLARES)
	FROM LIBRERIA
	GROUP BY ESTANTE;
	
	
E SUM(EJEMPLARES)
- ---------------
D              16
A              36
B              28
C              33
E               6



-- 10.- Visualizar el estante con más ejemplares de la tabla LIBRERIA.


-- Para que haya dos máximos
INSERT INTO LIBRERIA VALUES ('Comics', 'C',3);

SELECT ESTANTE, SUM(EJEMPLARES)
	FROM LIBRERIA
	GROUP BY ESTANTE
	HAVING SUM(EJEMPLARES) = (SELECT MAX(SUM(EJEMPLARES))
								FROM LIBRERIA
								GROUP BY ESTANTE);	

E SUM(EJEMPLARES)
- ---------------
A              36
								
-- 11.- Visualizar los diferentes estantes de la tabla LIBRERIA 
-- ordenados descendentemente por estante.

SELECT ESTANTE 
	FROM LIBRERIA 
	GROUP BY ESTANTE
	ORDER BY ESTANTE DESC;
	
	
E
-
E
D
C
B
A



--Opcion2:
SELECT DISTINCT ESTANTE 
	FROM LIBRERIA 
	ORDER BY ESTANTE DESC;

	
-- por el nº de ejemplares
SELECT ESTANTE, SUM(EJEMPLARES)
	FROM LIBRERIA
	GROUP BY ESTANTE
	ORDER BY SUM(EJEMPLARES) DESC;
	
E SUM(EJEMPLARES)
- ---------------
A              36
C              33
B              28
D              16
E               6
	
-- 12.- Listar cuantos temas tiene cada estante.



SELECT ESTANTE, COUNT(TEMA)
	FROM LIBRERIA
	GROUP BY ESTANTE;
	
E COUNT(TEMA)
- -----------
D           2
A           3
B           2
C           3
E           1
	
-- 13.- Visualizar los estantes que tengan tres temas.

SELECT ESTANTE, COUNT(TEMA)
	FROM LIBRERIA
	GROUP BY ESTANTE
	HAVING COUNT(TEMA) = 3;

E COUNT(TEMA)
- -----------
A           3
C           3

