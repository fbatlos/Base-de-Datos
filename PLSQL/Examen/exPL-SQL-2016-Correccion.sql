------------------------------------------------------------------------------------------------------------
--	Nombre: <Pon tu nombre aquí>
------------------------------------------------------------------------------------------------------------
	INSTRUCCIONES:
	==============

-Salva este fichero con las iniciales de tu nombre y apellidos:
	Ejemplo:	José María Rivera Calvete
			JMRC.sql

-Pon tu nombre al ejercicio en la primera línea y lee atentamente todas las preguntas.

-Carga el script para el examen desde el fichero "DatosPLSQL.sql".

-RECUERDA: guardar, cada cierto tiempo, el contenido de este fichero. Es lo que voy a evaluar, si lo pierdes, lo siento, en el final tendrás otra oportunidad.

PUNTUACIÓN
==========
- Cada pregunta vale 2 puntos

 -- TABLAS: ASIGNATURAS, ALUMNOS, MATRICULAS, PROFESORES
 
- Se considerará para la evaluación:
	- Que funcione
	- Estilo de programación
	- Legibilidad del código
	- Tratamiento de excepciones
	- Código reutilizable y paramétrico
	- Cursores adecuados

------------------------------------------------------------------------------------------------------------
1.- Diseña el procedimiento 'MediasAsig' que reciba como parámetro el código de una asignatura y actualice el campo 'Notamedia_as' de la tabla 'Asignaturas' al valor medio de las notas de los alumnos que están matriculados, el campo 'Nota_ma', considerando que para el cálculo de la media se condiderarán las notas de los alumons repetidores de la siguiente manera:
	- Si está aprobado, un 5, independientemente de la nota que tenga.
	- Si está suspenso, el valor de su nota, el campo 'Nota_ma'.

Código:

	SET SERVEROUTPUT ON
	
	CREATE OR REPLACE PROCEDURE pr_MediasAsig
	(p_cod_asig IN ASIGNATURAS.CODIGO_AS%TYPE) 
	AS
		v_media NUMBER(5,2);
	BEGIN
		SELECT NVL(AVG(CASE WHEN MATRICULAS.NOTA_MA >= 5 THEN 5 
							ELSE MATRICULAS.NOTA_MA END), 0) INTO v_media
			FROM MATRICULAS
			WHERE MATRICULAS.CODAS_MA = p_cod_asig;

		UPDATE ASIGNATURAS
			SET NOTAMEDIA_AS = v_media
			WHERE CODIGO_AS = p_cod_asig;
			COMMIT;
	EXCEPTION
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('No existe el codigo de asignatura proporcionado');
			ROLLBACK;
	END pr_MediasAsig;
	/
	
	-- Para comprobarlo
	
	BEGIN
		pr_MediasAsig(1);
	END;
	/
	
	SELECT *
		FROM ASIGNATURAS
		WHERE CODIGO_AS = 1;
	
	-- Este es el resultado antes de ejecutarse el procedimiento
	
	 CODIGO_AS NOMBRE_AS                      PROFESOR_AS NOTAMEDIA_AS
	---------- ------------------------------ ----------- ------------
			 1 Desarrollo de interfaces                 1

	-- Este es el resultado cuando ejecutamos el procedimiento
	
	 CODIGO_AS NOMBRE_AS                      PROFESOR_AS NOTAMEDIA_AS
	---------- ------------------------------ ----------- ------------
			 1 Desarrollo de interfaces                 1         4,17
	
------------------------------------------------------------------------------------------------------------
2.- Diseña la función 'CalculaMedia' que reciba como parámetro el código de un alumno y devuelva la media de las notas de las asignaturas en las que esté matriculado.

Código:
	
	CREATE OR REPLACE FUNCTION fn_CalculaMedia_2
	(p_cod_al IN ALUMNOS.CODIGO_AL%TYPE)
		RETURN NUMBER
	AS
		vn_media_not NUMBER;
	BEGIN
		SELECT NVL(AVG(CASE WHEN M.NOTA_MA >= 5 THEN 5 ELSE M.NOTA_MA END), 0) INTO vn_media_not
			FROM MATRICULAS M
			WHERE M.CODAL_MA = p_cod_al;

		RETURN vn_media_not;
	EXCEPTION
	  WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('Error al calcular la media del alumno');
	END fn_CalculaMedia_2;
	/
	
	-- Para comprobarlo
	
	DECLARE
		v_media NUMBER;
	BEGIN
		v_media := fn_CalculaMedia_2(1); -- código del alumno
		DBMS_OUTPUT.PUT_LINE('La media de notas del alumno es: ' || v_media);
	END;
	/
	
	-- La media de notas del alumno es: 5
	-- Procedimiento PL/SQL terminado correctamente.
		

