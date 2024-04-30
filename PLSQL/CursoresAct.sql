--1.Desarrollar un procedimiento que visualice el apellido y la fecha de alta de todos los empleados ordenados por apellido.

create or replace procedure buscar_emple (empleado_n emple.EMP_NO%TYPE)
is
    CURSOR apellidos IS
		SELECT EMP_NO,FECHA_AL
		FROM EMPLE
		WHERE EMP_NO like empleado_n;
begin
    FOR i in apellidos LOOP
        DBMS_OUTPUT.PUT_LINE(i.EMP_NO || " se dio de alta el " || i.FECHA_AL);
    END LOOP;

EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se ha encontrado registro.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end;
/