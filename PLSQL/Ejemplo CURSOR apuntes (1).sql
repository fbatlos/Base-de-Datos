DROP TABLE HOTEL CASCADE CONSTRAINT;

CREATE TABLE HOTEL (
HotelID NUMBER(4) PRIMARY KEY,
NHABS NUMBER(4),
PRECIOHAB NUMBER(4),
TIENEPISCINA VARCHAR2(1));

INSERT INTO HOTEL VALUES (1,23,60,'S');
INSERT INTO HOTEL VALUES (2,95,40,'N');
INSERT INTO HOTEL VALUES (3,55,70,'S');
INSERT INTO HOTEL VALUES (4,12,65,'S');

--CURSOR IMPLICITO

DECLARE
vn_Media NUMBER;
vr_Hotel1 Hotel%ROWTYPE;

BEGIN
-- Media de habitaciones de todos los hoteles:
	 SELECT AVG(Nhabs) 
	 INTO vn_Media 
	 FROM Hotel;
	 DBMS_OUTPUT.PUT_LINE('Media del numero de habitaciones: ' || vn_Media);
-- Todos los datos del Hotel 1:
	 SELECT * 
	 INTO vr_Hotel1
	 FROM Hotel 
	 WHERE HotelID = 1;
-- Comparar con la Media y actualizar:
	 IF vn_Media > vr_Hotel1.Nhabs THEN
		UPDATE Hotel 
		SET Nhabs=Nhabs+1 
		WHERE HotelID=1;
	 END IF;
END;


--CONTROLANDO ERROR
DECLARE
vn_Media NUMBER;
vr_Hotel99 Hotel%ROWTYPE;

BEGIN
-- Media de habitaciones de todos los hoteles:
	 SELECT AVG(Nhabs) 
	 INTO vn_Media 
	 FROM Hotel;
-- Todos los datos del Hotel 99:
	 SELECT * 
	 INTO vr_Hotel99
	 FROM Hotel 
	 WHERE HotelID = 99;
-- Comparar con la Media y actualizar:
	 IF vn_Media > vr_Hotel99.Nhabs THEN
		UPDATE Hotel 
		SET Nhabs=Nhabs+1 
		WHERE HotelID=99;
	 END IF;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE(SQLCODE);
DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;


-- CURSOR EXPLICITO: 
-----------------------------------
-- Con bucle LOOP y EXIT
-----------------------------------
DECLARE
	NumHabitaciones Hotel.Nhabs%TYPE;
	UnHotel 		Hotel%ROWTYPE;
	
	CURSOR HotelesGrandes IS 
							SELECT * FROM Hotel
							WHERE Nhabs>NumHabitaciones;
BEGIN
	NumHabitaciones:=50;
	OPEN HotelesGrandes;
	-- Bucle para procesar todos los Hoteles Grandes:
	LOOP
		FETCH HotelesGrandes INTO UnHotel;
		EXIT WHEN HotelesGrandes%NOTFOUND;
		-- Procesamiento del hotel almacenado en UnHotel:
		IF UnHotel.TienePiscina = 'S' THEN
			UPDATE Hotel SET PrecioHab=PrecioHab + 10
			WHERE HotelID=UnHotel.HotelID;
		ELSE
			UPDATE Hotel SET PrecioHab=PrecioHab + 5
			WHERE HotelID=UnHotel.HotelID;
		END IF;
	END LOOP;
	DBMS_OUTPUT.PUT_LINE('Hoteles Procesados: '
	|| HotelesGrandes%ROWCOUNT);
	CLOSE HotelesGrandes;
	COMMIT;
END;
/

-----------------------------------
-- Con bucle LOOP Y WHILE
-----------------------------------
DECLARE
	NumHabitaciones Hotel.Nhabs%TYPE;
	UnHotel 		Hotel%ROWTYPE;
	CURSOR HotelesGrandes IS SELECT * FROM Hotel
					WHERE Nhabs>NumHabitaciones;
BEGIN
	NumHabitaciones:=50;
	OPEN HotelesGrandes;
	-- Bucle para procesar todos los Hoteles Grandes:
	FETCH HotelesGrandes INTO UnHotel;
	WHILE HotelesGrandes%FOUND LOOP
		-- Procesamiento del hotel almacenado en UnHotel:
		IF UnHotel.TienePiscina = 'S' THEN
			UPDATE Hotel SET PrecioHab=PrecioHab + 10
			WHERE HotelID=UnHotel.HotelID;
		ELSE
			UPDATE Hotel SET PrecioHab=PrecioHab + 5
			WHERE HotelID=UnHotel.HotelID;
		END IF;
		FETCH HotelesGrandes INTO UnHotel;
	END LOOP;
	DBMS_OUTPUT.PUT_LINE('Hoteles Procesados: '
	|| HotelesGrandes%ROWCOUNT);
	CLOSE HotelesGrandes;
	COMMIT;
END;
/

-----------------------------------
-- Con bucle FOR de cursor
-----------------------------------
-- En este caso la variable registro (UnHotel)
-- se declara implícitamente
-----------------------------------
-- De igual manera, la apertura (OPEN), lectura de datos (FETCH)
-- y cierre (CLOSE) del cursor se hacen implícitamente
-----------------------------------
DECLARE
	NumHabitaciones Hotel.Nhabs%TYPE;
	CURSOR HotelesGrandes IS SELECT * FROM Hotel
					WHERE Nhabs>NumHabitaciones;
	Cont 	number := 0;
BEGIN
	NumHabitaciones:=50;
	FOR UnHotel IN HotelesGrandes LOOP
		IF UnHotel.TienePiscina = 'S' THEN
			UPDATE Hotel SET PrecioHab=PrecioHab + 10
			WHERE HotelID=UnHotel.HotelID;
		ELSE
			UPDATE Hotel SET PrecioHab=PrecioHab + 5
			WHERE HotelID=UnHotel.HotelID;
		END IF;
		Cont := Cont + 1;
	END LOOP;
	DBMS_OUTPUT.PUT_LINE('Hoteles Procesados: '	|| Cont);
	COMMIT;
END;
/


-- EJERCICIO. CONVERTIR ESTOS BLOQUES ANONIMOS EN UN PROCEDIMIENTO
-- EN EL QUE SE LE PASE POR PARAMETRO EL NUMERO DE HABITACIONES
-- PARA CONSIDERAR UN HOTEL GRANDE.
















CREATE OR REPLACE PROCEDURE PR_HOTELES_GRANDES 
(PI_NumHabitaciones IN NUMBER)
IS
--	NumHabitaciones Hotel.Nhabs%TYPE;
	CURSOR HotelesGrandes IS SELECT * FROM Hotel
					         WHERE Nhabs>PI_NumHabitaciones;
	Cont 	number := 0;
BEGIN
--	NumHabitaciones:=50;
	FOR UnHotel IN HotelesGrandes LOOP
		IF UnHotel.TienePiscina = 'S' THEN
			UPDATE Hotel SET PrecioHab=PrecioHab + 10
			WHERE HotelID=UnHotel.HotelID;
		ELSE
			UPDATE Hotel SET PrecioHab=PrecioHab + 5
			WHERE HotelID=UnHotel.HotelID;
		END IF;
		Cont := Cont + 1;
	END LOOP;
	DBMS_OUTPUT.PUT_LINE('Hoteles Procesados: '	|| Cont);
	COMMIT;
END PR_HOTELES_GRANDES;
/

EXEC PR_HOTELES_GRANDES(125);

SELECT * FROM Hotel;

EXEC PR_HOTELES_GRANDES(90);