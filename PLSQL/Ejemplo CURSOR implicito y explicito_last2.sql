-----------------------------------------------------
-- Cursor implícito con variable (SELECT INTO)

-- Nota: la tabla de empleados que se utiliza 
-- está en el script EmpresaRec
-----------------------------------------------------
DECLARE
	vr_reg	            	Empleados%ROWTYPE;
	i	                	number := 1;
BEGIN
	LOOP
		SELECT * INTO vr_reg
		FROM Empleados
		WHERE COD_EM = i;
		
		DBMS_OUTPUT.PUT_LINE(vr_reg.cod_em||' '||vr_reg.nomb_em);
		
		i := i + 1;
		
		EXIT WHEN i > 30;
		
	END LOOP;
	

END;
/

--Es un cursor 

-----------------------------------------------------
-- Cursor explícito (Definido antes del BEGIN variable)
-----------------------------------------------------
DECLARE
	vt_codigo   EMPLEADOS.cod_em%type;
	
	CURSOR c_Ejemplo IS 
		SELECT COD_EM, NOMB_EM, SALARIO_EM, NOMB_DE
		FROM EMPLEADOS, DEPARTAMENTOS
		WHERE COD_DE = DEPT_EM
			AND COD_EM < vt_codigo;
			
	vr_reg	  	c_Ejemplo%ROWTYPE;
	
BEGIN
	vt_codigo  := 15;
	OPEN c_Ejemplo;
	LOOP
		FETCH c_Ejemplo INTO vr_reg;
		
		EXIT WHEN c_Ejemplo%NOTFOUND;
		
		DBMS_OUTPUT.PUT_LINE(vr_reg.cod_em||' '||vr_reg.nomb_em);
		DBMS_OUTPUT.PUT_LINE(vr_reg.salario_em||' '||vr_reg.nomb_de);
		DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
		
	END LOOP;
	CLOSE c_Ejemplo;
END;
/

 

-- Tarea1: Pensar durante 5 minutos que hace el bloque de código anterior, y escribir con detalle cual es la operativa que se haría al ejecutar este script (pero sin ejecutarlo).

--Es un cursor explicito ya que esta en la zona ejecutiva y se declara variable,imprimira el cod , nombre , salaario y nombre_de del empleado , así durante 14 veces.

--

--Lo hace de tal forma que guarda en el cursor c_Ejemplo los empleados y el departamento , se declaran otras 2 varibles qe son vt_codigo que nos dirá las veces que dará vueltas el loop
--y tambienn vr_reg que es donde se cargarán todas las columnas del cuersor .
--Luego en lazona ejecutiva se definirá el numero de vueltas , se creará un loop y se imprimirá lo necesario , se terminará el loop y se cerrará el cursor .


-- Tarea2: convertir este bloque de codigo PL/SQL, y hacerlo ahora con FOR.
DECLARE
	vt_codigo   EMPLEADOS.cod_em%type;
	
	CURSOR c_Ejemplo IS 
		SELECT COD_EM, NOMB_EM, SALARIO_EM, NOMB_DE
		FROM EMPLEADOS, DEPARTAMENTOS
		WHERE COD_DE = DEPT_EM
			AND COD_EM < vt_codigo;
	
BEGIN
	vt_codigo  := 15;
	FOR i in c_Ejemplo LOOP
		
		EXIT WHEN c_Ejemplo%NOTFOUND;
		
		DBMS_OUTPUT.PUT_LINE(i.cod_em||' '||i.nomb_em);
		DBMS_OUTPUT.PUT_LINE(i.salario_em||' '||i.nomb_de);
		DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
		
	END LOOP;
END;
/
-- Tarea3: convertir este bloque de codigo PL/SQL, y hacerlo ahora con cursor explicito dinamico (es decir, con parametro, fijate en el pdf de la teoría a modo de ejemplo)

DECLARE
	
	CURSOR c_Ejemplo(vt_codigo   EMPLEADOS.cod_em%type := 15) IS 
		SELECT COD_EM, NOMB_EM, SALARIO_EM, NOMB_DE
		FROM EMPLEADOS, DEPARTAMENTOS
		WHERE COD_DE = DEPT_EM
			AND COD_EM < vt_codigo;
	
BEGIN
	FOR i in c_Ejemplo LOOP
		
		EXIT WHEN c_Ejemplo%NOTFOUND;
		
		DBMS_OUTPUT.PUT_LINE(i.cod_em||' '||i.nomb_em);
		DBMS_OUTPUT.PUT_LINE(i.salario_em||' '||i.nomb_de);
		DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
		
	END LOOP;
END;
/


























-----------------------------------------------------
-- Bucle de CURSOR
-----------------------------------------------------
DECLARE
	codigo EMPLEADOS.cod_em%type:=15;
	CURSOR Ejemplo IS 
		SELECT COD_EM, NOMB_EM, SALARIO_EM, NOMB_DE
		FROM EMPLEADOS, DEPARTAMENTOS
		WHERE COD_DE = DEPT_EM
			AND COD_EM < codigo;
BEGIN
	FOR reg IN Ejemplo LOOP
		DBMS_OUTPUT.PUT_LINE(reg.cod_em||' '||reg.nomb_em);
		DBMS_OUTPUT.PUT_LINE(reg.salario_em||' '||reg.nomb_de);
	END LOOP;
END;
/













