--Fco José Batista De Los Santos , Nota final : 

--1.Escribir un procedimiento que reciba dos números y visualice su suma
CREATE OR REPLACE PROCEDURE Suma_N (
    pr_num IN NUMBER,
    pr_num2 In NUMBER) IS
	


BEGIN
        DBMS_OUTPUT.PUT_LINE('Resultado : ');
        DBMS_OUTPUT.PUT_LINE(pr_num+pr_num2);
END;
/

--Nota : 10

--2. Codificar un procedimiento que reciba una cadena y la visualice al revés.   ///// REVISAR

CREATE OR REPLACE PROCEDURE Reverse_N (palabra IN VARCHAR2 ) IS
    
    str  VARCHAR2(20) := palabra; 
    len  NUMBER; 
    str1 VARCHAR2(20); 
BEGIN
    
    len := Length(str); 
  
   
    FOR i IN REVERSE 1.. len LOOP 
                       
        str1 := str1 
                || Substr(str, i, 1); 
    END LOOP; 
  
    dbms_output.Put_line(str1); 
END;
/

--Nota : 10

--3.Reescribir el código de los ejercicios anteriores convirtiéndolos en funciones.
--Creafuncion sumar de 2 numeros que retornará un numero.
CREATE OR REPLACE FUNCTION Suma_F(
	num IN NUMBER,
    num2 In NUMBER) 
RETURN NUMBER IS

	Resultado NUMBER(9);

BEGIN
    --Suma y guarda el resultado
	Resultado := num + num2;
	--Devuelve el resultado.
	RETURN Resultado;

END;
/

declare
    num1 NUMBER(9);
    num2 NUMBER(9);
    Resultado NUMBER(9);   
begin
    num1:=10;
    num2:=10;
    Resultado := Suma_F(num1,num2);
    DBMS_OUTPUT.PUT_LINE(Resultado);
end;
/

---Hacer la funcion de la act 2

CREATE OR REPLACE FUNCTION Reverse_F (palabra IN VARCHAR2 ) RETURN VARCHAR2 IS
    
    str  VARCHAR2(20) := palabra; 
    len  NUMBER; 
    str1 VARCHAR2(20); 
BEGIN
    
    len := Length(str); 
  
   
    FOR i IN REVERSE 1.. len LOOP 
                       
        str1 := str1 
                || Substr(str, i, 1); 
    END LOOP; 
  
   RETURN (str1); 
END;
/

declare
    palabra VARCHAR2(9);
   
    Resultado VARCHAR2(9);   
begin
    palabra:='REYAZUL';
   
    Resultado := Reverse_F(palabra);
    DBMS_OUTPUT.PUT_LINE(Resultado);
end;
/

--Nota : 10

--4.Escribir una función que reciba una fecha y devuelva el año, en número, correspondiente a esa fecha.
CREATE OR REPLACE FUNCTION Anio_f(
	pr_fecha1 in DATE) 
	RETURN VARCHAR2
IS
	nYear VARCHAR2(9);
BEGIN
    nYear := TO_CHAR(pr_fecha1,'YYYY');
    RETURN nYear;
END;
/

--Nota : 10

--5.Escribir un bloque PL/SQL que haga uso de la función anterior.
declare
    hoy DATE;
BEGIN
    hoy := SYSDATE-8000;
    

    DBMS_OUTPUT.PUT_LINE(Anio_f(hoy));
end;
/

--Nota:10

--6.Desarrollar una función que devuelva el número de años completos que hay entre dos fechas que se pasan como argumentos.

CREATE OR REPLACE FUNCTION Anio2_f(fecha1 DATE,fecha2 DATE) 

	RETURN NUMBER
IS
	nYear NUMBER;
BEGIN
    nYear := months_between(fecha1, fecha2)/12;
	nYear := TRUNC(nYear);
	
	RETURN ABS(nYear);
END;
/

declare
    hoy DATE;
    antes DATE;
BEGIN
    hoy := SYSDATE-8000;
    antes := SYSDATE;

    DBMS_OUTPUT.PUT_LINE(Anio2_f(hoy,antes));
end;
/

--Nota : 10

--7.Escribir una función que, haciendo uso de la función anterior devuelva los trienios que hay entre dos fechas. (Un trienio son tres años completos).

--Declaramos el dia de hoy y antes es otro año diferente
declare
    hoy DATE;
    antes DATE;
    
    trienio NUMBER(3);
BEGIN
--Le damos valor a las variables
    hoy := SYSDATE-8000;
    antes := SYSDATE;
    --El valor de la variable es la funcion Anio2_f que retorna la diferencia de los dos y lo divide en 3 para saber cuantos trienios tienes.
    trienio := TRUNC(Anio2_f(hoy,antes)/3);
--Impreime lo necesario.
    DBMS_OUTPUT.PUT_LINE('El numero de trienios : ');
    DBMS_OUTPUT.PUT_LINE(trienio);
end;
/

--8.Dado el siguiente procedimiento:

CREATE OR REPLACE PROCEDURE crear_depart (
  v_num_dept depart.dept_no%TYPE, 
  v_dnombre depart.dnombre%TYPE DEFAULT 'PROVISIONAL',
  v_loc depart.loc%TYPE DEFAULT ‘PROVISIONAL’)
IS
BEGIN
  INSERT INTO depart
    VALUES (v_num_dept, v_dnombre, v_loc);
END crear_depart;
/

