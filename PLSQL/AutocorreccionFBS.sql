Francisco jose Batista de los Santos---Nota : 10

--TAREA1:
-- Crear un cursor explicito
-- para visualizar el nombre y la localidad de todos
-- los departamentos de la tabla DEPART
DECLARE
	
	CURSOR c_DEPART_INF IS 			---Declaramos el cursor , con un select de departamento que nos da el nombre y la localidad.
		SELECT DNOMBRE , LOC
		FROM DEPART;
	
BEGIN

	FOR i in c_DEPART_INF LOOP --Inicia el bucle , imprime el nombre y la localizacion y cuando no existan mas filas en el cursor , este se cierra y sale del loop
		
		EXIT WHEN c_DEPART_INF%NOTFOUND;
		
		DBMS_OUTPUT.PUT_LINE(i.DNOMBRE||' está en '||i.LOC);

		DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
		
	END LOOP;

EXCEPTION 

    WHEN NO_DATA_FOUND THEN-- Si hay un error de datos no encontrados
        DBMS_OUTPUT.PUT_LINE('No se ha encontrado registro.');
    WHEN OTHERS THEN--Para un error que no este contemplado.
        DBMS_OUTPUT.PUT_LINE(SQLCODE);

END;
/

--Nota : 10


---Otra forma

DECLARE
	
	CURSOR c_DEPART_INF IS 
		SELECT DNOMBRE , LOC
		FROM DEPART;

	cv_Departamento c_DEPART_INF%ROWTYPE;
	
BEGIN

	OPEN c_DEPART_INF;
		LOOP
			FETCH c_DEPART_INF INTO cv_Departamento;

			EXIT WHEN c_DEPART_INF%NOTFOUND;
			
			DBMS_OUTPUT.PUT_LINE(cv_Departamento.DNOMBRE||' está en '||cv_Departamento.LOC);

			DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
			
		END LOOP;
	CLOSE c_DEPART_INF;

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
	CURSOR c_DEPART_INF IS  -- Declaramos el cuersor , que tentrá una select con los apellidos del departammento 20
		SELECT apellido
		FROM EMPLE
        WHERE DEPT_NO = 20;
	
BEGIN
    DBMS_OUTPUT.PUT_LINE('Los  apellidos del departamento 20 son : ');

	FOR i in c_DEPART_INF LOOP-- Iniciamos ell for que abrirá el cursor y hará fech a la variable i , dentro se imprime y cuando no queden mas filas saldrá , se cerrará el cursor .
		
		EXIT WHEN c_DEPART_INF%NOTFOUND;
		
		DBMS_OUTPUT.PUT_LINE( c_DEPART_INF%ROWCOUNT|| ' ' ||i.apellido);

		DBMS_OUTPUT.PUT_LINE('-----------------');
		
	END LOOP;

EXCEPTION

    WHEN NO_DATA_FOUND THEN -- Si hay un error de datos no encontrados
        DBMS_OUTPUT.PUT_LINE('No se ha encontrado registro.');
    
	WHEN OTHERS THEN-- Si hay un error inesperado imprime el error.
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
		DBMS_OUTPUT.PUT_LINE(SQLERRM);
		--Poner err y un mini mensaje

END;
/

--Comentar un poco
--Nota : 10

--Otra forma : 

DECLARE
	CURSOR c_DEPART_INF IS 
		SELECT apellido
		FROM EMPLE
        WHERE DEPT_NO = 20;
	
	vc_Empleados c_DEPART_INF%ROWTYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Los  apellidos del departamento 20 son : ');

	open c_DEPART_INF;
		
		LOOP
			FETCH c_DEPART_INF into vc_Empleados;

			EXIT WHEN c_DEPART_INF%NOTFOUND;
			
			DBMS_OUTPUT.PUT_LINE( c_DEPART_INF%ROWCOUNT|| ' ' ||vc_Empleados.apellido);

			DBMS_OUTPUT.PUT_LINE('-----------------');
			
		END LOOP;

	CLOSE c_DEPART_INF;

EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se ha encontrado registro.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
		DBMS_OUTPUT.PUT_LINE(SQLERRM);
		--Poner err y un mini mensaje

END;
/



--TAREA3:
-- Para cualquier departamento, visualizar los apellidos de sus empleados.
-- Utiliza un procedimiento en el que pasandole por parametro
---el departamento, lo utilize en el cursor para ir procesando los empleados
-- de dicho departamento y mostrando sus apellidos.


CREATE OR REPLACE PROCEDURE pr_lista_empleados (depto_nu in number) 
IS
	
	CURSOR c_DEPART_INF IS -- Declaramos el cuersor , que tentrá una select con los apellidos del departammento que le pongamos
		SELECT apellido
		FROM EMPLE
        WHERE DEPT_NO = depto_nu;
	
BEGIN-- Iniciamos ell for que abrirá el cursor y hará fech a la variable i , dentro se imprime y cuando no queden mas filas saldrá , se cerrará el cursor .
    DBMS_OUTPUT.PUT_LINE('Los  apellidos deldepartamento 20 son : ');
	FOR i in c_DEPART_INF LOOP
		
		EXIT WHEN c_DEPART_INF%NOTFOUND;
		
		DBMS_OUTPUT.PUT_LINE( c_DEPART_INF%ROWCOUNT|| ' ' ||i.apellido);

		DBMS_OUTPUT.PUT_LINE('-----------------');
		
	END LOOP;
             
EXCEPTION

    WHEN NO_DATA_FOUND THEN-- Si hay un error de datos no encontrados
        DBMS_OUTPUT.PUT_LINE('No se ha encontrado registro.');
       
    WHEN OTHERS THEN-- Si hay un error inesperado imprime el error.
        DBMS_OUTPUT.PUT_LINE(SQLCODE);

END;
/

--Otras formas 

CREATE OR REPLACE PROCEDURE pr_lista_empleados2 (depto_nu in number) IS
	
	CURSOR c_DEPART_INF IS 
		SELECT apellido
		FROM EMPLE
        WHERE DEPT_NO = depto_nu;

	cv_Empleados c_DEPART_INF%ROWTYPE;
	
BEGIN

    DBMS_OUTPUT.PUT_LINE('Los  apellidos deldepartamento 20 son : ');
	
	open c_DEPART_INF;

		LOOP
			FETCH c_DEPART_INF into cv_Empleados;

			EXIT WHEN c_DEPART_INF%NOTFOUND;
			
			DBMS_OUTPUT.PUT_LINE( c_DEPART_INF%ROWCOUNT|| ' ' ||cv_Empleados.apellido);

			DBMS_OUTPUT.PUT_LINE('-----------------');
			
		END LOOP;

	CLOSE c_DEPART_INF;
             
EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se ha encontrado registro.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE);

END;
/