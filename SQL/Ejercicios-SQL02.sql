-----1--¿Cuál sería la salida al ejecutar estas funciones?
SELECT ABS(146),ABS(-30) --146 y 30
FROM DUAL;

SELECT CEIL(2),CEIL(1.3) ,CEIL(-2.3),CEIL(-2)-- 2,2,-2,-2
FROM DUAL;

SELECT FLOOR(-2),FLOOR(-2.3) ,FLOOR(2),FLOOR(1.3) -- -2 , -3 , 2 ,1
FROM DUAL;

SELECT MOD(22,23),MOD(10,3)-- 22,1
FROM DUAL;

SELECT POWER(10,0),	POWER(3,2)	,POWER(3,-1)	-- 1 , 9, 0,333..
FROM DUAL;

SELECT ROUND(33.67),ROUND(-33.67,2),ROUND(-33.67,-2),ROUND(-33.27,1),ROUND(-33.27,-1)-- 34 ,-33.67 ,0 , -33.3 , -30
FROM DUAL;

SELECT TRUNC(67.232),TRUNC(67.232,-2),TRUNC(67.232,2),TRUNC(67.58,1)--67 ,0 ,67.23 ,67.5
FROM DUAL;



----2 --------A partir de la tabla EMPLE, visualizar cuantos apellidos de empleados empiezan por la letra 'A'.

SELECT COUNT(APELLIDO)
FROM EMPLE
WHERE UPPER(APELLIDO) LIKE 'A%';

--COUNT(APELLIDO)
---------------
              2

--3--------------Dada la tabla EMPLE, obtén el sueldo medio, el nº de comisiones no nulas, el máximo sueldo y el mínimo sueldo de los empleados del departamento 30. Emplear el formato adecuado para la salida de las cantidades numéricas.

SELECT  TO_CHAR(AVG(SALARIO),'9G999G999D99'),
	    (MAX(SALARIO)),
		(Min(SALARIO)),
        COUNT (COMISION) 
	FROM EMPLE
	WHERE DEPT_NO = 30;

