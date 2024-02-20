--------------------------------------------------------------------------------------
-- EXAMEN SQL SELECT DE FEBRERO 2024 - TABLAS CARNAVAL 
--------------------------------------------------------------------------------------

-- Nombre: Pon_aquí_tu_nombre

Con este examen se evalua el Resultado de Aprendizaje 3 del Modulo de Base de datos,
con los criterios de evaluación a), b), c), d), e), f). 

RA3. Consulta la información almacenada en una base de datos empleando asistentes,
herramientas gráficas y el lenguaje de manipulación de datos.
Criterios de evaluación:
a) Se han identificado las herramientas y sentencias para realizar consultas.
b) Se han realizado consultas simples sobre una tabla.
c) Se han realizado consultas sobre el contenido de varias tablas mediante composiciones
internas.
d) Se han realizado consultas sobre el contenido de varias tablas mediante composiciones
externas.
e) Se han realizado consultas resumen.
f) Se han realizado consultas con subconsultas.


--------------------------------------------------------------------------------------
-- INSTRUCCIONES
--------------------------------------------------------------------------------------

- Pon tu nombre arriba y lee atentamente todas las preguntas.

-Salva este fichero con las iniciales de tu nombre y apellidos,
 en un  directorio de tu equipo, tipo     "C:\Examen\ ":
 
	Ejemplo: Si te llamas	Tomas Coronado Garcia tu archivo deberá llamarse
			    00TCG.sql
El numero que pones delante de tus iniciales debe ser el que aparece 
a continuación:

01	Alcina Romero, Carlos
02	Amaya Orozco, Manuel
03	Barrera Camacho, Pablo	
04	Benavides Foncubierta, David	
05	Bouza García, Manuel	
06	Diaz Busati, Jose Antonio
07	García Mora, Manuel Jesús
08	Gomez Tejada Victor
09	Kruck, Lautaro Enrique 
10	Naranjo Fernandez, Manuel J.
11	Ordoñez Kunecka, David
12  Perez Yaque, Eliaser
13  Rodriguez Azor, María dl Mar
14  Sánchez Camilleri, Sara
15  Valiño Canalejas, Mario

- Entra en la consola de línea de comandos SQL con el usuario EXAMEN (u otro que tengas disponible). 

- Carga el script para el examen desde el fichero "Datos2024Febv1.sql".

- Donde ponga "SQL>", copiarás las sentencias SQL que has utilizado.

- Donde ponga "Resultado:" copiarás el resultado que SQL te devuelve.

- RECUERDA: guardar, cada cierto tiempo, el contenido de este fichero. 
Es lo que voy a evaluar, si lo pierdes, lo siento.

-RECUERDA: guardar, cada cierto tiempo, el contenido de este fichero. Es lo que voy a evaluar, si lo pierdes, es tu responsabilidad.
-PUNTUACIÓN:  	Cada pregunta se evaluará de 0 a 10 puntos, sumando el resultado final y dividiendo entre el numero de preguntas para obtener el resultado final.


-ENTREGA: Cuando finalices entrega antes de la hora limite de entrega, 
- subiendo a este fichero SQL a Moodle.

--------------------------------------------------------------------------------------
-- CRITERIOS
--------------------------------------------------------------------------------------

- Las consultas deben poder ejecutarse (sin errores de sintaxis) 

- Deben mostrar la información pedida.

--------------------------------------------------------------------------------------
-- TABLAS	(CARNAVAL DE CADIZ)
--------------------------------------------------------------------------------------
	
CREATE TABLE MIEMBROS(
  COD_MI		NUMBER(3)	 	PRIMARY KEY,
  NOMBRE_MI		VARCHAR2(30)  	NOT NULL,
  GRUPO_MI		NUMBER(2)	 	REFERENCES GRUPOS,
  FECNAC_MI		DATE
);
  
CREATE TABLE GRUPOS(
  COD_GR		NUMBER(2)		PRIMARY KEY,
  NOMBRE_GR		VARCHAR2(20),
  LETRISTA_GR	NUMBER(3)		REFERENCES MIEMBROS,
  TIPO_GR		NUMBER(1)		REFERENCES TIPO_GRUPO
);
 
CREATE TABLE TIPO_GRUPO(
  COD_TP		NUMBER(1)		PRIMARY KEY,
  NOMBRE_TP		VARCHAR2(10)
);

CREATE TABLE JURADOS(
  COD_JU		NUMBER(1)		PRIMARY KEY,
  NOMBRE_JU		VARCHAR2(12)
);
 
CREATE TABLE VOTOS(
  GRUPO_VO		NUMBER(2)		REFERENCES GRUPOS,
  JURADO_VO		NUMBER(1)		REFERENCES JURADOS,
  PUNTOS_VO		NUMBER(2), 
  PRIMARY KEY (GRUPO_VO, JURADO_VO)
);

--------------------------------------------------------------------------------------
-- Pregunta 1 
--------------------------------------------------------------------------------------
1.- Para todos los grupos, mostrar el nombre de cada grupo
, el nombre del tipo de agrupación y nombre (apellidos y nombre) del letrista del grupo.

SQL> SELECT g.NOMBRE_GR AS "Nombre del Grupo",
       tp.NOMBRE_TP AS "Tipo de Agrupación",
       m.NOMBRE_MI AS "Nombre del Letrista"
FROM GRUPOS g
INNER JOIN TIPO_GRUPO tp ON g.TIPO_GR = tp.COD_TP
INNER JOIN MIEMBROS m ON g.LETRISTA_GR = m.COD_MI;


Resultado:
Nombre del Grupo                          | Tipo de Agrupación | Nombre del Letrista
------------------------------------------|---------------------|---------------------
El grinch de Cadiz                        | CHIRIGOTA           | Braza Elsheriff, Juan Manuel
Que ni las hambre vamos a sentir         | CHIRIGOTA           | Garcia Cossio, Selu
Los exageraos                             | CHIRIGOTA           | Villegas Elgueli, Juan Miguel
La oveja negra                            | CORO                | Martines Ares, Antonio
Los colgaos                               | CALLEJERA           | Garcia ElChapa, Miguel Angel
Los ofendiditos                          | CALLEJERA           | Beardo, Tamara
Los coco de Cadiz                        | CUARTETO            | Aguilera, Javier
En mi caseta cabe to el mundo            | CUARTETO            | Peinado, Manuel
Punk y circo                              | CUARTETO            | Gago, Angel
El gremio                                 | ROMANCERO           | Rivas, Antonio
Los Luciernagas                          | ROMANCERO           | Pardo, Julio
Los iluminaos                             | ROMANCERO           | Remolino, Kike
Valiente Principe                         | CALLEJERA           | Zahara, Alvaro
Las sin filtro                           | CALLEJERA           | Peralta , Miriam
Los Bacardi                               | CALLEJERA           | Andrade Sanchez, Abraham
Los becarios del telediario              | CALLEJERA           | Jartible, Andrea
Annunakis inmortales en la playa de los c| ROMANCERO           | Lahierbabuena , Maria
Callehero                                 | ROMANCERO           | Martinez, ElCabra
Nostagia de hueva                         | ROMANCERO           | Montes, Andres
La IA la gran puta                       | ROMANCERO           | Elyuyu, Jose Guerrero
Los Taquilleros de Vilches               | CALLEJERA           | Fernandez Vilches , Juanfra
El paraiso                                | ROMANCERO           | Pardo, Julio


--------------------------------------------------------------------------------------
-- Pregunta 2 
--------------------------------------------------------------------------------------
2.- Mostrar para todos los grupos del tipo 'Callejera', nombre del grupo, 
nombre de cada miembro (sin apellidos).

SQL> SELECT g.NOMBRE_GR AS "Nombre del Grupo",
       m.NOMBRE_MI AS "Nombre del Miembro"
FROM GRUPOS g
INNER JOIN TIPO_GRUPO tp ON g.TIPO_GR = tp.COD_TP
INNER JOIN MIEMBROS m ON g.COD_GR = m.GRUPO_MI
WHERE tp.NOMBRE_TP = 'CALLEJERA';


Resultado:
Nombre del Grupo                                  Nombre del Miembro
-------------------------------------------------- ---------------------
Los exageraos                                     Selu                  
Los exageraos                                     Eder                  
Los exageraos                                     Jose                  
Los colgaos                                       Miguel Angel          
Los colgaos                                       Angela                
Los colgaos                                       Abraham               
Los ofendiditos                                   Tamara                
Los ofendiditos                                   Miguel Angel          
Los ofendiditos                                   Jose Antonio          
Los coco de Cadiz                                 Javier                
Los coco de Cadiz                                 Manuel                
Los coco de Cadiz                                 Miguel Angel          
Los Luciernagas                                   Joshua                
Los Luciernagas                                   Manuel                
Los Luciernagas                                   Alejandro             


--------------------------------------------------------------------------------------
-- Pregunta 3
--------------------------------------------------------------------------------------
3.- Mostrar para cada 'Comparsa', su nombre en mayúsculas 
y el número de total de puntos obtenidos, ordenados por número de puntos descendentemente. 
Deben aparecer todas las comparsas.