--8.Indicar cuáles de las siguientes llamadas son correctas y cuáles incorrectas, en este último caso escribir la llamada correcta usando la notación posicional (en los casos que se pueda):
crear_depart;				-- 1º No funciona ya que es necesario poner 1 argumento como minimo.
crear_depart(50);				-- 2º	Si funciona ya que solo es necesario el num de departamento , los demas tienen valores por defecto.
crear_depart('COMPRAS');			-- 3º No funciona por lo anterior
crear_depart(50,'COMPRAS');			-- 4º Si funciona ya que solo es necesario el departaento pero tambien se puede cambiar el nombre del departamento.
crear_depart('COMPRAS', 50);			-- 5º El orden no es el correcto.
crear_depart('COMPRAS', 'VALENCIA');		-- 6º El primero es un valor numerico no un varchar2
crear_depart(50, 'COMPRAS', 'VALENCIA');	-- 7º Si funciona pues tiene bien el orden y ddemas.
crear_depart('COMPRAS', 50, 'VALENCIA');	-- 8º No funciona.

Resolucion :  

crear_depart(v_dnombre=>'COMPRAS', v_num_dept => 50, v_loc => 'VALENCIA');

--Nota : 10

--9.Codificar un procedimiento que reciba una lista de hasta 5 números y visualice su suma.

CREATE OR REPLACE PROCEDURE Suma_List_N (
    num IN NUMBER DEFAULT 0,
    num2 In NUMBER DEFAULT 0,
    num3 In NUMBER DEFAULT 0,
    num4 In NUMBER DEFAULT 0,
    num5 In NUMBER DEFAULT 0) IS
	--Crea un Array del tipo y longitud deseadas.
    TYPE lista IS VARRAY(5) of NUMBER(9);
    
    listaNum lista := lista(num,num2,num3,num4,num5);

    Resultado NUMBER;
BEGIN

        DBMS_OUTPUT.PUT_LINE('Resultado : ');
        --las suma de los numeros puestos.
        Resultado:= listaNum(1)+listaNum(2)+listaNum(3)+listaNum(4)+listaNum(5);
        DBMS_OUTPUT.PUT_LINE(Resultado);
END;
/

--Nota : 10

--10.Implementar un procedimiento que reciba un importe y visualice el desglose del cambio en unidades monetarias de 1, 2, 5, 10, 20, 50, 100, 200 y 500 € en orden inverso al que aparecen aquí enumeradas.
CREATE OR REPLACE PROCEDURE MostrarCambio(p_importe NUMBER)
IS --variables necesarias
    v_cambio NUMBER:=p_importe;
    v_moneda NUMBER;
    v_cantidad NUMBER;
BEGIN
    dbms_output.put_line('Desglose de: ' || p_importe || ' euros.');
    --Da el cambio hasta que se complete
    WHILE v_cambio > 0 LOOP
        --Cada if es un tipo de cambio 
        IF v_cambio >= 500 THEN
            v_moneda:=500;
        ELSIF v_cambio >= 200 THEN
            v_moneda:=200;
        ELSIF v_cambio >= 100 THEN
            v_moneda:=100;
        ELSIF v_cambio >= 50 THEN
            v_moneda:=50;
        ELSIF v_cambio >= 20 THEN
            v_moneda:=20;
        ELSIF v_cambio >= 10 THEN
            v_moneda:=10;
        ELSIF v_cambio >= 5 THEN
            v_moneda:=5;
        ELSIF v_cambio >= 2 THEN
            v_moneda:=2;
        ELSIF v_cambio >= 1 THEN
            v_moneda:=1;
        ELSIF v_cambio >= 0.5 THEN
            v_moneda:=0.5;
        ELSIF v_cambio >= 0.2 THEN
            v_moneda:=0.2;
        ELSIF v_cambio >= 0.1 THEN
            v_moneda:=0.1;
        ELSIF v_cambio >= 0.05 THEN
            v_moneda:=0.05;
        ELSIF v_cambio >= 0.02 THEN
            v_moneda:=0.02;
        ELSE
            v_moneda:=0.01;
        END IF;
        --Hace la diferencia de la cantidad a dever y el cambi es el resto que falta
        v_cantidad:=TRUNC(v_cambio/v_moneda);
        v_cambio:=MOD(v_cambio,v_moneda);
        dbms_output.put_line('Billetes/monedas de ' || v_moneda || ': ' || v_cantidad);
    END LOOP;
END ;
/

--11.Codificar un procedimiento que permita borrar un empleado cuyo código se pasará en la llamada.

SELECT * from EMPLE;

CREATE OR REPLACE PROCEDURE eliminar_emple (EMPLE_n IN NUMBER)
IS
    
BEGIN
  
  DELETE EMPLE
  WHERE EMP_NO = EMPLE_n;
  --Si hay alteracion en sql lo cuenta 
  if SQL%ROWCOUNT=1 then
  	dbms_output.put_line('Registro Borrado');
  else
  	dbms_output.put_line('Empleado no encontrado');
  end if;

END ;
/

--Nota : 10

--12.Escribir un procedimiento que modifique la localidad de un departamento. El procedimiento recibirá como parámetros el número del departamento y la localidad nueva.

create or replace procedure CambiarLoc (
    p_numdept dept.deptno%TYPE, 
    p_localidad dept.loc%TYPE)
is

begin
  update dept
  set loc = p_localidad
  where deptno=p_numdept;
  --Si hay alteracion en sql lo cuenta 
  if SQL%ROWCOUNT=1 then
  	dbms_output.put_line('Registro modificado');
  else
  	dbms_output.put_line('Departamento no encontrado');
  end if;
end CambiarLoc;
/

--Nota : 10

--13.Visualizar todos los procedimientos y funciones del usuario almacenados en la base de datos y su situación (valid o invalid).
SELECT OWNER, OBJECT_NAME, OBJECT_TYPE, STATUS
FROM ALL_OBJECTS
WHERE OBJECT_TYPE IN ('PROCEDURE','FUNCTION')
and OWNER = 'USUARIOT';-3