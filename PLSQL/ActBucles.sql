--Francisco josé batista de los santos
--Mostar los 10 primeros pares --- WHILE

declare 
    contador binary_integer := 1;

begin 

    while contador <= 20 loop
        DBMS_OUTPUT.PUT_LINE((contador*2)-1);
        contador := contador + 1;
    END loop;
END;
/

-------------LOOP

declare
    i BINARY_INTEGER := 1;
begin
    LOOP
        DBMS_OUTPUT.PUT_LINE((i*2)-1);
        i := i + 1;
        EXIT WHEN(i=21);
    END LOOP;
END;
/ 

---------FOR

begin
    FOR i in 1..20 LOOP
        DBMS_OUTPUT.PUT_LINE((i*2)-1);
    end LOOP;
END;
/