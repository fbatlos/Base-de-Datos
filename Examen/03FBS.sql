--Fco José BAtista de los santos
--1--Mostrar el nombre y apellido, en este orden,del miembro con el nombre más corto (longitud de apellidos y nombre).

SELECT (SUBSTR(NOMBRE_MI ,INSTR (NOMBRE_MI, ',')+1))  , SUBSTR(NOMBRE_MI , 1,INSTR (NOMBRE_MI, ',')-1)
from MIEMBROS
GROUP BY SUBSTR(NOMBRE_MI ,INSTR (NOMBRE_MI, ',')+1) , SUBSTR(NOMBRE_MI , 1,INSTR (NOMBRE_MI, ',')-1)
HAVING LENGTH(SUBSTR(NOMBRE_MI ,INSTR (NOMBRE_MI, ',')+1)) = (min(LENGTH(SUBSTR(NOMBRE_MI ,INSTR (NOMBRE_MI, ',')+1))));

--2 Para cada tipo de agrupación, mostrar su nombre y cuantos grupos se han presentado.
 
 SELECT COD_TP , NOMBRE_TP , count( COD_GR)
 from TIPO_GRUPO 
 JOIN GRUPOS G on COD_TP = G.TIPO_GR
 GROUP BY COD_TP , NOMBRE_TP
 ORDER BY COD_TP;


    COD_TP NOMBRE_TP  COUNT(DISTINCTCOD_GR)
---------- ---------- ---------------------
         1 CHIRIGOTA                      3
         2 CUARTETO                       3
         3 COMPARSA                       4
         4 CORO                           4
         5 CALLEJERA                      4
         6 ROMANCERO                      4

--3--Mostrar el apellido (sin el nombre) del miembro más mayor de 'LOS COCO DE CADIZ'. **************************

SELECT SUBSTR(NOMBRE_MI , 1,INSTR (NOMBRE_MI, ',')-1) ,(MONTHS_BETWEEN (SYSDATE, FECNAC_MI)/12)
from MIEMBROS
    left JOIN grupos g on GRUPO_MI =  g.COD_GR
where g.NOMBRE_GR = 'LOS COCO DE CADIZ'
and (MONTHS_BETWEEN (SYSDATE, FECNAC_MI)/12) = (SELECT max(MONTHS_BETWEEN (SYSDATE, FECNAC_MI)/12)
                                                    FROM MIEMBROS
                                                    where g.NOMBRE_GR = 'LOS COCO DE CADIZ');



--4--Mostrar para cada 'CORO',su nombre en mayúsculas y el número de total de puntos obtenidos, ordenados por número de puntos. Deben aparecer todos los coros, aunque no hayan tenido puntuación también.

SELECT UPPER(NOMBRE_GR), NVL(SUM(PUNTOS_VO),0) AS TOTAL_PUNTOS
FROM GRUPOS
left JOIN VOTOS V ON V.GRUPO_VO = COD_GR
JOIN TIPO_GRUPO T on T.COD_TP =  TIPO_GR
WHERE NOMBRE_TP = 'CORO'
GROUP BY UPPER(NOMBRE_GR)
ORDER BY TOTAL_PUNTOS DESC;

UPPER(NOMBRE_GR)                                             TOTAL_PUNTOS
------------------------------------------------------------ ------------
LOS ILUMINAOS                                                         118
EL GREMIO                                                              98
LOS LUCIERNAGAS                                                        83
EL PARAISO                                                              0

--5 -Mostrar del grupo con más miembros, el nombre y el número de miembros que lo integran.

SELECT NOMBRE_GR , COUNT(M.COD_MI) as Maximo
FROM GRUPOS 
  JOIN MIEMBROS M on COD_GR = M.GRUPO_MI
    join TIPO_GRUPO T on T.COD_TP = TIPO_GR
group by Nombre_GR
HAVING COUNT(M.COD_MI) = (Select max(count(COD_MI))
    			from miembros
    			group by grupo_MI)
order by (COUNT(M.COD_MI)) desc;

NOMBRE_GR                                                        MAXIMO
------------------------------------------------------------ ----------
Valiente Principe                                                     8


--6-- Mostrar, en minúscula con la primera letra en mayúsculas, el nombre del miembro del jurado que haya dado menos *********************************************************************puntos en total, y los puntos que ha dado.

Select CONCAT(UPPER(SUBSTR(J.NOMBRE_JU, 1, 1)),LOWER(SUBSTR(J.NOMBRE_JU, 2))), (SUM(PUNTOS_VO))
from VOTOS 
JOIN JURADOS J on J.NOMBRE_JU = JURADO_VO
group by JURADO_VO , J.NOMBRE_JU
HAVING (SUM(PUNTOS_VO)) = (SELECT MIN(SUM(PUNTOS_VO))
                            from VOTOS
                            GROUP BY JURADO_VO);

