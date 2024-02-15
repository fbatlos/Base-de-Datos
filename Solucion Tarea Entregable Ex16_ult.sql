/* SOLUCION TAREA ENTREGABLE */
START C:\Users\TomasCoronado\Downloads\Empresa_Datos_Tarea_Entregable_Ex16_ult

/************************************************************************/
1.- Hallar el número de empleados de toda la empresa.

SQL> 
SELECT COUNT(*)
FROM EMPLEADOS;
	

RESULTADO:
  COUNT(*)
----------
        34
/************************************************************************/
2.- Hallar la masa salarial (salarios+comisiones) de la empresa.

SQL>
SELECT SUM(SALARIO_EM + NVL(COMISION_EM,0)) MASA_SALARIAL 
FROM EMPLEADOS;

SELECT SUM(SALARIO_EM) + SUM(COMISION_EM) MASA_SALARIAL 
FROM EMPLEADOS;

RESULTADO:
MASA_SALARIAL
-------------
        46670
		
--No es valido lo siguiente:
SELECT SUM(SALARIO_EM + COMISION_EM) MASA_SALARIAL 
FROM EMPLEADOS;

MASA_SALARIAL
-------------
        19100



/************************************************************************/
3.- Obtener un listado que incluya el nombre de cada uno 
--de los departamentos junto al nombre de su director.

SQL>
SELECT Nombre_de, Nombre_em, Apellidos_em 
	FROM EMPLEADOS, DEPARTAMENTOS
	WHERE Director_de = Cod_em;

RESULTADO:
NOMBRE_DE                      NOMBRE_EM       APELLIDOS_EM
------------------------------ --------------- ------------------------------
PERSONAL                       DANIEL          DOMINGUEZ PACHECO
ORGANIZACION                   DANIEL          DOMINGUEZ PACHECO
SECTOR INDUSTRIAL              PABLO           GANDUL ROMERO
DIRECC. COMERCIAL              PABLO           GANDUL ROMERO
DIRECCION GENERAL              MANUEL          RUIZ DE LOPERA
SECTOR SERVICIOS               ISAAC           MARIN SALAS
FINANZAS                       ANTONIO         RODRIGUEZ MORALES
PROCESO DE DATOS               RAQUEL          RUIZ FERNANDEZ

8 filas seleccionadas.



/************************************************************************/

4.- Obtener, por orden alfabético, los nombres de los empleados cuyo salario es igual o superior al mayor de los salarios de los empleados del departamento 122.

SQL>
SELECT Nombre_em, Apellidos_em
	FROM EMPLEADOS
	WHERE SALARIO_EM >= (SELECT MAX(SALARIO_EM) 
	                       FROM EMPLEADOS 
						   WHERE Dpto_em = 122)
	ORDER BY 2, 1;
	
RESULTADO:
NOMBRE_EM       APELLIDOS_EM
--------------- ------------------------------
PABLO           GANDUL ROMERO
JOSE ANTONIO    MORENO GOMEZ
JOSE MARIA      RIVERA CALVETE
MANUEL          RUIZ DE LOPERA
RAQUEL          RUIZ FERNANDEZ

/************************************************************************/
5.- Obtener, por orden alfabético, los nombres 
y las comisiones de los empleados del departamento 110.

SQL>
SELECT Nombre_em, Apellidos_em, Comision_em
	FROM EMPLEADOS
	WHERE Dpto_em = 110
	ORDER BY 2, 1;
RESULTADO:
NOMBRE_EM       APELLIDOS_EM                   COMISION_EM
--------------- ------------------------------ -----------
ROMULO          CAMPOS SORIA
PABLO           GANDUL ROMERO                           50
SERGIO          TORO RAMIREZ

/************************************************************************/
6.- Datos de los empleados que cobran el salario máximo de su departamento.	

SQL>
SELECT Nombre_em, Apellidos_em, Salario_em
	FROM EMPLEADOS E
	WHERE Salario_em = (SELECT MAX(Salario_em) 
	                      FROM EMPLEADOS 
						  WHERE Dpto_em = E.Dpto_em);
						  
