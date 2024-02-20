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

SQL> 

Resultado:

--------------------------------------------------------------------------------------
-- Pregunta 2 
--------------------------------------------------------------------------------------
2.- Mostrar para todos los grupos del tipo 'Callejera', nombre del grupo, 
nombre de cada miembro (sin apellidos).

SQL> 

Resultado:

--------------------------------------------------------------------------------------
-- Pregunta 3
--------------------------------------------------------------------------------------
3.- Mostrar para cada 'Comparsa', su nombre en mayúsculas 
y el número de total de puntos obtenidos, ordenados por número de puntos descendentemente. 
Deben aparecer todas las comparsas.

SQL> 

Resultado:

--------------------------------------------------------------------------------------
-- Pregunta 4
--------------------------------------------------------------------------------------
4.- Mostrar del grupo con más miembros, el nombre y el número de miembros que lo integran.

SQL> 

Resultado:

--------------------------------------------------------------------------------------
-- Pregunta 5
--------------------------------------------------------------------------------------
5.- Mostrar, en minúscula con la primera letra en mayúsculas, 
el nombre del miembro del jurado que haya dado más puntos en total.

SQL> 

Resultado:

--------------------------------------------------------------------------------------
-- Pregunta 6
--------------------------------------------------------------------------------------
6.- Mostrar, para todas las agrupaciones, el resultado de las votaciones: nombre del tipo de grupo, 
nombre del grupo y puntos obtenidos, ordenado por tipo de grupo y, descendentemente, puntuación. 

SQL> 

Resultado:

--------------------------------------------------------------------------------------
-- Pregunta 7 
--------------------------------------------------------------------------------------
7.- Mostrar el nombre del grupo y la suma de puntos del grupo que más puntos ha obtenido.

SQL> 

Resultado:

--------------------------------------------------------------------------------------
-- Pregunta 8
--------------------------------------------------------------------------------------
8.- Mostrar el nombre y apellido junto con el nombre de su grupo, 
del miembro más viejo de todos.

SQL> 

Resultado:

--------------------------------------------------------------------------------------
-- Pregunta 9
--------------------------------------------------------------------------------------
9.- Mostrar el nombre y apellido, en este orden, 
del miembro con el nombre más corto (longitud de apellidos y nombre).

SQL> 

Resultado:

--------------------------------------------------------------------------------------
-- Pregunta 10
--------------------------------------------------------------------------------------
10.- Para cada tipo de agrupación, mostrar su nombre y cuantos grupos se han presentado.

SQL> 

Resultado:

--------------------------------------------------------------------------------------
-- Pregunta 11
--------------------------------------------------------------------------------------
11.- Puntos que le han dado cada miembro del jurado 
a la agrupación "Que ni las hambre vamos a sentir": nombre del jurado y votos.

SQL> 

Resultado:

--------------------------------------------------------------------------------------
-- Pregunta 12
--------------------------------------------------------------------------------------
12.- Para cada letrista, mostrar su nombre, apellidos y fecha de nacimiento con el siguiente formato:

"Antonio Martinez Ares nació el miercoles 8 de febrero de 1967"

SQL> 

Resultado:

--------------------------------------------------------------------------------------
-- Pregunta 13
--------------------------------------------------------------------------------------
13.- Mostrar para cada grupo, su nombre y el número de miembros que lo forman.


SQL> 

Resultado:

--------------------------------------------------------------------------------------
-- Pregunta 14
--------------------------------------------------------------------------------------
14.- Sacar el nombre de cada grupo, junto con los puntos obtenidos.
Si el grupo no ha tenido ningun punto tambien hay que sacarlo.

SQL> 

Resultado:

--------------------------------------------------------------------------------------
-- Pregunta 15
--------------------------------------------------------------------------------------
15.- Mostrar para cada uno de los miembros de "EL grinch DE Cadiz", apellidos y nombre, 
junto con la edad que tienen hoy.

SQL> 

Resultado:

--------------------------------------------------------------------------------------
-- Pregunta 16
--------------------------------------------------------------------------------------
16.- Mostrar el nombre (sin apellidos) del miembro más joven de "En mi caseta cabe to el mundo".

SQL> 

Resultado:
