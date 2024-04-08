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