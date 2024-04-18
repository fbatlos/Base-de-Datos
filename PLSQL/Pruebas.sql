declare
   --Variables
   vv_producto  VARCHAR2(14 CHAR);
   vn_unidades  NUMBER(2);
   vn_precio    NUMBER(3,2);
   vd_fecha_entrega DATE;
   vb_oferta    BOOLEAN;
begin

    vv_producto := 'Destornillador';
    vn_unidades := 50;
    vn_precio   := 2.5;
    vd_fecha_entrega    := SYSDATE;
    vb_oferta   := true;

    DBMS_OUTPUT.PUT_LINE('El producto es : ' || vv_producto);
    DBMS_OUTPUT.PUT_LINE('El número de unidades recibidas es : ' || vn_unidades);
    DBMS_OUTPUT.PUT_LINE('El precio unitario es :' || vn_precio);
    DBMS_OUTPUT.PUT_LINE('La fecha de entrega es : ' || TO_CHAR(vd_fecha_entrega,'DD/MM/YYYY'));
    DBMS_OUTPUT.PUT_LINE('El precio unitario es: ' || CASE WHEN vb_oferta then 'Con oferta.' ELSE 'Sin oferta' END);
end;


. ---> Se guarda el buffer

/ ---> Se guarda em buffer y ejecuta.

-- Activar : SET SERVEROUTPUT ON

--------------------------------------------------------Constantes

declare
   --Constantes
   vv_producto CONSTANT VARCHAR2(14 CHAR) := 'Destornillador';
   vn_unidades  CONSTANT NUMBER(2) := 50;
   vn_precio    CONSTANT NUMBER(3,2):= 2.5;
   vd_fecha_entrega CONSTANT DATE := SYSDATE;
   vb_oferta  CONSTANT  BOOLEAN := true;
begin
    DBMS_OUTPUT.PUT_LINE('El producto es : ' || vv_producto);
    DBMS_OUTPUT.PUT_LINE('El número de unidades recibidas es : ' || vn_unidades);
    DBMS_OUTPUT.PUT_LINE('El precio unitario es :' || vn_precio);
    DBMS_OUTPUT.PUT_LINE('La fecha de entrega es : ' || TO_CHAR(vd_fecha_entrega,'DD/MM/YYYY'));
    DBMS_OUTPUT.PUT_LINE('El precio unitario es: ' || CASE WHEN vb_oferta then 'Con oferta.' ELSE 'Sin oferta' END);
end;

------------------------------------------------------------Procedure constante

CREATE or replace procedure pr_tienda_procedimiento is
   --procedure
    vv_producto CONSTANT VARCHAR2(14 CHAR) := 'Destornillador';
    vn_unidades  CONSTANT NUMBER(2) := 50;
    vn_precio    CONSTANT NUMBER(3,2):= 2.5;
    vd_fecha_entrega CONSTANT DATE := SYSDATE;
    vb_oferta  CONSTANT  BOOLEAN := true;
begin
    DBMS_OUTPUT.PUT_LINE('El producto es : ' || vv_producto);
    DBMS_OUTPUT.PUT_LINE('El número de unidades recibidas es : ' || vn_unidades);
    DBMS_OUTPUT.PUT_LINE('El precio unitario es :' || vn_precio);
    DBMS_OUTPUT.PUT_LINE('La fecha de entrega es : ' || TO_CHAR(vd_fecha_entrega,'DD/MM/YYYY'));
    DBMS_OUTPUT.PUT_LINE('El precio unitario es: ' || CASE WHEN vb_oferta then 'Con oferta.' ELSE 'Sin oferta' END);
end pr_tienda_procedimiento;

--------------------------------------------------------Procedure normal
CREATE or replace procedure pr_tienda_procedure is
   --funcion
    vv_producto  VARCHAR2(14 CHAR);
    vn_unidades  NUMBER(2);
    vn_precio    NUMBER(3,2);
    vd_fecha_entrega DATE;
    vb_oferta    BOOLEAN;

