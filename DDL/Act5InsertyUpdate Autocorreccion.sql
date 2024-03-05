--Fco José Batista De Los Santos, Resultado : 8.5

-1--Dadas las tablas ALUM y NUEVOS, insertar en la tabla ALUM los alumnos nuevos.

DESC ALUM ;
DESC NUEVOS;

SELECT * from ALUM;
SELECT * FROM NUEVOS;

INSERT INTO ALUM
SELECT *
from NUEVOS
WHERE NOMBRE not IN (SELECT NOMBRE
                    FROM ALUM);

--ANTES
SQL> SELECT * from ALUM;

NOMBRE                     EDAD LOCALIDAD
-------------------- ---------- ---------------
JUAN                         18 COSLADA
PEDRO                        19 COSLADA
ANA                          17 ALCALA
LUISA                        18 TORREJON
MARIA                        20 MADRID
ERNESTO                      21 MADRID
RAQUEL                       19 TOLEDO
--RESULTADO
NOMBRE                     EDAD LOCALIDAD
-------------------- ---------- ---------------
JUAN                         18 COSLADA
PEDRO                        19 COSLADA
ANA                          17 ALCALA
LUISA                        18 TORREJON
MARIA                        20 MADRID
ERNESTO                      21 MADRID
RAQUEL                       19 TOLEDO
MAITE                        15 ALCALA
SOFIA                        14 ALCALA

--Nota : 10

--2-Borrar de la tabla ALUM los alumnos de la tabla ANTIGUOS.

desc ANTIGUOS;

SELECT * FROM ANTIGUOS;

SELECT NOMBRE
FROM ANTIGUOS;

DELETE FROM ALUM
WHERE NOMBRE in (SELECT NOMBRE
                FROM ANTIGUOS);

--ANTES
NOMBRE                     EDAD LOCALIDAD
-------------------- ---------- ---------------
JUAN                         18 COSLADA
PEDRO                        19 COSLADA
ANA                          17 ALCALA
LUISA                        18 TORREJON
MARIA                        20 MADRID
ERNESTO                      21 MADRID
RAQUEL                       19 TOLEDO
MAITE                        15 ALCALA
SOFIA                        14 ALCALA

--Ahora

NOMBRE                     EDAD LOCALIDAD
-------------------- ---------- ---------------
JUAN                         18 COSLADA
PEDRO                        19 COSLADA
ANA                          17 ALCALA
LUISA                        18 TORREJON
RAQUEL                       19 TOLEDO
MAITE                        15 ALCALA
SOFIA                        14 ALCALA

--Nota : 10

--3--Insertar un empleado de apellido 'SAAVEDRA' con número 2000. La fecha de alta será la actual del sistema, el SALARIO el mismo del empleado 'SALA' más el 20% y el resto de datos igual que 'SALA'.

DESC EMPLE;

SELECT
OFICIO,
DIR,
FECHA_ALT,
(SALARIO + (SALARIO*0.2)),
COMISION,
DEPT_NO
FROM EMPLE
WHERE UPPER(APELLIDO) = 'SALA';


INSERT INTO EMPLE
SELECT 2000 ,
'SAAVEDRA',
OFICIO,
DIR,
FECHA_ALT,
(SALARIO + (SALARIO*0.2)),
COMISION,
DEPT_NO
FROM EMPLE
WHERE UPPER(APELLIDO) = 'SALA';



--ANTES
 EMP_NO APELLIDO   OFICIO            DIR FECHA_ALT     SALARIO   COMISION    DEPT_NO
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------
      7369 SANCHEZ    EMPLEADO         7902 17/12/1980     104000                    20
      7499 ARROYO     VENDEDOR         7698 20/02/1980     208000      39000         30
      7521 SALA       VENDEDOR         7698 22/02/1981     162500      65000         30
      7566 JIMENEZ    DIRECTOR         7839 02/04/1981     386750                    20
      7654 MARTIN     VENDEDOR         7698 29/09/1981     162500     182000         30
      7698 NEGRO      DIRECTOR         7839 01/05/1981     370500                    30
      7782 CEREZO     DIRECTOR         7839 09/06/1981     318500                    10
      7788 GIL        ANALISTA         7566 09/11/1981     390000                    20
      7839 REY        PRESIDENTE            17/11/1981     650000                    10
      7844 TOVAR      VENDEDOR         7698 08/09/1981     195000          0         30
      7876 ALONSO     EMPLEADO         7788 23/09/1981     143000                    20
      7900 JIMENO     EMPLEADO         7698 03/12/1981     123500                    30
      7902 FERNANDEZ  ANALISTA         7566 03/12/1981     390000                    20
      7934 MU?OZ      EMPLEADO         7782 23/01/1982     169000                    10

--AHORA

    EMP_NO APELLIDO   OFICIO            DIR FECHA_AL    SALARIO   COMISION    DEPT_NO