SELECT Nombre_em, Apellidos_em, Salario_em
	FROM EMPLEADOS E
	WHERE (Dpto_em, Salario_em)  IN (SELECT Dpto_em, MAX(Salario_em) 
	                                 FROM EMPLEADOS 
						          GROUP BY Dpto_em);						  
	
RESULTADO:

NOMBRE_EM       APELLIDOS_EM                   SALARIO_EM
--------------- ------------------------------ ----------
MANUEL          RUIZ DE LOPERA                       1720
JOSE MARIA      RIVERA CALVETE                       2310
JOSE            RODRIGUEZ AGUAYO                     1270
ISAAC           MARIN SALAS                          1380
PABLO           GANDUL ROMERO                        1480
ANTONIO         RODRIGUEZ MORALES                    1420
JAVIER          FERNANDEZ MONTES                     1310
RAQUEL          RUIZ FERNANDEZ                       1450

8 filas seleccionadas.

/**************************************************************************************************************/
7.- Calcular aquellos empleados que llevan más de 35 años en la empresa. Muestre todos los datos de cada uno de ellos.

SQL>
SELECT *
	FROM empleados
	WHERE months_between(SYSDATE, FechaIng_em)/12 > 35;


SELECT Cod_em, Nombre_em, Apellidos_em, trunc(months_between(SYSDATE, FechaIng_em)/12) antig
	FROM empleados
	WHERE months_between(SYSDATE, FechaIng_em)/12 > 35;
	
	RESULTADO:

    COD_EM NOMBRE_EM       APELLIDOS_EM                        ANTIG
---------- --------------- ------------------------------ ----------
       110 JOSE MARIA      RIVERA CALVETE                         39
       150 DANIEL          DOMINGUEZ PACHECO                      41


8.- Hallar, por orden de número de empleado, el nombre y el salario total (salario más comisión) de los empleados cuyo salario total supera los 1300 euros mensuales.

SQL>
SELECT nombre_em, salario_em+nvl(comision_em,0) salario_total 
	FROM empleados 
	WHERE salario_em+nvl(comision_em,0) >1300 
	ORDER BY cod_em;
	

RESULTADO:

NOMBRE_EM       SALARIO_TOTAL
--------------- -------------
JOSE MARIA               2310
ANTONIO                  1460
JOSE MANUEL              1400
DANIEL                   1440
JAVIER                   1420
PABLO                    1530
JESUS                    1380
JULIO                    1380
JOSE ANTONIO             1450
MANUEL                   1720
ISAAC                    1460
ENRIQUE                  1380
ANTONIO                  1420
ROSA MARIA               1405
MARIA PIEDAD             1370
RAQUEL                   1450
JOSE                     1350
CLAUDIA                  1400
LIVIA                    1310
CARMEN                   1310
DIANA                    1310

21 filas seleccionadas.

/**************************************************************************************************************/

9.- Mostrar para cada empleado el número de meses que lleva el empleado en la empresa junto con su nombre.

SQL>
SELECT trunc(months_between(SYSDATE, FechaIng_em))  meses, nombre_em, apellidos_em as apellidos
 FROM empleados;

RESULTADO:
     MESES NOMBRE_EM       APELLIDOS
---------- --------------- ------------------------------
       468 JOSE MARIA      RIVERA CALVETE
       244 ANTONIO         ALONSO SORIANO
       240 JOSE MANUEL     CANO GALVEZ
       492 DANIEL          DOMINGUEZ PACHECO
       243 JAVIER          FERNANDEZ MONTES
       394 PABLO           GANDUL ROMERO
       324 SONIA           GARCIA PEREZ
       360 JESUS           MANCHEÐO CAMACHO
       275 JULIO           MAQUEDA GARCIA
       263 JOSE ANTONIO    MORENO GOMEZ
       247 MANUEL          RUIZ DE LOPERA
       269 ISAAC           MARIN SALAS
       208 CONCEPCION      OCAÐA TINEO
       251 ENRIQUE         PANIAGUA VELA
       251 JOSE            RODRIGUEZ AGUAYO
       216 ANTONIO         RODRIGUEZ MORALES
       132 ROSA MARIA      ROMERO CAMPILLEJO
       203 MARIA PIEDAD    ROMERO FERNANDEZ
        53 RAQUEL          RUIZ FERNANDEZ
       244 JOSE            SALGADO PEREZ
        24 EDUARDO         SERRANO LUQUE
        13 SERGIO          SORIANO GONZALEZ
        28 SERGIO          TORO RAMIREZ
        15 LUCRECIA        SALAS LARA
         4 AZUCENA         MUÐOZ GONZALEZ
         2 CLAUDIA         FIERRO GARCIA
         2 VALERIA         MORA PEREZ
        35 LIVIA           DURAN DELGADO
        35 CARMEN          PEREZ RAMOS
        35 DIANA           PINO BUSTOS
        13 EUGENIA         TORRES VELA
        25 VICTORIA        VAZQUEZ LOPEZ
        27 ROMULO          CAMPOS SORIA
        12 SANCHO          SANTOS BONILLA

34 filas seleccionadas.

/**************************************************************************************************************/
10.- Mostrar un listado donde aparezca el código de los departamentos 
y su nombre conjuntamente con el código de los centros en donde están situados 
y el nombre de estos centros.

SQL>

 SELECT COD_DE AS COD_DEPARTAMENTO, NOMBRE_DE AS NOMBRE_DEPARTAMENTO, COD_CE AS COD_CENTRO, NOMBRE_CE NOMBRE_CENTRO 
   FROM CENTROS, DEPARTAMENTOS
  WHERE COD_CE = CENTRO_DE;
  
RESULTADO:
	   
	   
COD_DEPARTAMENTO NOMBRE_DEPARTAMENTO            COD_CENTRO NOMBRE_CENTRO
---------------- ------------------------------ ---------- ------------------------------
             100 DIRECCION GENERAL                      10 SEDE CENTRAL
             110 DIRECC. COMERCIAL                      20 SEDE ORIENTAL
             111 SECTOR INDUSTRIAL                      30 PRODUCCION
             112 SECTOR SERVICIOS                       20 SEDE ORIENTAL
             120 ORGANIZACION                           10 SEDE CENTRAL
             121 PERSONAL                               30 PRODUCCION
             122 PROCESO DE DATOS                       30 PRODUCCION
             130 FINANZAS                               10 SEDE CENTRAL

8 filas seleccionadas.


/**************************************************************************************************************/

11.- Hallar, en una consulta, los siguientes datos para cada departamento:
	a) Número de empleados.
	b) Salario medio, máximo y mínimo
	c) Media de las comisiones.

Poner un alias a las columnas que usen funciones de grupo o agregación.

SQL>
SELECT dpto_em,
		count(cod_em)  nemp,
		avg(salario_em) salmed,
		max(salario_em) salmax,
		min(salario_em) salmin,
		avg(nvl(comision_em,0)) commed
	FROM empleados
	GROUP BY dpto_em;
	
RESULTADO:
   DPTO_EM       NEMP     SALMED     SALMAX     SALMIN     COMMED
---------- ---------- ---------- ---------- ---------- ----------
       100          3 1516,66667       1720       1380          0
       121          4       1560       2310       1190          0
       120          1       1270       1270       1270          0
       112          7 1267,14286       1380       1180 84,2857143
       110          3 1298,33333       1480       1200 16,6666667
       130          3       1370       1420       1290          0
       111          8   1218,125       1310       1100      91,25
       122          5       1324       1450       1175          0

8 filas seleccionadas.	


/**************************************************************************************************************/
12.-  Calcular cuantos números de teléfono distintos usa cada departamento, mostrando el código y el nombre de cada departamento.

SQL>
SELECT dpto_em, count(DISTINCT exttel_em) num_distintos, Nombre_de
	FROM empleados, departamentos
	WHERE cod_de = dpto_em
	GROUP BY dpto_em, nombre_de;

RESULTADO:
   DPTO_EM NUM_DISTINTOS NOMBRE_DE
---------- ------------- ------------------------------
       100             3 DIRECCION GENERAL
       110             3 DIRECC. COMERCIAL
       111             4 SECTOR INDUSTRIAL
       112             5 SECTOR SERVICIOS
       120             1 ORGANIZACION
       121             3 PERSONAL
       122             4 PROCESO DE DATOS
       130             3 FINANZAS