begin   

    vv_producto := 'Destornillador';
    vn_unidades := 50;
    vn_precio   := 2.5;
    vd_fecha_entrega    := SYSDATE;
    vb_oferta   := true;

    DBMS_OUTPUT.PUT_LINE('El producto es : ' || vv_producto);
    DBMS_OUTPUT.PUT_LINE('El número de unidades recibidas es : ' || vn_unidades);
    DBMS_OUTPUT.PUT_LINE('El precio unitario es :' || vn_precio);
    DBMS_OUTPUT.PUT_LINE('La fecha de entrega es : ' || TO_CHAR(vd_fecha_entrega,'DD/MM/YYYY'));
    DBMS_OUTPUT.PUT_LINE('El precio unitario es: ' || CASE WHEN vb_oferta then 'Con oferta.' ELSE 'Sin oferta' END);
end pr_tienda_procedure;

--Para ver 
exec nombredelprocedimiento



----------------------------------------------------------------------------------------


declare 
    vv_aplicacion VARCHAR2(10 CHAR) := 'Mi app';
begin
    DBMS_OUTPUT.PUT_LINE('La variable vv_aplicacion contiene el valor ' || vv_aplicacion);

end;
/


declare 
    vv_aplicacion VARCHAR2(10 CHAR) := 'Mi app';
begin
  

    DBMS_OUTPUT.PUT_LINE('La variable vv_aplicacion contiene el valor ' || vv_aplicacion);

end;
/


----------------------------------------------------------------------------------------


CREATE table ybProductos (nIDProducto NUMBER(3) primary key,
                            vDesProducto VARCHAR2(50 CHAR),
                            nUnudades NUMBER(4),
                            nPreciounitario NUMBER(6,2),
                            dFechaAlta DATE
                            );


--Insertar datos

begin

    insert into ybProductos (nIDProducto,
                            vDesProducto,
                            nUnudades,
                            nPreciounitario,
                            dFechaAlta)
                        Values (1,
                                'Destornillador',
                                50,
                                3.25,
                                TO_DATE('05/05/2021','DD/MM/YYYY'));
END;
/

NIDPRODUCTO VDESPRODUCTO                                        NUNUDADES
----------- -------------------------------------------------- ----------
NPRECIOUNITARIO DFECHAAL
--------------- --------
          1 Destornillador                                             50
           3,25 05/05/21

--Actualizar datos

begin

    update ybProductos
        SET nPreciounitario = 3.5
    WHEre nIDProducto = 1;

end;
/

NIDPRODUCTO VDESPRODUCTO                                        NUNUDADES
----------- -------------------------------------------------- ----------
NPRECIOUNITARIO DFECHAAL
--------------- --------
          1 Destornillador                                             50
            3,5 05/05/21

--Eliminar

begin

    Delete from ybProductos
    WHEre nIDProducto = 1;

end;
/

ninguna fila seleccionada

---if

declare
    vn_numero NUMBER(1) := 0;

begin
    if vn_numero = 1 then
        DBMS_OUTPUT.PUT_LINE('Se cumple la condición');
    elsif vn_numero = 0 then
        DBMS_OUTPUT.PUT_LINE('valor 0.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No se cumple.');
    END if;
end;
/


---CASE

declare
    vn_numero NUMBER(1) := 0;
    vn_numero2 NUMBER(1) :=1;

begin
    CASE 
        WHEN vn_numero = 1 then DBMS_OUTPUT.PUT_LINE('Valor 1.');
        WHEN vn_numero = 0 and vn_numero2 = 1 then DBMS_OUTPUT.PUT_LINE('Valor 1  = 0 y valor 2 = 1.');
        ELSE DBMS_OUTPUT.PUT_LINE('No se cumple.');
    end CASE;
end;
/

--Mostar los 10 primeros pares --- WHILE

declare 
    contador binary_integer := 1;

begin 

    while contador <= 10 loop
        DBMS_OUTPUT.PUT_LINE(contador*2);
        contador := contador + 1;
    END loop;
END;
/

-------------LOOP

declare
    i BINARY_INTEGER := 1;
begin
    LOOP
        DBMS_OUTPUT.PUT_LINE(i*2);
        i := i + 1;
        exict LOOP;
    END LOOP;
END;
/ 

---------FOR

begin
    FOR i in 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i*2);
    end LOOP;
END;
/