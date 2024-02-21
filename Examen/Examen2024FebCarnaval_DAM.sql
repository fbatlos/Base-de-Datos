-----------------------------------------------------------------------------------
-- EXAMEN SQL SELECT DE FEBRERO 2024 v3 - TABLAS CARNAVAL 
--------------------------------------------------------------------------------------

-- Nombre: >>>>>>>>>>Pon_aquí_tu_nombre

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

-Salva este fichero con los dos digitos que te corresponden segun la lista
y  las iniciales de tu nombre y apellidos 
	Ejemplo:	Tomas Coronado Garcia
			    00TCG.sql
El numero que pones delante de tus iniciales debe ser el que aparece 
a continuación:

01	Aranda Cano, Alberto	
02	Arroyo Cano, Adrián	
03	Batista de los Santos, Fco José	
04	De Gomar Almellones, Nicolás	
05	De Olma Peralta, Emmanuel	
06	Fernandez Trigo, Julio
07	López Jiménez, Iván
08	Mahindo Canalo, Andrés
09	Morales Coronil, Sergio
10	Muñoz García, Raúl	
11	Narvaez Otero, Lara
12  Roldán Ramos, Iván
13  Tamayo Rodriguez, Mario
14  Muñoz Vias, Jaime 
15  Delgado Alvarez, Sebastian
16  Trujillo Gonzalez, Fco Jose

- Entra en la consola de línea de comandos SQL con el usuario EXAMEN (u otro que tengas disponible). 

- Carga el script para el examen desde el fichero "Datos2024FebCarnaval_DAM.sql".

- Donde ponga "SQL>", copiarás las sentencias SQL que has utilizado.

- Donde ponga "Resultado:" copiarás el resultado que SQL te devuelve.

- RECUERDA: guardar, cada cierto tiempo, el contenido de este fichero. 
Es lo que voy a evaluar, si lo pierdes, lo siento, es tu responsabilidad.
--------------------------------------------------------------------------------------
-- PUNTUACIÓN
--------------------------------------------------------------------------------------

- Preguntas: Se puntuarán de 0 a 10 cada una de las preguntas. Siendo la nota final el resultado de sumar todos los ejercicios y dividir entre el numero de ejercicios.


--------------------------------------------------------------------------------------
-- CRITERIOS
--------------------------------------------------------------------------------------

- Las consultas deben poder ejecutarse (sin errores de sintaxis) 

- Deben mostrar la información pedida.

--------------------------------------------------------------------------------------
-- TABLAS	
--------------------------------------------------------------------------------------
	
CREATE TABLE MIEMBROS(
  COD_MI		NUMBER(3)		PRIMARY KEY,
  NOMBRE_MI		VARCHAR2(30) 	NOT NULL,
  GRUPO_MI		NUMBER(2)		REFERENCES GRUPOS,
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
1.- Mostrar el nombre y apellido, en este orden, 
del miembro con el nombre más corto (longitud de apellidos y nombre).

SQL>

Resultado:


--------------------------------------------------------------------------------------
-- Pregunta 2
--------------------------------------------------------------------------------------
2.- Para cada tipo de agrupación, mostrar su nombre 
y cuantos grupos se han presentado.


SQL>

	
Resultado:

--------------------------------------------------------------------------------------
-- Pregunta 3 
--------------------------------------------------------------------------------------
3.- Mostrar el apellido (sin el nombre) 
del miembro más mayor de 'LOS COCO DE CADIZ'.

SQL>

										
	
Resultado:




--------------------------------------------------------------------------------------
-- Pregunta 4
--------------------------------------------------------------------------------------
4.- Mostrar para cada 'CORO', 
su nombre en mayúsculas y el número de total de puntos obtenidos, 
ordenados por número de puntos. 
Deben aparecer todos los coros, aunque no hayan tenido puntuación también.


SQL>

	
Resultado:


--------------------------------------------------------------------------------------
-- Pregunta 5
--------------------------------------------------------------------------------------
5.- Mostrar del grupo con más miembros, el nombre 
y el número de miembros que lo integran.

SQL>

	
Resultado:


--------------------------------------------------------------------------------------
-- Pregunta 6
--------------------------------------------------------------------------------------
6.- Mostrar, en minúscula con la primera letra en mayúsculas, 

el nombre del miembro del jurado que haya dado menos puntos en total, y los puntos que ha dado.


SQL>

	
Resultado:


--------------------------------------------------------------------------------------
-- Pregunta 7
--------------------------------------------------------------------------------------
7.- Mostrar el resultado de las votaciones: 
nombre del tipo de grupo, nombre del grupo y puntos obtenidos, 
ordenado por tipo de grupo.
Deben aparecer todos los grupos, aunque no hayan obtenido ningún voto también. 



SQL>

	
Resultado:


--------------------------------------------------------------------------------------
-- Pregunta 8 
--------------------------------------------------------------------------------------
8.- Mostrar el nombre del grupo 
y la suma de puntos del grupo que menos puntos ha obtenido.
(solo teniendo en cuenta aquellos que han tenido puntos)


SQL>

Resultado:



--------------------------------------------------------------------------------------
-- Pregunta 9
--------------------------------------------------------------------------------------
9.- Mostrar el nombre y apellido junto con el nombre de su grupo, 
del miembro más viejo de todos los participantes.


SQL>

Resultado:



--------------------------------------------------------------------------------------
-- Pregunta 10 
--------------------------------------------------------------------------------------
10.- Para todos los grupos, mostrar el nombre de cada grupo, 
el nombre del tipo de agrupación y nombre (apellidos y nombre) 
del letrista del grupo. 
Deben aparecer todos los grupos.

SQL> 
	
		
Resultado:


--------------------------------------------------------------------------------------
-- Pregunta 11
--------------------------------------------------------------------------------------
11.-  De manera descendente según puntuación, mostrar los puntos que le han dado cada miembro del jurado a 
la agrupación 'Los colgaos'
Mostrar nombre del jurado y votos.

SQL>


Resultado:


--------------------------------------------------------------------------------------
-- Pregunta 12
--------------------------------------------------------------------------------------
12.- Para cada miembro que no es letrista, mostrar su nombre y apellidos 
y fecha de nacimiento con el siguiente formato:

"Emilio Gutierrez Ellibi nació el sabado 15 de noviembre de 1958"


SQL>


Resultado:



--------------------------------------------------------------------------------------
-- Pregunta 13
--------------------------------------------------------------------------------------
13.- Hallar el nombre de los grupos que tienen al menos dos 'a' en cualquier posicion
y cuyos votos totales son superiores a 100.
Mostrar tanto el nombre como los votos totales, de aquellos grupos que cumplen ambas condiciones.
				
			
SQL>

Resultado:
	
	


--------------------------------------------------------------------------------------
-- Pregunta 14
--------------------------------------------------------------------------------------
14.- Mostrar para cada grupo, su nombre 
y el número de miembros que lo forman.

SQL>

	
Resultado:


--------------------------------------------------------------------------------------
-- Pregunta 15
--------------------------------------------------------------------------------------
15.- Mostrar para cada uno de los miembros de "LOS EXAGERAOS",
apellidos y nombre, junto con la edad que tienen hoy.

SQL>

	
Resultado:


--------------------------------------------------------------------------------------
-- Pregunta 16
--------------------------------------------------------------------------------------
16.- Mostrar cuantos puntos ha obtenido el grupo "Los Luciernagas" 
junto con su nombre y el tipo de agrupación que es.

SQL>

	
	
Resultado:






