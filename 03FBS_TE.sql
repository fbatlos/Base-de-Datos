--Fco José Batista de los Santos.
--1.- Hallar el n�mero de empleados de toda la empresa.

SELECT DISTINCT D.Centro_de , Nombre_ce , count(Apellidos_em)
FROM EMPLEADOS E, CENTROS C, DEPARTAMENTOS D
WHERE D.Centro_de = C.Cod_ce 
AND D.Cod_de = E.Dpto_em
GROUP BY Centro_de , Nombre_ce;


--Resultado  : 
-- CENTRO_DE NOMBRE_CE                      COUNT(APELLIDOS_EM)
------------ ------------------------------ -------------------
--        30 PRODUCCION                                      17
--        20 SEDE ORIENTAL                                   10
--        10 SEDE CENTRAL                                     7

--2- Hallar la masa salarial (salarios+comisiones) de la empresa.

SELECT (sum(Salario_em) + sum(Comision_em))as masa 
FROM EMPLEADOS;

--      MASA
------------
--     46670

--3 - Obtener un listado que incluya el nombre de cada uno de los departamentos 
--junto al nombre y apellidos de su director.

SELECT Nombre_de , Nombre_em ,Apellidos_em
FROM departamentos D , empleados E 
WHERE E.Cod_em = D.Director_de
GROUP BY Nombre_de ,Nombre_em , Apellidos_em;

--Resultado : 
--NOMBRE_DE                      NOMBRE_EM       APELLIDOS_EM
------------------------------ --------------- ------------------------------
--PERSONAL                       DANIEL          DOMINGUEZ PACHECO
--SECTOR SERVICIOS               ISAAC           MARIN SALAS
--SECTOR INDUSTRIAL              PABLO           GANDUL ROMERO
--ORGANIZACION                   DANIEL          DOMINGUEZ PACHECO
--DIRECC. COMERCIAL              PABLO           GANDUL ROMERO
--PROCESO DE DATOS               RAQUEL          RUIZ FERNANDEZ
--DIRECCION GENERAL              MANUEL          RUIZ DE LOPERA
--FINANZAS                       ANTONIO         RODRIGUEZ MORALES



--4--- Obtener, por orden alfab�tico, los nombres y apellidos de los empleados cuyo salario es igual o superior al mayor de los salarios de los empleados del departamento 122.


SELECT Nombre_em , APELLIDOS_EM , Salario_em
FROM EMPLEADOS
WHERE Salario_em >= (SELECT max(Salario_em)
                        FROM EMPLEADOS
                        WHERE Dpto_em = '122')
ORDER BY Nombre_em ASC;


--Resultado :

NOMBRE_EM       APELLIDOS_EM                   SALARIO_EM
--------------- ------------------------------ ----------
JOSE ANTONIO    MORENO GOMEZ                         1450
JOSE MARIA      RIVERA CALVETE                       2310
MANUEL          RUIZ DE LOPERA                       1720
PABLO           GANDUL ROMERO                        1480
RAQUEL          RUIZ FERNANDEZ                       1450

--5-- Obtener, por orden alfab�tico, los nombres, apellidos y las comisiones de los empleados del departamento 110.

SELECT Nombre_em , APELLIDOS_EM , Comision_em
FROM EMPLEADOS
WHERE Dpto_em = '110'
ORDER BY Nombre_em ASC;

NOMBRE_EM       APELLIDOS_EM                   COMISION_EM
--------------- ------------------------------ -----------
PABLO           GANDUL ROMERO                           50
ROMULO          CAMPOS SORIA
SERGIO          TORO RAMIREZ

--6 Datos de los empleados que cobran el salario m�ximo de su departamento.

SELECT Cod_de,Nombre_em
FROM empleados E, departamentos D
WHERE E.Dpto_em = D.Cod_de
AND Salario_em = (SELECT max(Salario_em)
                    FROM EMPLEADOS
                    )
GROUP BY Cod_de,Nombre_em;--***************************


--7 Calcular aquellos empleados que llevan m�s de 35 a�os en la empresa.Muestre todos los datos de cada uno de ellos.

SELECT * 
FROM EMPLEADOS
WHERE (MONTHS_BETWEEN (SYSDATE, FechaIng_em)/12) > 35;

    --Resultado:  
    COD_EM    DPTO_EM  EXTTEL_EM FECHANAC FECHAING SALARIO_EM COMISION_EM NUMHIJOS_EM APELLIDOS_EM                   NOMBRE_EM
---------- ---------- ---------- -------- -------- ---------- ----------- ----------- ------------------------------ ---------------
       110        121        350 10/11/64 10/02/85       2310                       3 RIVERA CALVETE                 JOSE MARIA
       150        121        340 10/08/65 15/01/83       1440                       0 DOMINGUEZ PACHECO              DANIEL