------------------------------------------------------------------------------------------------------------
3.- Diseña el procedimiento 'MediasAsig' que modifique el campo 'Notamedia_al' de la tabla 'Alumnos' al valor de la media de las notas de las asignaturas en las que esté matriculado.

Código:
	
	CREATE OR REPLACE PROCEDURE pr_MediasAsig_2
	AS
	BEGIN
		FOR alumno IN (SELECT DISTINCT CODAL_MA 
					   FROM MATRICULAS)
		LOOP
			DECLARE
				v_media NUMBER(5,2);
			BEGIN
				SELECT NVL(AVG(CASE WHEN MATRICULAS.NOTA_MA >= 5 THEN MATRICULAS.NOTA_MA ELSE 5 END), 0) INTO v_media
					FROM MATRICULAS
					WHERE MATRICULAS.CODAL_MA = alumno.CODAL_MA;

				UPDATE ALUMNOS 
					SET NOTAMEDIA_AL = v_media
					WHERE CODIGO_AL = alumno.CODAL_MA;
				COMMIT;
			END;
		END LOOP;
	EXCEPTION
	  WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('Error al calcular la media de los alumnos');
		ROLLBACK;
	END pr_MediasAsig_2;
	/
		-- Procedimiento creado.
		
	-- Para comprobarlo
	
	BEGIN
		pr_MediasAsig_2;
	END;
	/
		-- Procedimiento PL/SQL terminado correctamente.
	
	-- Para comprobarlo
	
	SELECT *
		FROM ALUMNOS;
	
		-- Este es el resultado cuando se ha ejecutado el procedimiento
		
		 CODIGO_AL APELLIDOS_AL         NOMBRE_AL  DOMICILIO_AL         LOCALIDAD_ NOTAMEDIA_AL
		---------- -------------------- ---------- -------------------- ---------- ------------
				 1 SANOGO               BAFLE MOR  c/ Feria 100         SEVILLA             8,5
				 2 ALVAREZ CAMINO       JOAQUIN    c/ Sierpes 3         SEVILLA            5,33
				 3 BAENA QUINTERO       FRANCISCO  c/ Sierpes 3         SEVILLA            7,33
				 4 BENITEZ MORALES      PEDRO L.   c/ Sierpes 3         SEVILLA            7,33
				 5 BERNABEU DE LOPE     ARTURO     c/ Sierpes 3         SEVILLA             5,5
				 6 CASTRO EXPOSITO      ABRAHAM    c/ Sierpes 3         SEVILLA               8
				 7 CASTRO GARCIA        ALEJANDRO  c/ Real 3            CASTILLEJA            5
				 8 ESCAMILLA PEREJON    MANUEL     c/ Sierpes 3         SEVILLA             7,5
				 9 FRANCO DOMINGUEZ     DIEGO J.   c/ Sierpes 3         SEVILLA             8,5
				10 GORDILLO REINA       ALVARO A.  c/ Sierpes 3         SEVILLA               8
				11 HERRERO SAN ROMAN    ESTEBAN    c/ Sierpes 3         SEVILLA               5
				12 JIMENEZ NAVARRO      DAVID      c/ Real 3            CASTILLEJA         7,33
				13 LOPEZ BARBAZAN       MANUEL     c/ Sierpes 3         SEVILLA            6,33
				14 MARIN GELO           JOSE M.    c/ Sierpes 3         SEVILLA            7,67
				15 MAYA MILES           SAMUEL     c/ Sierpes 3         SEVILLA             6,5
				16 MORALES LUNA         JORGE      c/ Real 3            CASTILLEJA          5,5
				17 ORDOÐEZ BERNALDEZ    JAVIER     c/ Real 3            CASTILLEJA          7,5
				18 PONCE RODRIGUEZ      JOSE M.    c/ Real 3            CASTILLEJA            5
				19 ROMERO PEREZ         TERESA     c/ Sierpes 3         SEVILLA             6,5
				20 RUA CONDE            JOAQUIN    c/ Sierpes 3         SEVILLA               7
		
		-- Este es el resultado antes de que se ejecute procedimiento
		
		 CODIGO_AL APELLIDOS_AL         NOMBRE_AL  DOMICILIO_AL         LOCALIDAD_ NOTAMEDIA_AL
		---------- -------------------- ---------- -------------------- ---------- ------------
				 1 SANOGO               BAFLE MOR  c/ Feria 100         SEVILLA             
				 2 ALVAREZ CAMINO       JOAQUIN    c/ Sierpes 3         SEVILLA            
				 3 BAENA QUINTERO       FRANCISCO  c/ Sierpes 3         SEVILLA            
				 4 BENITEZ MORALES      PEDRO L.   c/ Sierpes 3         SEVILLA            
				 5 BERNABEU DE LOPE     ARTURO     c/ Sierpes 3         SEVILLA             
				 6 CASTRO EXPOSITO      ABRAHAM    c/ Sierpes 3         SEVILLA               
				 7 CASTRO GARCIA        ALEJANDRO  c/ Real 3            CASTILLEJA            
				 8 ESCAMILLA PEREJON    MANUEL     c/ Sierpes 3         SEVILLA             
				 9 FRANCO DOMINGUEZ     DIEGO J.   c/ Sierpes 3         SEVILLA             
				10 GORDILLO REINA       ALVARO A.  c/ Sierpes 3         SEVILLA               
				11 HERRERO SAN ROMAN    ESTEBAN    c/ Sierpes 3         SEVILLA               
				12 JIMENEZ NAVARRO      DAVID      c/ Real 3            CASTILLEJA         
				13 LOPEZ BARBAZAN       MANUEL     c/ Sierpes 3         SEVILLA            
				14 MARIN GELO           JOSE M.    c/ Sierpes 3         SEVILLA            
				15 MAYA MILES           SAMUEL     c/ Sierpes 3         SEVILLA             
				16 MORALES LUNA         JORGE      c/ Real 3            CASTILLEJA         
				17 ORDOÐEZ BERNALDEZ    JAVIER     c/ Real 3            CASTILLEJA          
				18 PONCE RODRIGUEZ      JOSE M.    c/ Real 3            CASTILLEJA            
				19 ROMERO PEREZ         TERESA     c/ Sierpes 3         SEVILLA             
				20 RUA CONDE            JOAQUIN    c/ Sierpes 3         SEVILLA               
	
	


------------------------------------------------------------------------------------------------------------
4.- Diseña el procedimiento 'CuentaNotas' que reciba como parámetros de entrada el código de una asignatura y el valor de una nota, y devuelva el número de alumnos que tienen esa nota de los matriculados en esa asignatura y cuantos de ellos son repetidores.
(Nota: Recuerda la opción OUT en los argumentos de un procedimiento)

Código:

	CREATE OR REPLACE PROCEDURE pr_CuentaNotas
	(p_cod_asig IN ASIGNATURAS.CODIGO_AS%TYPE,
	p_nota IN MATRICULAS.NOTA_MA%TYPE,
	p_num_alumnos OUT NUMBER,
	p_num_repetidores OUT NUMBER)
	IS
	BEGIN
	
		SELECT COUNT(*) INTO p_num_alumnos
		  FROM MATRICULAS
			WHERE CODAS_MA = p_cod_asig AND NOTA_MA = p_nota;
	  
		SELECT COUNT(*) INTO p_num_repetidores
		FROM MATRICULAS
	  WHERE CODAS_MA = p_cod_asig AND NOTA_MA = p_nota AND REPITE_MA = 'S';
	  
	EXCEPTION
		  WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Error: ' || SQLCODE || ' - ' || SQLERRM);
			ROLLBACK;
	END pr_CuentaNotas;
	/
	
	-- Para comprobarlo
	
		DECLARE
		  v_num_alumnos NUMBER;
		  v_num_repetidores NUMBER;
		BEGIN
		  pr_CuentaNotas(1, 7, v_num_alumnos, v_num_repetidores);
		  DBMS_OUTPUT.PUT_LINE('Número de alumnos con nota 7: ' || v_num_alumnos);
		  DBMS_OUTPUT.PUT_LINE('Número de repetidores con nota 7: ' || v_num_repetidores);
		END;
		/
		
		-- Número de alumnos con nota 7: 4
		-- Número de repetidores con nota 7: 2

		-- Procedimiento PL/SQL terminado correctamente.


------------------------------------------------------------------------------------------------------------
5.- Diseña el procedimiento 'ListaAsignatura' que reciba como argumento el código de una asignatura y muestre un listado de los alumnos de la misma similar al siguiente:
------------------------------------------------------
Asignatura: Java
Profesor: RUIZ DE LOPERA, MANUEL

	Nombre							Rep		Nº Asig Matriculado
	------							---		--------------------
 1	SANOGO, BAFLE MOR				N		2
 2	ÁLVAREZ CAMINO, JOAQUÍN			N		3	
 3	BAENA QUINTERO, FRANCISCO		S		3
 4	BENÍTEZ MORALES, PEDRO L.		N		3	
 5	HERRERO SAN ROMÁN, ESTEBAN		S		1
 6	JIMÉNEZ NAVARRO, DAVID			N		3
 7	LÓPEZ BARBAZÁN, MANUEL			N		3
 8	MARÍN GELO, JOSÉ M.				S		3
------------------------------------------------------------------------------------------------------------

Código:
	
	CREATE OR REPLACE PROCEDURE pr_ListaAsignatura
	(p_asignatura Asignaturas.Codigo_as%TYPE)
	IS
		v_nombre Asignaturas.Nombre_as%TYPE;
		v_profesor VARCHAR2(35);
		CURSOR c_datos IS
			SELECT Codigo_al, Apellidos_al, Nombre_al, Repite_ma
			FROM Alumnos, Matriculas
			WHERE CodAl_ma = Codigo_al
			AND CodAs_ma = p_asignatura;
		v_nAsignaturas NUMBER;
	BEGIN
		SELECT Nombre_as, Apellidos_pr || ', ' || Nombre_pr INTO v_nombre, v_profesor
			FROM Asignaturas, Profesores
			WHERE Codigo_pr = Profesor_as AND Codigo_as = p_asignatura;
	
		DBMS_OUTPUT.PUT_LINE('Asignaturas ' || v_nombre);
		DBMS_OUTPUT.PUT_LINE('Profesor: ' || v_profesor);
		DBMS_OUTPUT.PUT_LINE('Nombre' || LPAD(' ', 25) || 'Rep' || LPAD(' ', 10) || 'Nº Asig Matriculado');
		DBMS_OUTPUT.PUT_LINE('------' || LPAD(' ', 25) || '---' || LPAD(' ', 10) || '-------------------');
		
		FOR reg IN c_datos LOOP
			SELECT COUNT(*) INTO v_nAsignaturas
				FROM Matriculas 
				WHERE CodAl_ma = reg.Codigo_al;
			DBMS_OUTPUT.PUT_LINE(LPAD(reg.Codigo_al, 3, ' ') || LPAD(reg.Apellidos_al || ', ' || reg.Nombre_al, 30, ' ') || LPAD(reg.Repite_ma, 10, ' ') || LPAD(v_nAsignaturas, 23, ' '));
		END LOOP;
		
		EXCEPTION 
			WHEN NO_DATA_FOUND THEN
				DBMS_OUTPUT.PUT_LINE('No existe el código de la asignatura: ' || p_asignatura);
			WHEN others THEN
				DBMS_OUTPUT.PUT_LINE('Error: No existe el alumno.' || 'CODIGO DE ERROR:' || SQLCODE);
	END pr_ListaAsignatura; 
	/
	
	-- Para comprobarlo
	
	BEGIN
		pr_ListaAsignatura(3);
	END;
	/
	
	-- El resultado sería el siguiente:
	
		Asignaturas Java
		Profesor: RUIZ DE LOPERA, MANUEL
				
				Nombre                         Rep          Nº Asig Matriculado
				------                         ---          -------------------
		             SANOGO, BAFLE MOR         	N                      2
		       ALVAREZ CAMINO, JOAQUIN         	N                      3
		     BAENA QUINTERO, FRANCISCO         	S                      3
		    BENITEZ MORALES, PEDRO L.         	N                      3
		    HERRERO SAN ROMAN, ESTEBAN        	S                      1
		       JIMENEZ NAVARRO, DAVID         	N                      3
		        LOPEZ BARBAZAN, MANUEL         	N                      3
		           MARIN GELO, JOSE M.         	S                      3

		-- Procedimiento PL/SQL terminado correctamente.
	


------------------------------------------------------------------------------------------------------------