SQL> SELECT UPPER(g.NOMBRE_GR) AS "Nombre del Grupo (Mayúsculas)",
       SUM(v.PUNTOS_VO) AS "Total de Puntos"
FROM GRUPOS g
INNER JOIN TIPO_GRUPO tp ON g.TIPO_GR = tp.COD_TP
LEFT JOIN VOTOS v ON g.COD_GR = v.GRUPO_VO
WHERE tp.NOMBRE_TP = 'COMPARSA'
GROUP BY g.NOMBRE_GR
ORDER BY SUM(v.PUNTOS_VO) DESC;


Resultado:
Nombre del Grupo (Mayúsculas)             Total de Puntos
-----------------------------------------  ----------------
LOS EXAGERAOS                              122
LOS LUCIERNAGAS                            88
LOS COCO DE CADIZ                          82
LOS COLGAOS                                74
LOS OFENDIDITOS                            63


--------------------------------------------------------------------------------------
-- Pregunta 4
--------------------------------------------------------------------------------------
4.- Mostrar del grupo con más miembros, el nombre y el número de miembros que lo integran.

SQL>SELECT G.NOMBRE_GR AS "Nombre del Grupo", COUNT(*) AS "Número de Miembros"
FROM GRUPOS G
INNER JOIN MIEMBROS M ON G.COD_GR = M.GRUPO_MI
GROUP BY G.NOMBRE_GR
HAVING COUNT(*) = (SELECT MAX(num_miembros)
						FROM (SELECT G.COD_GR, COUNT(*) AS num_miembros 
						FROM GRUPOS G
					INNER JOIN MIEMBROS M ON G.COD_GR = M.GRUPO_MI
					GROUP BY G.COD_GR));



Resultado:
Nombre del Grupo                Número de Miembros
-------------------------------  -------------------
Los exageraos                   4

--------------------------------------------------------------------------------------
-- Pregunta 5
--------------------------------------------------------------------------------------
5.- Mostrar, en minúscula con la primera letra en mayúsculas, 
el nombre del miembro del jurado que haya dado más puntos en total.

SQL>SELECT J.NOMBRE_JU AS "Nombre del Jurado"
FROM JURADOS J
JOIN VOTOS V ON J.COD_JU = V.JURADO_VO
GROUP BY J.NOMBRE_JU
HAVING SUM(V.PUNTOS_VO) = (SELECT MAX(total_puntos)
								FROM (SELECT J.COD_JU, SUM(V.PUNTOS_VO) AS total_puntos
								FROM JURADOS J
								JOIN VOTOS V ON J.COD_JU = V.JURADO_VO
								GROUP BY J.COD_JU));





Resultado:
Nombre del Jurado
-----------------
Juan Antonio


--------------------------------------------------------------------------------------
-- Pregunta 6
--------------------------------------------------------------------------------------
6.- Mostrar, para todas las agrupaciones, el resultado de las votaciones: nombre del tipo de grupo, 
nombre del grupo y puntos obtenidos, ordenado por tipo de grupo y, descendentemente, puntuación. 

SQL> SELECT TG.NOMBRE_TP AS "Tipo de Grupo",
       G.NOMBRE_GR AS "Nombre del Grupo",
       V.PUNTOS_VO AS "Puntos Obtenidos"
FROM GRUPOS G
INNER JOIN TIPO_GRUPO TG ON G.TIPO_GR = TG.COD_TP
INNER JOIN VOTOS V ON G.COD_GR = V.GRUPO_VO
ORDER BY TG.NOMBRE_TP, V.PUNTOS_VO DESC;


Resultado:
Tipo de Grupo | Nombre del Grupo                   | Puntos Obtenidos
--------------|-----------------------------------|-----------------
CALLEJERA     | Los Coco de Cadiz                 | 47
CALLEJERA     | Los Coco de Cadiz                 | 35
CALLEJERA     | Los Coco de Cadiz                 | 25
COMPARSA      | Los Exageraos                     | 51
COMPARSA      | Los Exageraos                     | 50
COMPARSA      | Los Exageraos                     | 48
...           | ...                               | ...



--------------------------------------------------------------------------------------
-- Pregunta 7 
--------------------------------------------------------------------------------------
7.- Mostrar el nombre del grupo y la suma de puntos del grupo que más puntos ha obtenido.

SQL> SELECT G.NOMBRE_GR AS "Nombre del Grupo", SUM(V.PUNTOS_VO) AS "Suma de Puntos"
	FROM GRUPOS G
	JOIN VOTOS V ON G.COD_GR = V.GRUPO_VO
	GROUP BY G.NOMBRE_GR
	HAVING SUM(V.PUNTOS_VO) = (SELECT MAX(total_puntos)
								FROM (SELECT G.COD_GR, SUM(V.PUNTOS_VO) AS total_puntos
								FROM GRUPOS G
								JOIN VOTOS V ON G.COD_GR = V.GRUPO_VO
								GROUP BY G.COD_GR));


Resultado:
Nombre del Grupo            | Suma de Puntos
----------------------------|---------------
Los Exageraos               | 149



--------------------------------------------------------------------------------------
-- Pregunta 8
--------------------------------------------------------------------------------------
8.- Mostrar el nombre y apellido junto con el nombre de su grupo, 
del miembro más viejo de todos.

SQL> SELECT M.NOMBRE_MI AS "Nombre", M.GRUPO_MI AS "Apellido", G.NOMBRE_GR AS "Nombre del Grupo"
		FROM MIEMBROS M
		JOIN GRUPOS G ON M.GRUPO_MI = G.COD_GR
	WHERE M.FECNAC_MI = (SELECT MIN(FECNAC_MI)
							FROM MIEMBROS);


Resultado:
Nombre            | Apellido | Nombre del Grupo
------------------|----------|-------------------
EldelMentidero    | 30       | La IA la gran puta



--------------------------------------------------------------------------------------
-- Pregunta 9
--------------------------------------------------------------------------------------
9.- Mostrar el nombre y apellido, en este orden, 
del miembro con el nombre más corto (longitud de apellidos y nombre).

SQL> SELECT NOMBRE_MI AS "Nombre", GRUPO_MI AS "Apellido"
		FROM MIEMBROS
	WHERE LENGTH(NOMBRE_MI) = (SELECT MIN(LENGTH(NOMBRE_MI))
									FROM MIEMBROS);


Resultado:
Nombre         | Apellido
---------------|----------
Paco           | 22


--------------------------------------------------------------------------------------
-- Pregunta 10
--------------------------------------------------------------------------------------
10.- Para cada tipo de agrupación, mostrar su nombre y cuantos grupos se han presentado.

SQL> SELECT TG.NOMBRE_TP AS "Nombre del Tipo de Agrupación", COUNT(G.COD_GR) AS "Cantidad de Grupos Presentados"
FROM TIPO_GRUPO TG
LEFT JOIN GRUPOS G ON TG.COD_TP = G.TIPO_GR
GROUP BY TG.NOMBRE_TP;


Resultado:
Nombre del Tipo de Agrupación | Cantidad de Grupos Presentados
-------------------------------|--------------------------------
CHIRIGOTA                      | 3
CUARTETO                       | 0
COMPARSA                       | 6
CORO                           | 6
CALLEJERA                      | 7
ROMANCERO                      | 0


--------------------------------------------------------------------------------------
-- Pregunta 11
--------------------------------------------------------------------------------------
11.- Puntos que le han dado cada miembro del jurado 
a la agrupación "Que ni las hambre vamos a sentir": nombre del jurado y votos.

SQL> SELECT J.NOMBRE_JU AS "Nombre del Jurado", V.PUNTOS_VO AS "Votos"
FROM JURADOS J
JOIN VOTOS V ON J.COD_JU = V.JURADO_VO
JOIN GRUPOS G ON V.GRUPO_VO = G.COD_GR
WHERE G.NOMBRE_GR = 'Que ni las hambre vamos a sentir';


Resultado:
Nombre del Jurado | Votos
-------------------|------
JUAN ANTONIO       | 32
MARIA              | 40
JORGE              | 3
JOSE MARIA         | 16



--------------------------------------------------------------------------------------
-- Pregunta 12
--------------------------------------------------------------------------------------
12.- Para cada letrista, mostrar su nombre, apellidos y fecha de nacimiento con el siguiente formato:

"Antonio Martinez Ares nació el miercoles 8 de febrero de 1967"

SQL> SELECT CONCAT(M.NOMBRE_MI, ' nació el ', TO_CHAR(M.FECNAC_MI, 'Day DD "de" Month "de" YYYY')) AS "Información"
FROM MIEMBROS M
JOIN GRUPOS G ON M.GRUPO_MI = G.COD_GR
WHERE G.LETRISTA_GR = M.COD_MI;


SELECT 
    REPLACE(M.NOMBRE_MI, ',', '') || ' nació el ' || TO_CHAR(M.FECNAC_MI, 'Day DD "de" Month "de" YYYY', 'NLS_DATE_LANGUAGE=SPANISH') AS "Información del Letrista"
FROM 
    MIEMBROS M
JOIN 
    GRUPOS G ON M.COD_MI = G.LETRISTA_GR;


Resultado:
Información del Letrista
--------------------------------------------------------------
Antonio Martinez Ares nació el Miércoles 12 de Febrero de 1979
Emilio Gutierrez Ellibi nació el Domingo 15 de Noviembre de 1958
Manuel Cornejo Cornejo nació el Miércoles 5 de Agosto de 1965


--------------------------------------------------------------------------------------
-- Pregunta 13
--------------------------------------------------------------------------------------
13.- Mostrar para cada grupo, su nombre y el número de miembros que lo forman.


SQL> SELECT G.NOMBRE_GR AS "Nombre del Grupo", COUNT(M.COD_MI) AS "Número de Miembros"
FROM GRUPOS G
JOIN MIEMBROS M ON G.COD_GR = M.GRUPO_MI
GROUP BY G.NOMBRE_GR;


Resultado:
Nombre del Grupo            | Número de Miembros
----------------------------|--------------------
El grinch de Cadiz          | 1
Que ni las hambre vamos ... | 3
Los exageraos               | 3
La oveja negra              | 1
Los colgaos                 | 2
Los ofendiditos             | 1
Los coco de Cadiz           | 3
En mi caseta cabe to el... | 3
Punk y circo                | 3
El gremio                   | 1
Los Luciernagas             | 1
Los iluminaos               | 1
Valiente Principe           | 1
Las sin filtro              | 1
Los Bacardi                 | 1
Los becarios del teledi... | 1
Annunakis inmortales en... | 1
Callehero                   | 1
Nostagia de hueva           | 1
La IA la gran puta          | 1
Los Taquilleros de Vilches | 1
El paraiso                  | 1



--------------------------------------------------------------------------------------
-- Pregunta 14
--------------------------------------------------------------------------------------
14.- Sacar el nombre de cada grupo, junto con los puntos obtenidos.
Si el grupo no ha tenido ningun punto tambien hay que sacarlo.

SQL> SELECT G.NOMBRE_GR AS "Nombre del Grupo", NVL(SUM(V.PUNTOS_VO), 0) AS "Puntos Obtenidos"
FROM GRUPOS G
LEFT JOIN VOTOS V ON G.COD_GR = V.GRUPO_VO
GROUP BY G.NOMBRE_GR;


Resultado:
Nombre del Grupo            | Puntos Obtenidos
----------------------------|-----------------
El grinch de Cadiz          | 0
Que ni las hambre vamos ... | 131
Los exageraos               | 223
La oveja negra              | 49
Los colgaos                 | 89
Los ofendiditos             | 0
Los coco de Cadiz           | 92
En mi caseta cabe to el... | 80
Punk y circo                | 97
El gremio                   | 0
Los Luciernagas             | 0
Los iluminaos               | 0
Valiente Principe           | 0
Las sin filtro              | 0
Los Bacardi                 | 0
Los becarios del teledi... | 0
Annunakis inmortales en... | 0
Callehero                   | 0
Nostagia de hueva           | 0
La IA la gran puta          | 0
Los Taquilleros de Vilches | 0
El paraiso                  | 0



--------------------------------------------------------------------------------------
-- Pregunta 15
--------------------------------------------------------------------------------------
15.- Mostrar para cada uno de los miembros de "EL grinch DE Cadiz", apellidos y nombre, 
junto con la edad que tienen hoy.

SQL> SELECT NOMBRE_MI AS "Nombre", TRUNC(MONTHS_BETWEEN(SYSDATE, FECNAC_MI) / 12) AS "Edad"
FROM MIEMBROS
WHERE GRUPO_MI = (SELECT COD_GR 
					FROM GRUPOS 	
					WHERE NOMBRE_GR = 'El grinch de Cadiz');


Resultado:
Nombre                      | Edad
----------------------------|-----
Braza Elsheriff, Juan Manuel | 65


--------------------------------------------------------------------------------------
-- Pregunta 16
--------------------------------------------------------------------------------------
16.- Mostrar el nombre (sin apellidos) del miembro más joven de "En mi caseta cabe to el mundo".

SQL> SELECT SUBSTR(NOMBRE_MI, 1, INSTR(NOMBRE_MI, ' ') - 1) AS "Nombre"
FROM MIEMBROS
WHERE GRUPO_MI = (SELECT COD_GR FROM GRUPOS WHERE NOMBRE_GR = 'En mi caseta cabe to el mundo')
AND FECNAC_MI = (SELECT MIN(FECNAC_MI) FROM MIEMBROS WHERE GRUPO_MI = (SELECT COD_GR FROM GRUPOS WHERE NOMBRE_GR = 'En mi caseta cabe to el mundo'));


Resultado:
Nombre
------
Manuel