--NO 

-- 7 -- Mostrar el resultado de las votaciones: 
nombre del tipo de grupo, nombre del grupo y puntos obtenidos, 
ordenado por tipo de grupo.
Deben aparecer todos los grupos, aunque no hayan obtenido ningún voto también. 

SELECT UPPER(NOMBRE_GR),T.NOMBRE_TP, NVL(SUM(PUNTOS_VO),0) AS TOTAL_PUNTOS
FROM GRUPOS
left JOIN VOTOS V ON V.GRUPO_VO = COD_GR
join TIPO_GRUPO T ON TIPO_GR = T.COD_TP
GROUP BY UPPER(NOMBRE_GR) , T.NOMBRE_TP
ORDER BY T.NOMBRE_TP DESC ,TOTAL_PUNTOS DESC;

UPPER(NOMBRE_GR)                                             NOMBRE_TP  TOTAL_PUNTOS
------------------------------------------------------------ ---------- ------------
CALLEHERO                                                    ROMANCERO             0
LA IA LA GRAN PUTA                                           ROMANCERO             0
ANNUNAKIS INMORTALES EN LA PLAYA DE LOS CORRALES             ROMANCERO             0
NOSTAGIA DE HUEVA                                            ROMANCERO             0
LOS COCO DE CADIZ                                            CUARTETO            122
EN MI CASETA CABE TO EL MUNDO                                CUARTETO            102
PUNK Y CIRCO                                                 CUARTETO             98
LOS ILUMINAOS                                                CORO                118
EL GREMIO                                                    CORO                 98
LOS LUCIERNAGAS                                              CORO                 83
EL PARAISO                                                   CORO                  0

UPPER(NOMBRE_GR)                                             NOMBRE_TP  TOTAL_PUNTOS
------------------------------------------------------------ ---------- ------------
LA OVEJA NEGRA                                               COMPARSA            102
LOS COLGAOS                                                  COMPARSA             85
LOS OFENDIDITOS                                              COMPARSA             78
LOS TAQUILLEROS DE VILCHES                                   COMPARSA              0
EL GRINCH DE CADIZ                                           CHIRIGOTA           111
QUE NI LAS HAMBRE VAMOS A SENTIR                             CHIRIGOTA           104
LOS EXAGERAOS                                                CHIRIGOTA            84
LOS BACARDI                                                  CALLEJERA             0
LOS BECARIOS DEL TELEDIARIO                                  CALLEJERA             0
VALIENTE PRINCIPE                                            CALLEJERA             0
LAS SIN FILTRO                                               CALLEJERA             0

--8--Mostrar el nombre del grupo 
y la suma de puntos del grupo que menos puntos ha obtenido.
(solo teniendo en cuenta aquellos que han tenido puntos)

SELECT UPPER(NOMBRE_GR), (SUM(PUNTOS_VO)) AS TOTAL_PUNTOS
FROM GRUPOS
left JOIN VOTOS V ON V.GRUPO_VO = COD_GR
GROUP BY UPPER(NOMBRE_GR)
HAVING  SUM(PUNTOS_VO) = (SELECT MIN(SUM(PUNTOS_VO))
                            from VOTOS
                            GROUP BY GRUPO_VO)
ORDER BY TOTAL_PUNTOS DESC;

UPPER(NOMBRE_GR)                                             TOTAL_PUNTOS
------------------------------------------------------------ ------------
LOS OFENDIDITOS                                                        78


--9--Mostrar el nombre y apellido junto con el nombre de su grupo, del miembro más viejo de todos los participantes.

SELECT SUBSTR(NOMBRE_MI , 1,INSTR (NOMBRE_MI, ',')-1) ,(MONTHS_BETWEEN (SYSDATE, FECNAC_MI)/12)
  from MIEMBROS
  where (MONTHS_BETWEEN (SYSDATE, FECNAC_MI)/12) = (SELECT max(MONTHS_BETWEEN (SYSDATE, FECNAC_MI)/12)
                                                       FROM MIEMBROS);


SUBSTR(NOMBRE_MI,1,INSTR(NOMBRE_MI,',')-1)
--------------------------------------------------------------------------------
(MONTHS_BETWEEN(SYSDATE,FECNAC_MI)/12)
--------------------------------------
Elyuyu
                            74,0501828


--10--Para todos los grupos, mostrar el nombre de cada grupo,   ****************************************************
el nombre del tipo de agrupación y nombre (apellidos y nombre) 
del letrista del grupo. 
Deben aparecer todos los grupos.


