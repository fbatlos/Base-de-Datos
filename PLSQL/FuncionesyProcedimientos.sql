--1.Escribir un procedimiento que reciba dos números y visualice su suma
CREATE OR REPLACE PROCEDURE Suma_N
	(num IN NUMBER,
    num2 In NUMBER)

IS
BEGIN
        DBMS_OUTPUT.PUT_LINE('Resultado : ');
        DBMS_OUTPUT.PUT_LINE(num+num2);
END;
/

--2. Codificar un procedimiento que reciba una cadena y la visualice al revés.

CREATE OR REPLACE PROCEDURE Reverse_N
	(palabra IN VARCHAR2)
   
    str1 VARCHAR2(999);
    lent NUMBER(3);
IS
BEGIN
        lent := lenght(palabra);

        for i REVERSE 1..lent LOOP
            str1 := str1 || Substr(str, i, 1); 
        END LOOP;

        DBMS_OUTPUT.PUT_LINE(str1);
END;
/