--1--Cambiar la fecha de ingreso de Amador al día de hoy.

UPDATE ALUMNOS
SET FECINC_AL = SYSDATE
WHERE RTRIM(SUBSTR(NOMBRE_AL,INSTR (NOMBRE_AL, ',')+2)) = 'Amador'; --Se puede hacer con colum like %amador%

--2--Poner la fecha de ingreso y la ciudad de Carlos a los alumnos de Sevilla.

UPDATE ALUMNOS
SET(FECINC_AL , CIUDAD_AL ) = 
(SELECT FECINC_AL , CIUDAD_AL FROM ALUMNOS WHERE RTRIM(SUBSTR(NOMBRE_AL,INSTR (NOMBRE_AL, ',')+2)) = 'Carlos' )
WHERE CIUDAD_AL = 'Sevilla';

--3--Poner a Ismael: la fecha de ingreso de Javier y el delegado de Daniel.

UPDATE ALUMNOS
SET FECINC_AL = (SELECT FECINC_AL FROM ALUMNOS WHERE RTRIM(SUBSTR(NOMBRE_AL,INSTR (NOMBRE_AL, ',')+2)) = 'Javier'),
DELEGADO_AL = (SELECT DELEGADO_AL FROM ALUMNOS WHERE RTRIM(SUBSTR(NOMBRE_AL,INSTR (NOMBRE_AL, ',')+2)) = 'Daniel' )
WHERE RTRIM(SUBSTR(NOMBRE_AL,INSTR (NOMBRE_AL, ',')+2)) = 'Ismael';