---------- ---------- ---------- ---------- -------- ---------- ---------- ----------
      7369 SANCHEZ    EMPLEADO         7902 17/12/80     104000                    20
      7499 ARROYO     VENDEDOR         7698 20/02/80     208000      39000         30
      7521 SALA       VENDEDOR         7698 22/02/81     162500      65000         30
      7566 JIMENEZ    DIRECTOR         7839 02/04/81     386750                    20
      7654 MARTIN     VENDEDOR         7698 29/09/81     162500     182000         30
      7698 NEGRO      DIRECTOR         7839 01/05/81     370500                    30
      7782 CEREZO     DIRECTOR         7839 09/06/81     318500                    10
      7788 GIL        ANALISTA         7566 09/11/81     390000                    20
      7839 REY        PRESIDENTE            17/11/81     650000                    10
      7844 TOVAR      VENDEDOR         7698 08/09/81     195000          0         30
      7876 ALONSO     EMPLEADO         7788 23/09/81     143000                    20
      7900 JIMENO     EMPLEADO         7698 03/12/81     123500                    30
      7902 FERNANDEZ  ANALISTA         7566 03/12/81     390000                    20
      7934 MU?OZ      EMPLEADO         7782 23/01/82     169000                    10
      2000 SAAVEDRA   VENDEDOR         7698 22/02/81     195000      65000         30

--4--Modificar el número de departamento de 'SAAVEDRA'. El nuevo departamento será aquel donde hay más empleados cuyo OFICIO se 'EMPLEADO'.

SELECT DEPT_NO
FROM EMPLE
WHERE DEPT_NO = (SELECT DEPT_NO 
                FROM EMPLE
                WHERE OFICIO = 'EMPLEADO'              
		        GROUP BY DEPT_NO
                HAVING COUNT(*) =( SELECT MAX(COUNT(*)) 
				                    FROM EMPLE
                                    WHERE OFICIO = 'EMPLEADO' 
					                GROUP BY DEPT_NO) );
--DA 20

UPDATE EMPLE
SET DEPT_NO = (SELECT DEPT_NO 
                FROM EMPLE
                WHERE OFICIO = 'EMPLEADO'              
		        GROUP BY DEPT_NO
                HAVING COUNT(*) =( SELECT MAX(COUNT(*)) 
				                    FROM EMPLE
                                    WHERE OFICIO = 'EMPLEADO' 
					                GROUP BY DEPT_NO) )
WHERE APELLIDO = 'SAAVEDRA';

--Nota : 10

--5-Borrar todos los departamentos de la tabla DEPART para los cuales no existan empleados en EMPLE.

SELECT DEPT_NO 
FROM EMPLE;

DELETE from DEPART
WHERE DEPT_NO NOT IN (SELECT DEPT_NO 
			FROM EMPLE);


--ANTES
   DEPT_NO DNOMBRE        LOC
---------- -------------- --------------
        10 CONTABILIDAD   SEVILLA
        20 INVESTIGACION  MADRID
        30 VENTAS         BARCELONA
        40 PRODUCCION     BILBAO

--AHORA
   DEPT_NO DNOMBRE        LOC
---------- -------------- --------------
        10 CONTABILIDAD   SEVILLA
        20 INVESTIGACION  MADRID
        30 VENTAS         BARCELONA

--Nota : 10

--6--Modificar el nº de plazas de la tabla CENTROS con un valor igual a la mitad en aquellos centros con menos de dos profesores.**********************************************************

DESC CENTROS;
SELECT * FROM CENTROS;

DESC PROFESORES;
SELECT * FROM PROFESORES;


UPDATE CENTROS
SET NUM_PLAZAS = NUM_PLAZAS/2
WHERE COD_CENTRO IN (
    SELECT COD_CENTRO
    FROM profesores
    GROUP BY COD_CENTRO
    HAVING COUNT(COD_CENTRO) < 2
)
or COD_CENTRO NOT IN (SELECT COD_CENTRO from PROFESORES);

--Antes

COD_CENTRO	TIPO_CENTRO	NOMBRE	DIRECCION	TELEFONO	NUM_PLAZAS
10	S	IES El Quijote	Avda. Los Molinos 25	965-887654	538
15	P	CP Los Danzantes	C/Las Musas s/n	985-112322	250
22	S	IES Planeta Tierra	C/Mina 45	925-443400	300
45	P	CP Manuel Hidalgo	C/Granada 5	926-202310	220
50	S	IES Anto�ete	C/Los Toreros 21	989-406090	310

--AHORA
COD_CENTRO	TIPO_CENTRO	NOMBRE	DIRECCION	TELEFONO	NUM_PLAZAS
10	S	IES El Quijote	Avda. Los Molinos 25	965-887654	538
15	P	CP Los Danzantes	C/Las Musas s/n	985-112322	250
22	S	IES Planeta Tierra	C/Mina 45	925-443400	75
45	P	CP Manuel Hidalgo	C/Granada 5	926-202310	55
50	S	IES Anto�ete	C/Los Toreros 21	989-406090	155

--El 22 y el 45 son tan bajos pues lo he ejecutado 2 veces , la primera sin afectar al 50 y la segunda si .

--Nota : 10

--7--Eliminar los centros que no tengan personal.

DELETE FROM CENTROS
WHERE  cod_centro NOT IN (SELECT COD_CENTRO 
				FROM PROFESORES);


--AHORA
COD_CENTRO T NOMBRE                         DIRECCION
---------- - ------------------------------ --------------------------
TELEFONO   NUM_PLAZAS
---------- ----------
        10 S IES El Quijote                 Avda. Los Molinos 25
965-887654        538

        15 P CP Los Danzantes               C/Las Musas s/n
985-112322        250

        22 S IES Planeta Tierra             C/Mina 45
925-443400        300


COD_CENTRO T NOMBRE                         DIRECCION
---------- - ------------------------------ --------------------------
TELEFONO   NUM_PLAZAS
---------- ----------
        45 P CP Manuel Hidalgo              C/Granada 5
926-202310        220

--Nota : 10

--8--Añadir un nuevo profesor en la especialidad 'IDIOMA' con DNI 8790055 y de nombre 'Clara Salas',  en el centro o en los centros cuyo nº de administrativos sea 1.

 DESC PROFESORES;

INSERT INTO PROFESORES
SELECT DISTINCT P.COD_CENTRO , 8790055 , 'Clara Salas' ,'IDIOMA'
        from CENTROS C join PERSONAL P in C.COD_CENTRO = P.COD_CENTRO
        where 1 = (SELECT (COUNT(*))
                FROM personal
                WHERE FUNCION = 'ADMINISTRATIVO'
                GROUP BY COD_CENTRO);

--ANTES

COD_CENTRO        DNI APELLIDOS                      ESPECIALIDAD
---------- ---------- ------------------------------ ----------------
        10    1112345 Martinez Salas, Fernando       INFORMATICA
        10    4123005 Bueno Zarco, Elisa             MATEMATICAS
        10    4122025 Montes Garcia, M.Pilar         MATEMATICAS
        15    9800990 Ramos Ruiz, Luis               LENGUA
        15    1112345 Rivera Silvestre, Ana          DIBUJO
        15    8660990 De Lucas Fdez, M.Angel         LENGUA
        22    7650000 Ruiz Lafuente, Manuel          MATEMATICAS
        45   43526789 Serrano Laguia, Maria          INFORMATICA

--AHORA
COD_CENTRO        DNI APELLIDOS                      ESPECIALIDAD
---------- ---------- ------------------------------ ----------------
        10    1112345 Martinez Salas, Fernando       INFORMATICA
        10    4123005 Bueno Zarco, Elisa             MATEMATICAS
        10    4122025 Montes Garcia, M.Pilar         MATEMATICAS
        15    9800990 Ramos Ruiz, Luis               LENGUA
        15    1112345 Rivera Silvestre, Ana          DIBUJO
        15    8660990 De Lucas Fdez, M.Angel         LENGUA
        22    7650000 Ruiz Lafuente, Manuel          MATEMATICAS
        45   43526789 Serrano Laguia, Maria          INFORMATICA
         1    8790055 Clara Salas                    IDIOMA

--Nota : 0

--9--Borrar el personal que esté en centros de menos de 300 plazas y con menos de dos profesores.

SELECT C.COD_CENTRO
FROM CENTROS C
JOIN PERSONAL P ON C.COD_CENTRO = P.COD_CENTRO
WHERE C.NUM_PLAZAS < 300
GROUP BY C.COD_CENTRO
HAVING 2 > COUNT(P.COD_CENTRO);

SELECT * FROM PERSONAL; 


DELETE FROM PERSONAL P
WHERE COD_CENTRO in (  SELECT C.COD_CENTRO
                        FROM CENTROS C
                        JOIN PERSONAL P ON C.COD_CENTRO = P.COD_CENTRO
                        WHERE C.NUM_PLAZAS < 300
                        GROUP BY C.COD_CENTRO
                        HAVING 2 < COUNT(P.COD_CENTRO)) 
or COD_CENTRO NOT IN (SELECT COD_CENTRO from CENTROS);


--No hay fila que cumpla los requisitos.

--Nota : 5

--10 --Borrar a los profesores que estén en la tabla PROFESORES y no estén en la tabla PERSONAL.

DELETE FROM PROFESORES
WHERE NOT EXISTS (
    SELECT *
    FROM PERSONAL PER
    join PROFESORES PROF on PER.COD_CENTRO = PROF.COD_CENTRO
);

--Todos existen en ambas tablas

--Nota : 10