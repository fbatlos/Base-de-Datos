--1-Para todos los grupos, mostrar el nombre de cada grupo, 
el nombre del tipo de agrupación y nombre (apellidos y nombre) del letrista del grupo.

SELECT NOMBRE_GR , T.NOMBRE_TP , M.NOMBRE_MI
FROM GRUPOS 
    left JOIN MIEMBROS M on LETRISTA_GR = M.COD_MI and COD_GR = M.GRUPO_MI
    join TIPO_GRUPO T on T.COD_TP = TIPO_GR 
ORDER BY COD_GR;

--2.- Mostrar para todos los grupos del tipo 'Callejera', nombre del grupo, 

SELECT NOMBRE_GR , T.NOMBRE_TP , SUBSTR(NOMBRE_MI , 1,INSTR (NOMBRE_MI, ',')-1) as nombre
FROM GRUPOS 
    JOIN MIEMBROS M on COD_GR = M.GRUPO_MI
    join TIPO_GRUPO T on T.COD_TP = TIPO_GR 
WHERE NOMBRE_TP = 'CALLEJERA'
ORDER BY COD_GR;

--3- Mostrar para cada 'Comparsa', su nombre en mayúsculas 
y el número de total de puntos obtenidos, ordenados por número de puntos descendentemente. 
Deben aparecer todas las comparsas.

SELECT UPPER(NOMBRE_GR), NVL(SUM(PUNTOS_VO),0) AS TOTAL_PUNTOS
FROM GRUPOS
left JOIN VOTOS V ON V.GRUPO_VO = COD_GR
GROUP BY UPPER(NOMBRE_GR)
ORDER BY TOTAL_PUNTOS DESC;

--4--Mostrar del grupo con más miembros, el nombre y el número de miembros que lo integran.

SELECT NOMBRE_GR , COUNT(M.COD_MI) as Maximo
FROM GRUPOS 
    JOIN MIEMBROS M on COD_GR = M.GRUPO_MI
    join TIPO_GRUPO T on T.COD_TP = TIPO_GR
group by Nombre_GR
HAVING COUNT(M.COD_MI) = (Select max(count(COD_MI))
    			from miembros
    			group by grupo_MI)
order by (COUNT(M.COD_MI)) desc;


