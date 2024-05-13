------------------------------------------------------------------------------------------------------------
--	Nombre: <Pon tu nombre aqu�>
------------------------------------------------------------------------------------------------------------
	INSTRUCCIONES:
	==============

-Salva este fichero con las iniciales de tu nombre y apellidos:
	Ejemplo:	Jos� Mar�a Rivera Calvete
			JMRC.sql

-Pon tu nombre al ejercicio en la primera l�nea y lee atentamente todas las preguntas.

-Carga el script para el examen desde el fichero "DatosPLSQL.sql".

-RECUERDA: guardar, cada cierto tiempo, el contenido de este fichero. Es lo que voy a evaluar, si lo pierdes, lo siento, en el final tendr�s otra oportunidad.

PUNTUACI�N
==========
- Cada pregunta vale 2 puntos


- Se considerar� para la evaluaci�n:
	- Que funcione
	- Estilo de programaci�n
	- Legibilidad del c�digo
	- Tratamiento de excepciones
	- C�digo reutilizable y param�trico
	- Cursores adecuados

------------------------------------------------------------------------------------------------------------
1.- Diseña el procedimiento 'MediasAsig' que reciba como parametro el codigo de una asignatura y actualice el campo 'Notamedia_as' de la tabla 'Asignaturas' al valor medio de las notas de los alumnos que est�n matriculados, el campo 'Nota_ma', considerando que para el c�lculo de la media se condiderar�n las notas de los alumons repetidores de la siguiente manera:
	- Si esta aprobado, un 5, independientemente de la nota que tenga.
	- Si esta suspenso, el valor de su nota, el campo 'Nota_ma'.

C�digo:

CREATE OR REPLACE PROCEDURE MediasAsig(pr_codAS_ma number)
IS		
BEGIN

	update Matriculas
		SET Nota_ma = 5
		WHERE UPPER(REPITE_MA) = 'S'
		and Nota_ma >= 5;

	UPDATE Asignaturas
	SET Notamedia_as = 	(SELECT AVG(Nota_ma)
						FROM Matriculas
						group by CodAs_ma
						HAVING CodAs_ma = pr_codAS_ma)
	WHERE CODIGO_AS = pr_codAS_ma;

	if SQL%ROWCOUNT=1 then
  		dbms_output.put_line('Se actualizo con exito');
  	else
		dbms_output.put_line('No se ha actualizado.');
	end if;

EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se ha encontrado registro.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE);

END;
/



------------------------------------------------------------------------------------------------------------
2.- Dise�a la funci�n 'CalculaMedia' que reciba como par�metro el c�digo de un alumno y devuelva la media de las notas de las asignaturas en las que est� matriculado.

C�digo:

------------------------------------------------------------------------------------------------------------
3.- Dise�a el procedimiento 'MediasAsig' que modifique el campo 'Notamedia_al' de la tabla 'Alumnos' al valor de la media de las notas de las asignaturas en las que est� matriculado.

C�digo:


------------------------------------------------------------------------------------------------------------
4.- Dise�a el procedimiento 'CuentaNotas' que reciba como par�metros de entrada el c�digo de una asignatura y el valor de una nota, y devuelva el n�mero de alumnos que tienen esa nota de los matriculados en esa asignatura y cuantos de ellos son repetidores.
(Nota: Recuerda la opci�n OUT en los argumentos de un procedimiento)

C�digo:


------------------------------------------------------------------------------------------------------------
5.- Dise�a el procedimiento 'ListaAsignatura' que reciba como argumento el c�digo de una asignatura y muestre un listado de los alumnos de la misma similar al siguiente:
------------------------------------------------------
Asignatura: Java
Profesor: RUIZ DE LOPERA, MANUEL

	Nombre							Rep		N� Asig Matriculado
	------							---		--------------------
 1	SANOGO, BAFLE MOR				N		2
 2	�LVAREZ CAMINO, JOAQU�N			N		3	
 3	BAENA QUINTERO, FRANCISCO		S		3
 4	BEN�TEZ MORALES, PEDRO L.		N		3	
 5	HERRERO SAN ROM�N, ESTEBAN		S		1
 6	JIM�NEZ NAVARRO, DAVID			N		3
 7	L�PEZ BARBAZ�N, MANUEL			N		3
 8	MAR�N GELO, JOS� M.				S		3
------------------------------------------------------------------------------------------------------------

C�digo:


------------------------------------------------------------------------------------------------------------