--TO_CHAR(AVG(S (MAX(SALARIO)) (MIN(SALARIO)) COUNT(COMISION)
------------- -------------- -------------- ---------------
   203.666,67         370500         123500               4

--4 --Contar los temas de LIBRERIA cuyo tema tenga, por lo menos una 'a'.

SELECT COUNT(TEMA)
FROM LIBRERIA
WHERE UPPER(TEMA) LIKE '%A%';

--COUNT(TEMA)
-----------
          9

--5-- Visualiza los temas con mayor número de ejemplares de la tabla LIBRERIA y que tengan, al menos, una 'e' (pueden ser un tema o varios).

SELECT TEMA 
FROM LIBRERIA
WHERE UPPER(TEMA) LIKE '%E%'
AND ejemplares >= (Select AVG(ejemplares)
                    FROM LIBRERIA
                    );

--TEMA
---------------
--Medicina
--Labores

--6 --Visualiza el nº de estantes diferentes que hay en la tabla LIBRERIA.

SELECT COUNT(DISTINCT ESTANTE)
FROM LIBRERIA;

--COUNT(DISTINCTESTANTE)
----------------------
                     5

--7 -- Visualiza el nº de estantes distintos que hay en la tabla LIBRERIA de aquellos temas que contienen, al menos, una 'e'.

SELECT COUNT(DISTINCT ESTANTE)
FROM LIBRERIA
WHERE UPPER(TEMA) LIKE '%E%';

--COUNT(DISTINCTESTANTE)
----------------------
                     5

--8-Dada la tabla MISTEXTOS, ¿qué sentencia SELECT se debe ejecutar para tener este resultado?
--RESULTADO
----------------------------------------
--METODOLOGÍA DE LA PROGRAMACIÓN-^-^-^-^-^
--INFORMÁTICA BÁSICA-^-^-^-^-^-^-^-^-^-^-^
--SISTEMAS OPERATIVOS-^-^-^-^-^-^-^-^-^-^-
--SISTEMAS DIGITALES-^-^-^-^-^-^-^-^-^-^-^
--MANUAL DE C-^-^-^-^-^-^-^-^-^-^-^-^-^-^-

SELECT RPAD(REPLACE(REPLACE (TITULO,'"'),'.'), 40,'-^') 
from MISTEXTOS;


--RPAD(REPLACE(REPLACE(TITULO,'"'),'.'),40,'-^')
----------------------------------------------------------------------------------------------------------------------------------------------------------------
--METODOLOGIA DE LA PROGRAMACION-^-^-^-^-^
--INFORMATICA BASICA-^-^-^-^-^-^-^-^-^-^-^
--SISTEMAS OPERATIVOS-^-^-^-^-^-^-^-^-^-^-
--SISTEMAS DIGITALES-^-^-^-^-^-^-^-^-^-^-^
--MANUAL DE C-^-^-^-^-^-^-^-^-^-^-^-^-^-^-


--9 -- Visualiza los títulos de la tabla MISTEXTOS sin los caracteres punto y comillas, y en minúsculas, de dos maneras diferentes.

SELECT REPLACE(REPLACE( LOWER(TITULO),'"'),'.')
from MISTEXTOS;

SELECT TRANSLATE(TITULO,'QWERTYUIOPASDFGHJKLÑZXCVBNM."','qwertyuiopasdfghjklñzxcvbnm')
FROM MISTEXTOS;

--REPLACE(REPLACE(LOWER(TITULO),'"'),
-----------------------------------
--metodologia de la programacion
--informatica basica
--sistemas operativos
--sistemas digitales
--manual de c


--10 --Dada la tabla LIBROS, escribe la sentencia SELECT que visualice dos columnas, una con el AUTOR y otra con el apellido del autor.

Select AUTOR , SUBSTR(AUTOR , 1,INSTR (AUTOR, ',')-1) AS APELLIDO
FROM LIBROS; 

--AUTOR                  APELLIDO
---------------------- ----------------------------------------------------------------------------------------
--CELA, CAMILO JOSE      CELA
--GORDIMER, NADINE       GORDIMER
--G.DELGADO, FERNANDO    G.DELGADO
--MARSE, JUAN            MARSE
--TORRENTE B., GONZALO   TORRENTE B.


--11-Escribe la sentencia SELECT que visualice dos columnas, una con el AUTOR y otra columna con el nombre del autor (sin el apellido) de la tabla LIBROS.


Select SUBSTR(AUTOR , INSTR (AUTOR, ',')+1) AS NOMBRE,AUTOR
FROM LIBROS; 

--NOMBRE                                                                                   AUTOR
---------------------------------------------------------------------------------------- ----------------------
 --CAMILO --JOSE                                                                          --   CELA, CAMILO JOSE
 --NADINE                                                                        --          GORDIMER, NADINE
 --FERNANDO                                                                    --            G.DELGADO, FERNANDO
 --JUAN                                                                                    --MARSE, JUAN
 --GONZALO                                                                                 --TORRENTE B., GONZALO

--12--A partir de la tabla LIBROS, realiza una consulta que visualice en una columna, primero el nombre del autor y, luego, el apellido.

Select SUBSTR(AUTOR , INSTR (AUTOR, ',')+1) AS NOMBRE , SUBSTR(AUTOR , 1,INSTR (AUTOR, ',')-1) AS APELLIDO
FROM LIBROS;

--NOMBRE                                                                                   APELLIDO
---------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------------
 --CAMILO JOSE                                                                             CELA
 --NADINE                                                                                  GORDIMER
 --FERNANDO                                                                                G.DELGADO
 --JUAN                                                                                    MARSE
 --GONZALO                                                                                 TORRENTE B.



--13--A partir de la tabla LIBROS, realiza una consulta que aparezcan los títulos ordenados por su nº de caracteres.

SELECT TITULO
FROM LIBROS
ORDER BY LENGTH (TITULO) DESC;


--TITULO
--------------------------------
--ULTIMAS TARDES CON TERESA
--LA NOVELA DE P. ANSUREZ
--LA HISTORIA DE MI HIJO
--LA MIRADA DEL OTRO
--LA COLMENA

--14 --A partir de la tabla NACIMIENTOS, realiza una consulta que obtenga las columnas NOMBRE, FECHANAC, FECHA_FORMATEADA donde FECHA_FORMATEADA tiene el siguiente formato: "Nació el 12 de mayo de 1982". 

SELECT* FROM NACIMIENTOS;

SELECT NOMBRE , FECHANAC , 'Nació el ' || TO_CHAR(FECHANAC, 'DD')|| ' de ' || TO_CHAR(FECHANAC,'month')||'de ' || TO_CHAR(FECHANAC,'YYYY') as  FECHA_FORMATEADA 
FROM NACIMIENTOS;
