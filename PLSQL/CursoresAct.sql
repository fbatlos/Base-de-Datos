--1.Desarrollar un procedimiento que visualice el apellido y la fecha de alta de todos los empleados ordenados por apellido.

create or replace procedure buscar_emple 
is
    CURSOR apellidos IS ---Cursor de los apellidos con su fecha de alta
		SELECT APELLIDO,FECHA_ALT
		FROM EMPLE
		order by APELLIDO;
begin
    FOR i in apellidos LOOP -- Bucle para ir imprimiendo los datos obtenidos de la tabla. 

        EXIT WHEN apellidos%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(i.APELLIDO || ' se dio de alta el ' || i.FECHA_ALT);

    END LOOP;

EXCEPTION--Lugar de excepciones por si hay alguna excepcion.

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se ha encontrado registro.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE( 'SQL ERROR : '|| SQLCODE);
end;
/

--2.Codificar un procedimiento que muestre el nombre de cada departamento y el número de empleados que tiene.

create or replace procedure contar_emple 
is
    CURSOR DEPART_INF IS--Cursor que guarda el nombre del departamento y cuanta las personas del departamento
		SELECT d.DNOMBRE , COUNT(em.DEPT_NO) as empleados
        FROM depart d , emple em
        WHERE d.DEPT_NO = em.DEPT_NO
        GROUP by DNOMBRE;
begin
    FOR i in DEPART_INF LOOP -- Bucle que imprime los datos

        EXIT WHEN DEPART_INF%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(i.DNOMBRE || 'hay : ' || i.empleados || ' empleados');

    END LOOP;

EXCEPTION--Lugar de excepciones por si hay alguna excepcion.

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se ha encontrado registro.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE( 'SQL ERROR : '|| SQLCODE);
end;
/


--la select 

SELECT d.DNOMBRE , COUNT(em.DEPT_NO)
FROM depart d , emple em
WHERE d.DEPT_NO = em.DEPT_NO
GROUP by DNOMBRE;


--3.Escribir un procedimiento que reciba una cadena y visualice el apellido y el número de empleado de todos los empleados cuyo apellido contenga la cadena especificada. Al finalizar visualizar el número de empleados mostrados.

create or replace procedure busacar_emple_cadena (cadena_v in varchar2) 
is
    CURSOR Buscador_emple IS--Busca si hay algun apellido que contenga a cadena qu hemos introducido .
		SELECT APELLIDO
        FROM EMPLE
        where APELLIDO LIKE '%'|| cadena_v ||'%';

    contador NUMBER(3);    -- contador para sacar el calculo final
begin
    contador:= 0;
    FOR i in Buscador_emple LOOP -- Bucle imprime los datos que necesitamos y ademas suma 1 al contador.

        EXIT WHEN Buscador_emple%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(i.APELLIDO);

        contador := 1+contador ;

    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Hay : ' || contador);

EXCEPTION--Lugar de excepciones por si hay alguna excepcion.

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se ha encontrado registro.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE( 'SQL ERROR : '|| SQLCODE);
end;
/

--
SELECT APELLIDO , COUNT(APELLIDO) as numero_encantrados
FROM EMPLE
where APELLIDO LIKE '%asdsad%';



--4.Escribir un programa que visualice el apellido y el salario de los cinco empleados que tienen el salario más alto.

create or replace procedure busacar_emple_cadena 
is
    CURSOR Orden_salarios IS---Ordena de forma descendiente el salario y guarda el apellido de los empleados.
		SELECT APELLIDO,SALARIO
        FROM EMPLE
        ORDER BY SALARIO DESC;

    cv_empleados Orden_salarios%ROWTYPE; 

    contador NUMBER(2);
  
begin
    contador:= 1;
    OPEN Orden_salarios; -- abrir cusor 

        while contador < 6  loop -- Bucle que será cuando contador sea menos de 6 , introducirá la tabla a la variable cv_empleados y imprime lo que quieras.

            FETCH Orden_salarios INTO cv_empleados;

            EXIT WHEN Orden_salarios%NOTFOUND;

            DBMS_OUTPUT.PUT_LINE(contador || ' ' ||cv_empleados.APELLIDO || ' con salario : ' || cv_empleados.SALARIO);

            contador := 1 + contador;

        END LOOP;

    CLOSE Orden_salarios;--Cerrar cursor


EXCEPTION--Lugar de excepciones por si hay alguna excepcion.

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se ha encontrado registro.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE( 'SQL ERROR : '|| SQLCODE);
end;
/

--5.Codificar un programa que visualice los dos empleados que ganan menos de cada oficio.


CREATE OR REPLACE PROCEDURE MENORES_SUELDOS
iS 

 CURSOR MI_CURSOR IS
  SELECT APELLIDO, OFICIO, SALARIO 
  FROM EMPLE 
  ORDER BY OFICIO, SALARIO;

 v_reg MI_CURSOR%ROWTYPE;

 V_OFICIO v_reg.OFICIO%TYPE;

 CONTADOR NUMBER(2);
 
 BEGIN
    CONTADOR := 0;
    FOR v_reg IN MI_CURSOR LOOP
        IF V_OFICIO = v_reg.OFICIO THEN
            CONTADOR := CONTADOR + 1;
        ELSE
            CONTADOR := 0;
        END IF;
            V_OFICIO := v_reg.OFICIO;
        IF CONTADOR<2 THEN
            DBMS_OUTPUT.PUT_LINE(v_reg.APELLIDO||' '||v_reg.SALARIO||' '||v_reg.OFICIO);
        END IF;
    END LOOP;

EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se ha encontrado registro.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE( 'SQL ERROR : '|| SQLCODE);

END;
/

--6.Escribir un programa que muestre los siguientes datos:
--Para cada empleado: apellido y salario.
--Para cada departamento: Número de empleados y suma de los salarios del departamento.
--Al final del listado: Número total de empleados y suma de todos los salarios.

create or replace procedure datosEmple_Depart 
is
    CURSOR emple_salarios IS

		SELECT APELLIDO,SALARIO
        FROM EMPLE
        ORDER BY SALARIO;


    CURSOR num_emple_depart IS

        SELECT DNOMBRE,COUNT(em.DEPT_NO) as emple_sum ,SUM(em.SALARIO) as salario_sum
        FROM depart d , emple em
        WHERE d.DEPT_NO = em.DEPT_NO
        GROUP by DNOMBRE;

    cv_departamentos num_emple_depart%ROWTYPE;

    sumaSalarios cv_departamentos.salario_sum%TYPE;

    sumarEmpleados cv_departamentos.emple_sum%TYPE;
  
begin
    sumaSalarios := 0;
    sumarEmpleados :=0;

    for i in emple_salarios LOOP
        EXIT WHEN emple_salarios%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(i.APELLIDO || ' con salario : ' || i.SALARIO);

    END LOOP;

    DBMS_OUTPUT.PUT_LINE(' ');

    for j in num_emple_depart LOOP
        EXIT WHEN num_emple_depart%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(j.DNOMBRE || ' con ' || j.emple_sum || ' empleados que juntos cobran : ' || j.salario_sum);

        sumarEmpleados:= j.emple_sum + sumarEmpleados;

        sumaSalarios := j.salario_sum + sumaSalarios;
    END LOOP;
    
     DBMS_OUTPUT.PUT_LINE('Empleados en total : ' || sumarEmpleados);

      DBMS_OUTPUT.PUT_LINE('Salario total : ' || sumaSalarios);

EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se ha encontrado registro.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE( 'SQL ERROR : '|| SQLCODE);
end;
/

--7.Desarrollar un procedimiento que permita insertar nuevos departamentos según las siguientes especificaciones:
--Se pasará al procedimiento el nombre del departamento y la localidad.
--El procedimiento insertará la fila nueva asignando como número de departamento la decena siguiente al número mayor de la tabla.
--Se incluirá gestión de posibles errores.

create or replace procedure datos_nuevo_depart(nombre in varchar2 , localidad in varchar2) 
is
    depart_no_p depart.DEPT_NO%TYPE;
begin

    select MAX(DEPT_NO) into depart_no_p
    FROM depart;

    depart_no_p := 10 + depart_no_p;

    INSERT into depart(DEPT_NO,DNOMBRE,LOC)
    values(depart_no_p,nombre,localidad);

    DBMS_OUTPUT.PUT_LINE('Se ha creado con exito.');

EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se ha encontrado registro.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE( 'SQL ERROR : '|| SQLCODE);
end;
/

--8.Escribir un procedimiento que reciba todos los datos de un nuevo empleado procese la transacción de alta, gestionando posibles errores:
--No existe el departamento.
--No existe el empleado jefe.
--Si ya existía el empleado.

----VERRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR
create or replace procedure datos_nuevo_depart(nombre_p in varchar2 , oficio_p in varchar2,salario_p in number,dept_no_p in NUMBER,comision_p in NUMBER DEFAULT null ) 
is
    NO_DEPART_FOUND EXCEPTION;

    NO_DEPART_FOUND EXCEPTION;
    
    cursor departamentos_no is 
        SELECT DEPT_NO
        from depart;
    
    id_empl depart.EMP_NO%TYPE;

    dir_nuevo depart.DIR%TYPE;

    cv_departamentos departamentos_no%ROWTYPE;

begin
id_empl := 0;

dir_nuevo := 0;

OPEN departamentos_no;
    WHILE departamentos_no%NOTFOUND LOOP
        FETCH departamentos_no into cv_departamentos;
    end LOOP;


    IF (depart_no_p in (cv_departamentos)) THEN
       
       IF UPPER(oficio) = 'PRESIDENTE'THEN
            RAISE NO_PRESIDENTE;
        END IF;

        SELECT MAX(EMP_NO) into id_empl
            from emple;

        SELECT EMP_NO into dir_nuevo
            from emple
            WHERE OFICIO = 'PRESIDENTE';
       
       id_empl:= 1 + id_empl;

       INSERT INTO emple(EMP_NO,APELLIDO,OFICIO,DIR,FECHA_ALT,SALARIO,comision,DEPT_NO)
       VALUES(id_empl,nombre_p,oficio_p,dir_nuevo,SYSDATE,salario_p,comision_p,depart_no_p);
       
    ELSE
        RAISE NO_DEPART_FOUND;
    END IF;
CLOSE departamentos_no;

EXCEPTION
  WHEN NO_DEPART_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No puedes ser el presidente.');
    WHEN NO_DEPART_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se ha encontrado el departamento.');
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se ha encontrado registro.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE( 'SQL ERROR : '|| SQLCODE);
end;
/

--9.Codificar un procedimiento reciba como parámetros un numero de departamento, un importe y un porcentaje; y suba el salario a todos los empleados del departamento indicado en la llamada. La subida será el porcentaje o el importe indicado en la llamada (el que sea más beneficioso para el empleado en cada caso empleado).