--8  Hallar, por orden de n�mero de empleado, el nombre, apellidos y el salario total (salario m�s comisi�n)de los empleados cuyo salario total supera los 1300 euros mensuales.

SELECT Nombre_em , Apellidos_em , (Salario_em+Comision_em) as salariototal , Cod_em
from empleados
WHERE (SALARIO_EM+Comision_em)> 1300
ORDER BY cod_em ASC;

NOMBRE_EM       APELLIDOS_EM                   SALARIOTOTAL     COD_EM
--------------- ------------------------------ ------------ ----------
ANTONIO         ALONSO SORIANO                         1460        120
JOSE MANUEL     CANO GALVEZ                            1400        130
JAVIER          FERNANDEZ MONTES                       1420        160
PABLO           GANDUL ROMERO                          1530        180
JULIO           MAQUEDA GARCIA                         1380        240
ISAAC           MARIN SALAS                            1460        270
MARIA PIEDAD    ROMERO FERNANDEZ                       1370        330
JOSE            SALGADO PEREZ                          1350        360
LIVIA           DURAN DELGADO                          1310        440
CARMEN          PEREZ RAMOS                            1310        450
DIANA           PINO BUSTOS                            1310        480

--9 Mostrar para cada empleado el n�mero de meses que lleva el empleado en la empresa junto con su nombre.

SELECT Nombre_em , (MONTHS_BETWEEN (SYSDATE, FechaIng_em))
FROM EMPLEADOS;

NOMBRE_EM       (MONTHS_BETWEEN(SYSDATE,FECHAING_EM))
--------------- -------------------------------------
JOSE MARIA                                 468,185062
ANTONIO                                    244,475384
JOSE MANUEL                                240,475384
DANIEL                                            493
JAVIER                                     243,152804
PABLO                                      394,926997
SONIA                                      324,152804
JESUS                                      360,797965
JULIO                                      275,733449
JOSE ANTONIO                               263,475384
MANUEL                                     247,120545
ISAAC                                      269,185062
CONCEPCION                                 208,249578
ENRIQUE                                           252
JOSE                                       252,056029
ANTONIO                                           217
ROSA MARIA                                 132,346352
MARIA PIEDAD                               203,475384
RAQUEL                                     53,1850616
JOSE                                       244,185062
EDUARDO                                     24,862481
SERGIO                                     13,4753842
SERGIO                                     28,2495777
LUCRECIA                                   15,4753842
AZUCENA                                    4,08828741
CLAUDIA                                    2,89473902
VALERIA                                    2,89473902
LIVIA                                      35,6044164
CARMEN                                     35,6044164
DIANA                                      35,6044164
EUGENIA                                    13,4753842
VICTORIA                                   25,4753842
ROMULO                                     27,4753842
SANCHO                                     12,8302229


--10 Mostrar un listado donde aparezca el c�digo de los departamentos y su nombre conjuntamente con el c�digo de los centros en donde est�n situados y el nombre de estos centros.

SELECT D.Cod_de , D.Nombre_de , Cod_ce , C.Dir_ce , C.Nombre_ce
from centros C , departamentos D
WHERE C.Cod_ce = D.Centro_de;


    COD_DE NOMBRE_DE                          COD_CE DIR_CE                              NOMBRE_CE
---------- ------------------------------ ---------- ----------------------------------- ------------------------------
       100 DIRECCION GENERAL                      10 C/ JABUGO 20, SEVILLA               SEDE CENTRAL
       110 DIRECC. COMERCIAL                      20 AVDA. DE ANDALUCIA S/N, JAEN        SEDE ORIENTAL
       111 SECTOR INDUSTRIAL                      30 C/ LARIOS 10, MALAGA                PRODUCCION
       112 SECTOR SERVICIOS                       20 AVDA. DE ANDALUCIA S/N, JAEN        SEDE ORIENTAL
       120 ORGANIZACION                           10 C/ JABUGO 20, SEVILLA               SEDE CENTRAL
       121 PERSONAL                               30 C/ LARIOS 10, MALAGA                PRODUCCION
       122 PROCESO DE DATOS                       30 C/ LARIOS 10, MALAGA                PRODUCCION
       130 FINANZAS                               10 C/ JABUGO 20, SEVILLA               SEDE CENTRAL


--11 Hallar, en una consulta, los siguientes datos para cada departamento junto con su c�digo:
	a) N�mero de empleados.
	b) Salario medio, m�ximo y m�nimo
	c) Media de las comisiones.

Poner un alias a las columnas que usen funciones de grupo o agregaci�n.


select Dpto_em,COUNT(cod_em) as NUM_Emple , avg(Salario_em) as sal_medio , max(Salario_em) as sal_max , min(Salario_em) as sal_min ,avg(Comision_em)
from empleados
GROUP BY DPTO_EM;

   DPTO_EM  NUM_EMPLE  SAL_MEDIO    SAL_MAX    SAL_MIN AVG(COMISION_EM)
---------- ---------- ---------- ---------- ---------- ----------------
       100          3 1516,66667       1720       1380
       121          4       1560       2310       1190
       120          1       1270       1270       1270
       112          7 1267,14286       1380       1180       98,3333333
       110          3 1298,33333       1480       1200               50
       130          3       1370       1420       1290
       111          8   1218,125       1310       1100       104,285714
       122          5       1324       1450       1175


--12 Calcular cuantos n�meros de tel�fono distintos usa cada departamento, mostrando el c�digo y el nombre de cada departamento.

select Dpto_em,COUNT(ExtTel_em),Nombre_de
from empleados E , departamentos D
WHERE D.Cod_de = E.DPTO_EM
GROUP BY DPTO_EM,Nombre_de;

   DPTO_EM COUNT(EXTTEL_EM) NOMBRE_DE
---------- ---------------- ------------------------------
       130                3 FINANZAS
       121                4 PERSONAL
       122                5 PROCESO DE DATOS
       110                3 DIRECC. COMERCIAL
       112                7 SECTOR SERVICIOS
       111                8 SECTOR INDUSTRIAL
       120                1 ORGANIZACION
       100                3 DIRECCION GENERAL


--13 Mostrar los departamentos (n�mero y nombre) con sus centros (n�mero y nombre) y la edad media de sus empleados de aquellos departamentos que tienen una edad media en sus empleados mayor a 35 a�os.


SELECT D.Cod_de , D.Nombre_de , C.Cod_ce , C.Nombre_ce ,avg(MONTHS_BETWEEN (SYSDATE, FechaNac_em)/12)
FROM departamentos D , centros C , empleados E
WHERE C.COD_DE = E.Dpto_em
And D.Centro_de = C.Cod_ce
And (MONTHS_BETWEEN (SYSDATE, FechaNac_em)/12) > 35;


--***********************************


--- 14 Para cada grupo de empleados que cobran el mismo salario y tienen el mismo n�mero de hijos, diga cuantos empleados forman el grupo y en cuantos departamentos est�n trabajando.

SELECT Salario_em , Numhijos_em ,COUNT(cod_em) ,Dpto_em
from EMPLEADOS
GROUP BY Salario_em ,Numhijos_em , Dpto_em;

--Resultado : 

SALARIO_EM NUMHIJOS_EM COUNT(COD_EM)    DPTO_EM
---------- ----------- ------------- ----------
      1290           5             1        130
      1180           0             2        112
      1210           0             1        112
      1200           1             1        110
      1380           0             1        122
      1185           0             1        111
      1200           0             1        111
      2310           3             1        121
      1440           0             1        121
      1450           0             1        100
      1450           1             1        122
      1190           1             1        121
      1210           1             1        111
      1100           0             1        111
      1480           2             1        110
      1300           4             1        121
      1405           2             1        122
      1175           0             1        122
      1350           1             1        112
      1310           2             1        111
      1380           2             1        100
      1280           3             1        111
      1720           6             1        100
      1270           3             1        120
      1250           2             1        111
      1215           1             1        110
      1210           0             1        111
      1290           2             1        112
      1380           3             1        112
      1420           0             1        130
      1400           0             1        130
      1280           0             1        112
      1210           1             1        122



--15  Para cada extensi�n telef�nica, hallar cu�ntos empleados la usan y el salario medio de �stos.


SELECT EXTTEL_EM , COUNT(cod_em) , AVG(Salario_em)
FROM EMPLEADOS
GROUP BY EXTTEL_EM;

--Resultado :
 EXTTEL_EM COUNT(COD_EM) AVG(SALARIO_EM)
---------- ------------- ---------------
       810             1            1290
       650             1            1210
       740             1            1310
       620             2          1392,5
       880             3            1190
       450             1            1400
       340             1            1440
       250             1            1450
       220             1            1720
       410             1            1290
       610             1            1450
       500             1            1215
       360             1            1190
       350             2            1805
       840             1            1350
       750             2            1225
       550             1            1200
       508             1            1480
       200             1            1380
       850             1            1280
       760             3      1233,33333
       910             1            1270
       800             1            1380
       480             1            1420
       780             2          1142,5
       660             1            1175

--16 Hallar el salario medio por departamento para aquellos departamentos cuyo salario m�ximo es inferior al salario medio de todos los empleados.


SELECT Dpto_em,AVG(SALARIO_EM)
FROM EMPLEADOS
WHERE Salario_em > (SELECT max(Salario_em)
                        FROM empleados
                       )
GROUP BY Dpto_em;

--resultado :
ninguna fila seleccionada