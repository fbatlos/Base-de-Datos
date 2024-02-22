
Nombre: <Pon aquí tu nombre>

/************************************************************************/
	INSTRUCCIONES:
	==============
-Salva este fichero con las iniciales de tu nombre y apellidos,
 en el directorio "C:\TAREA_ENTREGABLE\ ":
	Ejemplo:	Si tu nombre es             Tomas Coronado Garcia
			    el fichero debe llamarse:   00TCG_TE.sql
El numero que pones delante de tus iniciales debe ser el que aparece a continuación:

01	Aranda Cano, Alberto
02	Arroyo Cano, Adrián
03	Batista de los Santos, Fco José	
04	De Gomar Almellones, Nicolás	
05	De Olma Peralta, Emmanuel	
06	Fernandez Trigo, Julio
07	López Jiménez, Iván
08	Mahindo Canalo, Andrés
09	Morales Coronil, Sergio 
10	Muñoz García, Raúl
11	Narvaez Otero, Lara
12  Roldán Ramos, Iván
13  Tamayo Rodriguez, Mario
14  Muñoz Vias, Jaime 
15  Delgado Alvarez, Sebastian.
16  Trujillo Gonzalez, Fco José


-En este archivo pon tu nombre completo, arriba, 
- y lee atentamente todas los enunciados para realizar las consultas.

-Entra en el Notepadplus y en la consola de "SQL Plus" con cualquier usuario. 

-Carga el script para el examen desde el fichero "Empresa_Datos_Tarea_Entregable_Ex16.sql".

-Donde ponga "SQL>", copiarás las sentencias SQL que has utilizado.

-Donde ponga "Resultado:" copiarás el resultado que la consola SQL*Plus te devuelve.

-RECUERDA: guardar, cada cierto tiempo, el contenido de este fichero. Es lo que voy a evaluar, si lo pierdes, es tu responsabilidad.
-PUNTUACIÓN:  	Cada pregunta se evaluará de 0 a 10 puntos, sumando el resultado final y dividiendo entre el numero de preguntas para obtener el resultado final.


-ENTREGA: Cuando finalices entrega antes de la hora limite de entrega, 
- subiendo a este fichero SQL a Moodle.


/************************************************************************/
	Descripción de las tablas:
	==========================

CENTROS
-------
# Cod_ce	NUMBER(2)			Número identificativo del centro
  Nombre_ce	VARCHAR2(30)		Nombre del centro
  Dir_ce	VARCHAR2(35)		Dirección del centro

DEPARTAMENTOS
-------------
# Cod_de		NUMBER(3)		Número identificativo del departamento
* Centro_de		NUMBER(2)		Número del centro de trabajo donde está el departamento
* Director_de	NUMBER(4)		Número del empleado que es director del departamento
  TipoDir_de	CHAR(1)			Tipo de director: 'P', en propiedad y 'F', en funciones
  Presuesto_de	NUMBER(6)		Presupuesto anual del departamento
* Dptojefe_de	NUMBER(3)		Número del departamento del que depende
  Nombre_de		VARCHAR2(30)	Nombre del departamento

EMPLEADOS
---------
# Cod_em		NUMBER(4)		Número identificativo del empleado
* Dpto_em		NUMBER(3)		Número del departamento al que está asignado el empleado
  ExtTel_em		NUMBER(3)		Extensión telefónica del empleado
  FechaNac_em	DATE			Fecha de nacimiento
  FechaIng_em	DATE			Fecha de ingreso en la empresa
  Salario_em	NUMBER(5)		Salario mensual en euros
  Comision_em	NUMBER(5)		Comisión mensual en euros
  Numhijos_em	NUMBER(2)		Número de hijos
  Apellidos_em	VARCHAR2(30)	Apellidos del empleado
  Nombre_em		VARCHAR2(15)	Nombre del empleado

Nota: 
	# PRIMARY KEY
	* FOREIGN KEY

/************************************************************************/
/** ENUNCIADOS PARA REALIZAR LAS CONSULTAS **/	
/************************************************************************/
1.- Hallar el número de empleados de toda la empresa.

SQL>

RESULTADO:

/************************************************************************/
2.- Hallar la masa salarial (salarios+comisiones) de la empresa.

SQL>

RESULTADO:

/************************************************************************/
3.- Obtener un listado que incluya el nombre de cada uno de los departamentos 
junto al nombre y apellidos de su director.

SQL>

RESULTADO:

/************************************************************************/
4.- Obtener, por orden alfabético, los nombres y apellidos 
de los empleados cuyo salario es igual o superior 
al mayor de los salarios de los empleados del departamento 122.

SQL>

RESULTADO:

/************************************************************************/
5.- Obtener, por orden alfabético, los nombres, apellidos y las comisiones 
de los empleados del departamento 110.

SQL>

RESULTADO:

/************************************************************************/
6.- Datos de los empleados que cobran el salario máximo de su departamento.	

SQL>

RESULTADO:

/************************************************************************/
7.- Calcular aquellos empleados que llevan más de 35 años en la empresa. 
Muestre todos los datos de cada uno de ellos.

SQL>

RESULTADO:

/************************************************************************/
8.- Hallar, por orden de número de empleado, el nombre, 
apellidos y el salario total (salario más comisión) 
de los empleados cuyo salario total supera los 1300 euros mensuales.

SQL>

RESULTADO:

/************************************************************************/
9.- Mostrar para cada empleado el número de meses que lleva 
el empleado en la empresa junto con su nombre.

SQL>

RESULTADO:

/************************************************************************/
10.- Mostrar un listado donde aparezca el código de los departamentos 
y su nombre conjuntamente con el código de los centros en donde están situados 
y el nombre de estos centros.

SQL>

RESULTADO:



11.- Hallar, en una consulta, los siguientes datos para cada departamento junto con su código:
	a) Número de empleados.
	b) Salario medio, máximo y mínimo
	c) Media de las comisiones.

Poner un alias a las columnas que usen funciones de grupo o agregación.

SQL>

RESULTADO:

/************************************************************************/
12.-  Calcular cuantos números de teléfono distintos usa cada departamento, 
mostrando el código y el nombre de cada departamento.

SQL>

RESULTADO:

/************************************************************************/
13.- Mostrar los departamentos (número y nombre) 
con sus centros (número y nombre) y la edad media de sus empleados 
de aquellos departamentos que tienen una edad media en sus empleados mayor a 35 años.

SQL>

RESULTADO:

/************************************************************************/
14.- Para cada grupo de empleados que cobran el mismo salario 
y tienen el mismo número de hijos, diga cuantos empleados forman el grupo 
y en cuantos departamentos están trabajando.

SQL>

RESULTADO:

/************************************************************************/
15.- Para cada extensión telefónica, hallar cuántos empleados la usan 
y el salario medio de éstos.

SQL>

RESULTADO:

/************************************************************************/
16.- Hallar el salario medio por departamento para aquellos 
departamentos cuyo salario máximo es inferior al salario medio de todos los empleados.

SQL>

RESULTADO:

