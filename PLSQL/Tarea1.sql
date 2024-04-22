--TAREA1:
-- Crear un cursor explicito
-- para visualizar el nombre y la localidad de todos
-- los departamentos de la tabla DEPART
DECLARE
	
	CURSOR c_DEPART_INF IS 
		SELECT DNOMBRE , LOC
		FROM DEPART;
	
BEGIN

	FOR i in c_DEPART_INF LOOP
		
		EXIT WHEN c_DEPART_INF%NOTFOUND;
		
		DBMS_OUTPUT.PUT_LINE(i.DNOMBRE||' está en '||i.LOC);

		DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
		
	END LOOP;

EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se ha encontrado registro.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE);

END;
/



--TAREA2:
-- Utilizando un cursor explicito
-- visualizar los apellidos de los empleados
-- pertenecientes al departamento 20
-- numerandolos secuencialmente . pista: utilizar %ROWCOUNT
DECLARE
	CURSOR c_DEPART_INF IS 
		SELECT apellido
		FROM EMPLE
        WHERE DEPT_NO = 20;
	
BEGIN
    DBMS_OUTPUT.PUT_LINE('Los  apellidos deldepartamento 20 son : ');
	FOR i in c_DEPART_INF LOOP
		
		EXIT WHEN c_DEPART_INF%NOTFOUND;
		
		DBMS_OUTPUT.PUT_LINE( c_DEPART_INF%ROWCOUNT|| ' ' ||i.apellido);

		DBMS_OUTPUT.PUT_LINE('-----------------');
		
	END LOOP;

EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se ha encontrado registro.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE);

END;
/

--TAREA3:
-- Para cualquier departamento, visualizar los apellidos de sus empleados.
-- Utiliza un procedimiento en el que pasandole por parametro
---el departamento, lo utilize en el cursor para ir procesando los empleados
-- de dicho departamento y mostrando sus apellidos.


CREATE OR REPLACE PROCEDURE listar_apellidos_empleados(depto_nu in number) 
IS
	
	CURSOR c_DEPART_INF IS 
		SELECT apellido
		FROM EMPLE
        WHERE DEPT_NO = depto_nu;
	
BEGIN
    DBMS_OUTPUT.PUT_LINE('Los  apellidos deldepartamento 20 son : ');
	FOR i in c_DEPART_INF LOOP
		
		EXIT WHEN c_DEPART_INF%NOTFOUND;
		
		DBMS_OUTPUT.PUT_LINE( c_DEPART_INF%ROWCOUNT|| ' ' ||i.apellido);

		DBMS_OUTPUT.PUT_LINE('-----------------');
		
	END LOOP;
             
EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se ha encontrado registro.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE);

END;
/



---Otras formas.