--Francisco José Batista de los Santo

--Autocorrección

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

--Nota : 10

----2 --------A partir de la tabla EMPLE, visualizar cuantos apellidos de empleados empiezan por la letra 'A'. 

SELECT COUNT(APELLIDO)
FROM EMPLE
WHERE UPPER(APELLIDO) LIKE 'A%';


--COUNT(APELLIDO)
---------------
--             2

---Nota: 10

--3--------------Dada la tabla EMPLE, obtén el sueldo medio, el nº de comisiones no nulas, el máximo sueldo y el mínimo sueldo de los empleados del departamento 30. Emplear el formato adecuado para la salida de las cantidades numéricas. --> 10

SELECT  TO_CHAR(AVG(SALARIO),'9G999G999D99'),
	    (MAX(SALARIO)),
		(Min(SALARIO)),
        COUNT (COMISION) 
	FROM EMPLE
	WHERE DEPT_NO = 30;

--TO_CHAR(AVG(S (MAX(SALARIO)) (MIN(SALARIO)) COUNT(COMISION)
------------- -------------- -------------- ---------------
   203.666,67         370500         123500               4

--Nota : 10

--4 --Contar los temas de LIBRERIA cuyo tema tenga, por lo menos una 'a'.

SELECT COUNT(TEMA)
FROM LIBRERIA
WHERE UPPER(TEMA) LIKE '%A%';

--COUNT(TEMA)
-----------
--        9

--Nota: 10

--5-- Visualiza los temas con mayor número de ejemplares de la tabla LIBRERIA y que tengan, al menos, una 'e' (pueden ser un tema o varios).

SELECT TEMA , ejemplares
FROM LIBRERIA
WHERE UPPER(TEMA) LIKE '%E%'
AND ejemplares >= (Select AVG(ejemplares) -- Error en el AVG , es el Max y en ese caso añadir un where de %E%
                    FROM LIBRERIA
                    );

--TEMA
---------------
--Medicina
--Labores

--Nota: 7.5

--6 --Visualiza el nº de estantes diferentes que hay en la tabla LIBRERIA.

SELECT COUNT(DISTINCT ESTANTE)
FROM LIBRERIA;

--COUNT(DISTINCTESTANTE)
----------------------
--                  5

--Nota : 10

--7 -- Visualiza el nº de estantes distintos que hay en la tabla LIBRERIA de aquellos temas que contienen, al menos, una 'e'.

SELECT COUNT(DISTINCT ESTANTE)
FROM LIBRERIA
WHERE UPPER(TEMA) LIKE '%E%';

--COUNT(DISTINCTESTANTE)
----------------------
                     5

--Nota : 10

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

--Nota: 10

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


SELECT NOMBRE , FECHANAC , 'Nació el ' || TO_CHAR(FECHANAC, 'DD')|| ' de ' || TO_CHAR(FECHANAC,'month')||'de ' || TO_CHAR(FECHANAC,'YYYY') as  FECHA_FORMATEADA 
FROM NACIMIENTOS;

--NOMBRE          FECHANAC FECHA_FORMATEADA
--------------- -------- ---------------------------------------------------------------
--PEDRO           12/05/82 Nació el 12 de mayo      de 1982
--JUAN            23/08/82 Nació el 23 de agosto    de 1982
--MARIA           02/02/83 Nació el 02 de febrero   de 1983
--CLARA           20/05/85 Nació el 20 de mayo      de 1985



--15 --Dada la tabla LIBRERIA, haz una consulta que visualice el tema, el último carácter del tema que no sea blanco y el nº de caracteres de tema (sin contar los blancos de la derecha) ordenados por tema.


Select tema ,substr(tema,instr(tema,' ')-1) as UltiCaracter,instr(tema,' ')-1 as   --*** mirar bien el instr
from libreria 
order by (tema) DESC;

--TEMA            ULTICARACTER                                                 INSTR(TEMA,'')-1AS--***MIRARBIENELINSTR
--------------- ------------------------------------------------------------ ---------------------------------------
--Informatica     a                                                                                                 11
--Economia        a                                                                                                  8
--Deportes        s                                                                                                  8
--Filosofia       a                                                                                                  9
--Dibujo          o                                                                                                  6
--Jardineria      a                                                                                                 10
--Biologia        a                                                                                                  8
--Geologia        a                                                                                                  8
--Sociedad        d                                                                                                  8
--Labores         s                                                                                                  7
--Medicina        a                                                                                                  8


--16--A partir de la tabla NACIMIENTOS, realiza una consulta que muestre NOMBRE seguido de su fecha de nacimiento formateada (quita los blancos de nombre).

SELECT NOMBRE, REPLACE(('Nació el ' || TO_CHAR(FECHANAC, 'DD')|| ' de ' || TO_CHAR(FECHANAC,'month')||'de ' || TO_CHAR(FECHANAC,'YYYY')),' ')
FROM NACIMIENTOS;

--NOMBRE          REPLACE(('NACIóEL'||TO_CHAR(FECHANAC,'DD')||'DE'||TO_CHAR(FECHA
--------------- ---------------------------------------------------------------
--PEDRO           Nacióel12demayode1982
--JUAN            Nacióel23deagostode1982
--MARIA           Nacióel02defebrerode1983
--CLARA           Nacióel20demayode1985

--17--Convierte la cadena '01072012' a fecha y visualiza el nombre del mes en mayúsculas (utiliza la tabla DUAL).

SELECT UPPER(TO_CHAR(TO_DATE('01072012'),'month')) as Mes
FROM DUAL;

--MES
----------------------------------------
--JULIO

--18 -- Visualiza aquellos temas de la tabla LIBRERIA cuyos ejemplares sean 7 con el nombre de tema 'SEVEN'; el resto de temas que no tengan 7 ejemplares se visualizará como están. Ejemplo:

SELECT TEMA, ejemplares ,DECODE(ejemplares , '7' , 'SEVEN' ,TEMA)
FROM LIBRERIA;

SELECT*from LIBRERIA;


--
--TEMA            EJEMPLARES DECODE(EJEMPLAR
--------------- ---------- ---------------
--Informatica             15 Informatica
--Economia                10 Economia
--Deportes                 8 Deportes
--Filosofia                7 SEVEN
--Dibujo                  10 Dibujo
--Medicina                16 Medicina
--Biologia                11 Biologia
--Geologia                 7 SEVEN
--Sociedad                 9 Sociedad
--Labores                 20 Labores
--Jardineria               6 Jardineria


--19--A partir de la tabla EMPLE, obtener el apellido de los empleados que lleven más de 15 años trabajando.

SELECT APELLIDO,TRUNC (MONTHS_BETWEEN (SYSDATE,FECHA_ALT)/12)
FROM EMPLE;

--APELLIDO   TRUNC(MONTHS_BETWEEN(SYSDATE,FECHA_ALT)/12)
---------- -------------------------------------------
--SANCHEZ                                             43
--ARROYO                                              43
--SALA                                                42
--JIMENEZ                                             42
--MARTIN                                              42
--NEGRO                                               42
--CEREZO                                              42
--GIL                                                 42
--REY                                                 42
--TOVAR                                               42
--ALONSO                                              42
--JIMENO                                              42
--FERNANDEZ                                           42
--MU?OZ                                               42


--20--Selecciona el apellido de los empleados que llevan más de 18 años trabajando en el departamento 'VENTAS'.

SELECT APELLIDO,TRUNC (MONTHS_BETWEEN (SYSDATE,FECHA_ALT)/12)
FROM EMPLE EM , DEPART DE
WHERE  EM.DEPT_NO = DE.DEPT_NO
AND DNOMBRE = 'VENTAS';

--APELLIDO   TRUNC(MONTHS_BETWEEN(SYSDATE,FECHA_ALT)/12)
---------- -------------------------------------------
--ARROYO                                              43
--SALA                                                42
--MARTIN                                              42
--NEGRO                                               42
--TOVAR                                               42
--JIMENO                                              42

--21--Visualiza el apellido, el salario, y el nº de departamento de los empleados cuyo salario sea el mayor de su departamento.
SELECT APELLIDO,SALARIO,DEPT_NO
FROM EMPLE E
 WHERE SALARIO    =   ( SELECT MAX (SALARIO)
					  FROM EMPLE
					 WHERE DEPT_NO = E.DEPT_NO);

--APELLIDO      SALARIO    DEPT_NO
---------- ---------- ----------
--NEGRO          370500         30
--GIL            390000         20
--REY            650000         10
--FERNANDEZ      390000         20


--22--Visualiza el apellido, el salario, y el nº de departamento de los empleados cuyo salario supere a la media de su departamento.

SELECT APELLIDO,SALARIO,DEPT_NO
FROM EMPLE E
 WHERE SALARIO    >=   ( SELECT AVG (SALARIO)
					  FROM EMPLE
					 WHERE DEPT_NO = E.DEPT_NO);

--APELLIDO      SALARIO    DEPT_NO
---------- ---------- ----------
--ARROYO         208000         30
--JIMENEZ        386750         20
--NEGRO          370500         30
--GIL            390000         20
--REY            650000         10
--FERNANDEZ      390000         20