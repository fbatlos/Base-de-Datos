--Processos

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


--Invocado:

BEGIN
    pr_lista_empleados(parametros => 20);
END
/