SELECT NOMBRE_GR , T.NOMBRE_TP , M.NOMBRE_MI
FROM GRUPOS 
   left JOIN MIEMBROS M on LETRISTA_GR = M.COD_MI and COD_GR = M.GRUPO_MI
   join TIPO_GRUPO T on T.COD_TP = TIPO_GR 
ORDER BY COD_GR;

--11--De manera descendente según puntuación, mostrar los puntos que le han dado cada miembro del jurado a 
la agrupación 'Los colgaos'
Mostrar nombre del jurado y votos.


SELECT J.NOMBRE_JU , PUNTOS_VO
from VOTOS
JOIN GRUPOS G on G.COD_GR = GRUPO_VO
JOIN JURADOS J on J.COD_JU = JURADO_VO
WHERE G.NOMBRE_GR = 'Los colgaos';

NOMBRE_JU     PUNTOS_VO
------------ ----------
JUAN ANTONIO          2
MARIA                29
JORGE                43
JOSE MARIA           11

--12 -- Para cada miembro que no es letrista, mostrar su nombre y apellidos  **********************************************
y fecha de nacimiento con el siguiente formato:

"Emilio Gutierrez Ellibi nació el sabado 15 de noviembre de 1958"


--13 -- Hallar el nombre de los grupos que tienen al menos dos 'a' en cualquier posicion
y cuyos votos totales son superiores a 100.
Mostrar tanto el nombre como los votos totales, de aquellos grupos que cumplen ambas condiciones.
				

SELECT NOMBRE_GR , SUM(PUNTOS_VO)
from GRUPOS
JOIN VOTOS V on COD_GR = V.GRUPO_VO
group by Nombre_GR 
HAVING UPPER(Nombre_GR) like '%A%A%'
and SUM(PUNTOS_VO)>100;

NOMBRE_GR                                                    SUM(PUNTOS_VO)
------------------------------------------------------------ --------------
La oveja negra                                                          102
En mi caseta cabe to el mundo                                           102
Que ni las hambre vamos a sentir                                        104


--14 -- Mostrar para cada grupo, su nombre 
y el número de miembros que lo forman.


SELECT NOMBRE_GR , COUNT(M.COD_MI) as Maximo
FROM GRUPOS 
    JOIN MIEMBROS M on COD_GR = M.GRUPO_MI
    join TIPO_GRUPO T on T.COD_TP = TIPO_GR
group by Nombre_GR
order by (COUNT(M.COD_MI)) desc;

NOMBRE_GR                                                        MAXIMO
------------------------------------------------------------ ----------
Valiente Principe                                                     8
Los Luciernagas                                                       5
Los iluminaos                                                         4
El gremio                                                             4
Punk y circo                                                          4
Que ni las hambre vamos a sentir                                      3
En mi caseta cabe to el mundo                                         3
Los ofendiditos                                                       3
Los coco de Cadiz                                                     3
El grinch de Cadiz                                                    3
La IA la gran puta                                                    2

NOMBRE_GR                                                        MAXIMO
------------------------------------------------------------ ----------
La oveja negra                                                        2
Los exageraos                                                         2
Nostagia de hueva                                                     2
Los colgaos                                                           2
Los Bacardi                                                           1
Las sin filtro                                                        1
El paraiso                                                            1
Los Taquilleros de Vilches                                            1
Annunakis inmortales en la playa de los corrales                      1
Callehero                                                             1
Los becarios del telediario                                           1

22 filas seleccionadas.


--15 -- Mostrar para cada uno de los miembros de "LOS EXAGERAOS",
apellidos y nombre, junto con la edad que tienen hoy.

SELECT NOMBRE_MI , (MONTHS_BETWEEN (SYSDATE, FECNAC_MI)/12)
FROM miembros
JOIN GRUPOS G on G.COD_GR = GRUPO_MI
WHERE  UPPER(NOMBRE_GR) = 'LOS EXAGERAOS';

NOMBRE_MI                                          (MONTHS_BETWEEN(SYSDATE,FECNAC_MI)/12)
-------------------------------------------------- --------------------------------------
Perez, Carlos                                                                  38,2062303
Santander, Manuel                                                              48,3056927

--16 -- Mostrar cuantos puntos ha obtenido el grupo "Los Luciernagas" 
junto con su nombre y el tipo de agrupación que es.


SELECT NOMBRE_GR ,T.NOMBRE_TP, SUM(V.PUNTOS_VO) as Puntuacion
from GRUPOS
JOIN VOTOS V on COD_GR = V.GRUPO_VO
JOIN TIPO_GRUPO T on T.COD_TP = TIPO_GR
WHERE GRUPO_VO = (SELECT COD_GR
                from GRUPOS
                WHERE NOMBRE_GR = 'Los Luciernagas')
GROUP BY Nombre_GR ,T.NOMBRE_TP ;