8 filas seleccionadas.



/**************************************************************************************************************/
13.- Mostrar los departamentos (número y nombre) 
con sus centros (número y nombre) 
y la edad media de sus empleados de aquellos departamentos 
que tienen una edad media en sus empleados mayor a 35 años.

SQL>
SELECT cod_de, nombre_de, cod_ce, nombre_ce, avg(months_between(SYSDATE,fechanac_em )/12) edad_media
	FROM empleados, departamentos, centros
	WHERE dpto_em=cod_de
		AND cod_ce=centro_de
	GROUP BY cod_de, nombre_de, cod_ce, nombre_ce
	HAVING avg(months_between(SYSDATE,fechanac_em )/12)>35;
	
	
RESULTADO:
    COD_DE NOMBRE_DE                          COD_CE NOMBRE_CE                      EDAD_MEDIA
---------- ------------------------------ ---------- ------------------------------ ----------
       100 DIRECCION GENERAL                      10 SEDE CENTRAL                   45,2885419
       120 ORGANIZACION                           10 SEDE CENTRAL                   41,2043125
       121 PERSONAL                               30 PRODUCCION                      49,040334
       112 SECTOR SERVICIOS                       20 SEDE ORIENTAL                  35,5741282
       130 FINANZAS                               10 SEDE CENTRAL                   35,2087928



14.- Para cada grupo de empleados que cobran el mismo salario y tienen el mismo número de hijos, diga cuantos empleados forman el grupo y en cuantos departamentos están trabajando.

SQL>
SELECT salario_em, numhijos_em, count(cod_em) nempl, count(DISTINCT dpto_em) depdist
 FROM empleados
 GROUP BY salario_em, numhijos_em;
RESULTADO:

 SALARIO_EM NUMHIJOS_EM      NEMPL    DEPDIST
---------- ----------- ---------- ----------
      1100           0          1          1
      1200           0          1          1
      1200           1          1          1
      1300           4          1          1
      1400           0          1          1
      1175           0          1          1
      1180           0          2          1
      1185           0          1          1
      1190           1          1          1
      1210           0          2          2
      1210           1          2          2
      1215           1          1          1
      1250           2          1          1
      1270           3          1          1
      1280           0          1          1
      1280           3          1          1
      1290           2          1          1
      1290           5          1          1
      1310           2          1          1
      1310           3          1          1
      1350           1          1          1
      1380           0          1          1
      1380           2          1          1
      1380           3          1          1
      1405           2          1          1
      1420           0          1          1
      1440           0          1          1
      1450           0          1          1
      1450           1          1          1
      1480           2          1          1
      1720           6          1          1

31 filas seleccionadas.


/**************************************************************************************************************/
15.- Para cada extensión telefónica, hallar cuántos empleados la usan y el salario medio de éstos.

SQL> 
SELECT exttel_em, count(cod_em) nempl, avg(salario_em) salario_medio
	FROM empleados
	GROUP BY exttel_em;
RESULTADO:

 EXTTEL_EM      NEMPL SALARIO_MEDIO
---------- ---------- -------------
       810          1          1290
       650          1          1210
       740          1          1310
       620          2        1392,5
       880          3          1190
       450          1          1400
       340          1          1440
       250          1          1450
       220          1          1720
       410          1          1290
       610          1          1450
       500          1          1215
       360          1          1190
       350          2          1805
       840          1          1350
       750          2          1225
       550          1          1200
       508          1          1480
       200          1          1380
       850          1          1280
       760          3    1233,33333
       910          1          1270
       800          1          1380
       480          1          1420
       780          2        1142,5
       660          1          1175

26 filas seleccionadas.

/**************************************************************************************************************/
16.- Hallar el salario medio por departamento para aquellos departamentos cuyo salario máximo es inferior al salario medio de todos los empleados.

SQL>
SELECT dpto_em, avg(salario_em) salmed
	FROM empleados
	GROUP BY dpto_em
	HAVING max(salario_em) < (SELECT avg(salario_em) FROM empleados );
RESULTADO:
   DPTO_EM     SALMED
---------- ----------
       120       1270
       111   1218,125

/**************************************************************************************************************/
