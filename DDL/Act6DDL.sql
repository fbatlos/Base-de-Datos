--Francisco José Batista de los Santos.
--1--Dar de alta un nuevo artículo de 'Primera' categoría para los fabricantes de 'FRANCIA' y abastecer con cinco unidades de ese artículo a todas las tiendas y en la fecha de hoy.

SELECT * FROM ARTICULOS;
SELECT * FROM FABRICANTES;
SELECT * FROM TIENDAS;
SELECT * FROM PEDIDOS;


INSERT INTO ARTICULOS  
SELECT 'Pañales' ,
 COD_FABRICANTE , 
 4 , 
 'Primera' ,
  1000 , 
  2 , 
  20
FROM ARTICULOS
WHERE COD_FABRICANTE = ( SELECT COD_FABRICANTE
                        FROM FABRICANTES
                        WHERE PAIS = 'FRANCIA')
GROUP BY COD_FABRICANTE;


SELECT COD_FABRICANTE
FROM ARTICULOS
WHERE COD_FABRICANTE = ( SELECT COD_FABRICANTE
                        FROM FABRICANTES
                        WHERE PAIS = 'FRANCIA')
GROUP BY COD_FABRICANTE;


INSERT INTO PEDIDOS
SELECT NIF,ARTICULO,COD_FABRICANTE,PESO,CATEGORIA,SYSDATE,5
FROM ARTICULOS A , TIENDAS T
WHERE (ARTICULO) = 'Pañales';


SELECT NIF,ARTICULO,COD_FABRICANTE,PESO,CATEGORIA,SYSDATE,5
FROM ARTICULOS A , TIENDAS T
WHERE (ARTICULO) = 'Pañales';

--Resultado
1111-A     Pañales                          30          4 Primera    05/03/2024                5
5555-B     Pañales                          30          4 Primera    05/03/2024                5
2222-A     Pañales                          30          4 Primera    05/03/2024                5
4444-A     Pañales                          30          4 Primera    05/03/2024                5
3333-N     Pañales                          30          4 Primera    05/03/2024                5
4141-B     Pañales                          30          4 Primera    05/03/2024                5

--2--Insertar un pedido de 20 unidades en la tienda '1111-A' con el artículo que mayor número de ventas haya realizado.

SELECT * from VENTAS;

INSERT INTO PEDIDOS
SELECT '1111-A',ARTICULO,COD_FABRICANTE,PESO,CATEGORIA,SYSDATE,20
FROM VENTAS
GROUP BY ARTICULO,COD_FABRICANTE,PESO,CATEGORIA
HAVING SUM(UNIDADES_VENDIDAS) = (SELECT MAX(SUM(UNIDADES_VENDIDAS))
                                FROM VENTAS
                                GROUP BY ARTICULO,COD_FABRICANTE,PESO,CATEGORIA);



SELECT MAX(SUM(UNIDADES_VENDIDAS))
                                FROM VENTAS
                                GROUP BY ARTICULO,COD_FABRICANTE,PESO,CATEGORIA;

--Resultado
1111-A     Macarrones                       20          1 Primera    05/03/2024               20

--3--Dar de alta una tienda en la provincia de 'MADRID' y abastecerla con 20 unidades de cada uno de los artículos existentes.


INSERT INTO TIENDAS
VALUES('9999-Z' , 'Pollos Hermanos' , 'C/Colderon' , 'Betica' , 'MADRID' , 99999);

INSERT INTO PEDIDOS
SELECT '9999-Z',ARTICULO,COD_FABRICANTE,PESO,CATEGORIA,SYSDATE,20
FROM ARTICULOS ;


9999-Z     Macarrones                       20          1 Primera    05/03/2024               20
9999-Z     Tallarines                       20          2 Primera    05/03/2024               20
9999-Z     Tallarines                       20          1 Segunda    05/03/2024               20
9999-Z     Macarrones                       20          1 Tercera    05/03/2024               20
9999-Z     Atun                             10          3 Primera    05/03/2024               20
9999-Z     Atun                             10          3 Segunda    05/03/2024               20
9999-Z     Atun                             10          3 Tercera    05/03/2024               20
9999-Z     Sardinillas                      10          1 Primera    05/03/2024               20
9999-Z     Sardinillas                      10          1 Segunda    05/03/2024               20
9999-Z     Sardinillas                      10          1 Tercera    05/03/2024               20
9999-Z     Mejillones                       10          1 Tercera    05/03/2024               20
9999-Z     Mejillones                       10          1 Primera    05/03/2024               20
9999-Z     Macarrones                       25          1 Primera    05/03/2024               20
9999-Z     Tallarines                       25          1 Primera    05/03/2024               20
9999-Z     Fideos                           25          1 Segunda    05/03/2024               20
9999-Z     Fideos                           25          1 Primera    05/03/2024               20
9999-Z     Galletas Cuadradas               15          1 Primera    05/03/2024               20
9999-Z     Galletas Cuadradas               15          1 Segunda    05/03/2024               20
9999-Z     Galletas Cuadradas               15          1 Tercera    05/03/2024               20
9999-Z     Barquillos                       15          1 Primera    05/03/2024               20
9999-Z     Barquillos                       15          1 Segunda    05/03/2024               20
9999-Z     Canutillos                       15          2 Primera    05/03/2024               20
9999-Z     Canutillos                       15          2 Segunda    05/03/2024               20
9999-Z     Leche entera                     30          1 Primera    05/03/2024               20
9999-Z     Leche desnat.                    30          1 Primera    05/03/2024               20
9999-Z     Leche semi.                      30          1 Primera    05/03/2024               20
9999-Z     Leche entera                     30          2 Primera    05/03/2024               20
9999-Z     Leche desnat.                    30          2 Primera    05/03/2024               20
9999-Z     Leche semi.                      30          2 Primera    05/03/2024               20
9999-Z     Mantequilla                      30          1 Primera    05/03/2024               20
9999-Z     Mantequilla                      30          1 Segunda    05/03/2024               20
9999-Z     Pañales                          30          4 Primera    05/03/2024               20

--4--Dar de alta dos tiendas en la provincia de 'SEVILLA' y abastecerlas con 30 unidades de artículos del fabricante 'GALLO'.


INSERT INTO TIENDAS
VALUES ('1234-W','Goku','C/Messi','Sevillanos','SEVILLA',12345);


INSERT INTO TIENDAS
VALUES ('7777-P','Joaquin','C/GolDelBetis','Calvenses','SEVILLA',54321);

INSERT INTO PEDIDOS
SELECT T.NIF , A.ARTICULO , A.COD_FABRICANTE , A.PESO ,A.CATEGORIA, SYSDATE , 30
FROM ARTICULOS A, TIENDAS T
WHERE A.COD_FABRICANTE = (SELECT COD_FABRICANTE
                        FROM FABRICANTES
                        WHERE NOMBRE = 'GALLO')
AND T.PROVINCIA = 'SEVILLA';


--Saca los 8 pedidso
SELECT T.NIF , A.ARTICULO , A.COD_FABRICANTE
FROM ARTICULOS A, TIENDAS T
WHERE A.COD_FABRICANTE = (SELECT COD_FABRICANTE
                        FROM FABRICANTES
                        WHERE NOMBRE = 'GALLO')
AND T.PROVINCIA = 'SEVILLA';

--Resultado
1234-W     Macarrones                       25          1 Primera    05/03/2024               30
7777-P     Macarrones                       25          1 Primera    05/03/2024               30
1234-W     Tallarines                       25          1 Primera    05/03/2024               30
7777-P     Tallarines                       25          1 Primera    05/03/2024               30
1234-W     Fideos                           25          1 Segunda    05/03/2024               30
7777-P     Fideos                           25          1 Segunda    05/03/2024               30
1234-W     Fideos                           25          1 Primera    05/03/2024               30
7777-P     Fideos                           25          1 Primera    05/03/2024               30



--5--Realizar una venta para todas las tiendas de 'TOLEDO' de 10 unidades de los artículos de 'Primera' categoría.

INSERT INTO VENTAS
SELECT T.NIF , A.ARTICULO , A.COD_FABRICANTE,A.PESO , A.CATEGORIA,SYSDATE,10
FROM ARTICULOS A, TIENDAS T
WHERE UPPER(A.CATEGORIA) = 'PRIMERA'
AND T.PROVINCIA = 'TOLEDO';

--Miro todo los necesario de los articulos de toledo y que su categoria sea Primera

SELECT T.NIF , A.ARTICULO , A.COD_FABRICANTE , A.CATEGORIA
FROM ARTICULOS A, TIENDAS T
WHERE UPPER(A.CATEGORIA) = 'PRIMERA'
AND T.PROVINCIA = 'TOLEDO';

--Resultado
3333-N     Macarrones                       20          1 Primera    05/03/2024                10
3333-N     Tallarines                       20          2 Primera    05/03/2024                10
3333-N     Atun                             10          3 Primera    05/03/2024                10
3333-N     Sardinillas                      10          1 Primera    05/03/2024                10
3333-N     Mejillones                       10          1 Primera    05/03/2024                10
3333-N     Macarrones                       25          1 Primera    05/03/2024                10
3333-N     Tallarines                       25          1 Primera    05/03/2024                10
3333-N     Fideos                           25          1 Primera    05/03/2024                10
3333-N     Galletas Cuadradas               15          1 Primera    05/03/2024                10
3333-N     Barquillos                       15          1 Primera    05/03/2024                10
3333-N     Canutillos                       15          2 Primera    05/03/2024                10
3333-N     Leche entera                     30          1 Primera    05/03/2024                10
3333-N     Leche desnat.                    30          1 Primera    05/03/2024                10
3333-N     Leche semi.                      30          1 Primera    05/03/2024                10
3333-N     Leche entera                     30          2 Primera    05/03/2024                10
3333-N     Leche desnat.                    30          2 Primera    05/03/2024                10
3333-N     Leche semi.                      30          2 Primera    05/03/2024                10
3333-N     Mantequilla                      30          1 Primera    05/03/2024                10
3333-N     Pañales                          30          4 Primera    05/03/2024                10
4141-B     Macarrones                       20          1 Primera    05/03/2024                10
4141-B     Tallarines                       20          2 Primera    05/03/2024                10
4141-B     Atun                             10          3 Primera    05/03/2024                10
4141-B     Sardinillas                      10          1 Primera    05/03/2024                10
4141-B     Mejillones                       10          1 Primera    05/03/2024                10
4141-B     Macarrones                       25          1 Primera    05/03/2024                10
4141-B     Tallarines                       25          1 Primera    05/03/2024                10
4141-B     Fideos                           25          1 Primera    05/03/2024                10
4141-B     Galletas Cuadradas               15          1 Primera    05/03/2024                10
4141-B     Barquillos                       15          1 Primera    05/03/2024                10
4141-B     Canutillos                       15          2 Primera    05/03/2024                10
4141-B     Leche entera                     30          1 Primera    05/03/2024                10
4141-B     Leche desnat.                    30          1 Primera    05/03/2024                10
4141-B     Leche semi.                      30          1 Primera    05/03/2024                10
4141-B     Leche entera                     30          2 Primera    05/03/2024                10
4141-B     Leche desnat.                    30          2 Primera    05/03/2024                10
4141-B     Leche semi.                      30          2 Primera    05/03/2024                10
4141-B     Mantequilla                      30          1 Primera    05/03/2024                10
4141-B     Pañales                          30          4 Primera    05/03/2024                10


--6--Para aquellos artículos de los que se hayan vendido más de 30 unidades, realizar un pedido de 10 unidades para la tienda con NIF '5555-B' con la fecha actual.

INSERT INTO PEDIDOS
SELECT '5555-B',ARTICULO , COD_FABRICANTE,PESO,CATEGORIA,SYSDATE,10
FROM VENTAS
GROUP BY ARTICULO,COD_FABRICANTE,PESO ,CATEGORIA
HAVING SUM(UNIDADES_VENDIDAS) > 30;


SELECT ARTICULO , COD_FABRICANTE,SUM(UNIDADES_VENDIDAS)
FROM VENTAS
GROUP BY ARTICULO,COD_FABRICANTE,PESO ,CATEGORIA
HAVING SUM(UNIDADES_VENDIDAS) > 30;


5555-B     Macarrones                       20          1 Primera    05/03/2024               10
5555-B     Leche semi.                      30          2 Primera    05/03/2024               10
5555-B     Atun                             10          3 Primera    05/03/2024               10

--7--Cambiar los datos de la tienda con NIF '1111-A' igualándolos a los de la tienda con NIF '2222-A'.

UPDATE TIENDAS
SET (NOMBRE , DIRECCION ,POBLACION , PROVINCIA,CODPOSTAL) = (SELECT NOMBRE , DIRECCION ,POBLACION , PROVINCIA,CODPOSTAL
                                                            FROM TIENDAS
                                                            WHERE NIF = '2222-A')
WHERE NIF = '1111-A';



SELECT NOMBRE , DIRECCION ,POBLACION , PROVINCIA,CODPOSTAL
FROM TIENDAS
WHERE NIF = '2222-A';

1111-A	Comestibles Rodolfo	C/ del Val s/n	Alcala de Henares	MADRID	28804
2222-A	Comestibles Rodolfo	C/ del Val s/n	Alcala de Henares	MADRID	28804

--8--Cambiar todos los artículos de 'Primera' categoría a 'Segunda' categoría del país 'ITALIA'.

SELECT * from fabricantes;
SELECT * FROM ARTICULOS;


UPDATE ARTICULOS
SET CATEGORIA = 'Segunda'
WHERE COD_FABRICANTE IN (SELECT COD_FABRICANTE FROM FABRICANTES WHERE PAIS = 'ITALIA')
  AND CATEGORIA = 'Primera';

--Da 20
SELECT COD_FABRICANTE 
FROM FABRICANTES 
WHERE PAIS = 'ITALIA';

--9--Modificar aquellos pedidos en los que la cantidad pedida sea superior a las existencias del artículo, asignando el 20% de las existencias a la cantidad que se ha pedido.

UPDATE PEDIDOS
SET UNIDADES_PEDIDAS = (SELECT A.existencias*0.2
                          FROM ARTICULOS A, PEDIDOS P  
                          WHERE A.COD_FABRICANTE = P.COD_FABRICANTE
                          AND A.ARTICULO = P.ARTICULO
                          AND A.PESO = P.PESO
                          AND A.CATEGORIA = P.CATEGORIA
                          AND A.existencias < P.UNIDADES_PEDIDAS
                          GROUP BY A.existencias)
WHERE UNIDADES_PEDIDAS > (SELECT A.existencias
                          FROM ARTICULOS A, PEDIDOS P  
                          WHERE A.COD_FABRICANTE = P.COD_FABRICANTE
                          AND A.ARTICULO = P.ARTICULO
                          AND A.PESO = P.PESO
                          AND A.CATEGORIA = P.CATEGORIA
                          AND A.existencias < P.UNIDADES_PEDIDAS
                          GROUP BY A.existencias 
                          );

--ANtes
2222-A     Mejillones                       10          1 Primera    05/03/24               1000

--Resulltado:
2222-A     Mejillones                       10          1 Primera    05/03/24               60

--10--Eliminar aquellas tiendas que no han realizado ventas.

DELETE FROM TIENDAS
WHERE NIF NOT IN (SELECT NIF
                  FROM VENTAS);

--ANTES
NIF	NOMBRE	DIRECCION	POBLACION	PROVINCIA	CODPOSTAL
9999-Z	Pollos Hermanos	C/Colderon	Betica	MADRID	99999
1111-A	Comestibles Rodolfo	C/ del Val s/n	Alcala de Henares	MADRID	28804
5555-B	La gacela	C/Santander Rios, 45	Azuqueca	GUADALAJARA	19209
2222-A	Comestibles Rodolfo	C/ del Val s/n	Alcala de Henares	MADRID	28804
4444-A	La Pasta Gansa	C/Alcala, 2	Ajalvir	MADRID	28765
3333-N	Ultramarinos Montse	Avda. Pio 10	Toledo	TOLEDO	45100
4141-B	Todo Toledo	C/Avila 24	Talavera	TOLEDO	45199
1234-W	Goku	C/Messi	Sevillanos	SEVILLA	12345
7777-P	Joaquin	C/GolDelBetis	Calvenses	SEVILLA	54321

--en ventas
NIF
2222-A
3333-N
5555-B
4141-B
3333-A--No EXISTE EN TIENDAS


--Resultado
5555-B	La gacela	C/Santander Rios, 45	Azuqueca	GUADALAJARA	19209
2222-A	Comestibles Rodolfo	C/ del Val s/n	Alcala de Henares	MADRID	28804
3333-N	Ultramarinos Montse	Avda. Pio 10	Toledo	TOLEDO	45100
4141-B	Todo Toledo	C/Avila 24	Talavera	TOLEDO	45199


--11--Eliminar los artículos que no hayan tenido ni compras ni ventas.

DELETE FROM ARTICULOS
WHERE (ARTICULO, COD_FABRICANTE, PESO, CATEGORIA) NOT IN (SELECT DISTINCT ARTICULO, COD_FABRICANTE, PESO, CATEGORIA FROM PEDIDOS)
   or (ARTICULO, COD_FABRICANTE, PESO, CATEGORIA) NOT IN (SELECT DISTINCT ARTICULO, COD_FABRICANTE, PESO, CATEGORIA FROM VENTAS);


--Borra 2


--12--Borrar los pedidos de 'Primera' categoría cuyo país de procedencia sea 'BELGICA'.

DELETE FROM PEDIDOS
WHERE COD_FABRICANTE = (SELECT COD_FABRICANTE
                        FROM FABRICANTES
                        WHERE PAIS = 'BELGICA')
AND CATEGORIA = 'Primera';

--RESULTADO
5 row(s) deleted.


NIF	ARTICULO	COD_FABRICANTE	PESO	CATEGORIA	FECHA_PEDIDO	UNIDADES_PEDIDAS
9999-Z	Galletas Cuadradas	15	1	Segunda	06/03/2024	20
9999-Z	Galletas Cuadradas	15	1	Tercera	06/03/2024	20
9999-Z	Barquillos	15	1	Segunda	06/03/2024	20
9999-Z	Canutillos	15	2	Segunda	06/03/2024	20
5555-B	Galletas Cuadradas	15	1	Segunda	20/06/2016	15
1111-A	Canutillos	15	2	Segunda	10/04/2016	12
3333-A	Barquillos	15	1	Segunda	20/11/2016	40
3333-A	Canutillos	15	2	Segunda	20/11/2016	10

--13--Borrar los pedidos que no tengan tienda.

SELECT * FROM PEDIDOS;
SELECT * FROM TIENDAS;

DELETE FROM PEDIDOS
WHERE NIF NOT IN (SELECT NIF
                  FROM TIENDAS);

SELECT NIF
FROM TIENDAS;


12 filas suprimidas.
--RESULTADO
NIF        ARTICULO             COD_FABRICANTE       PESO CATEGORIA  FECHA_PE UNIDADES_PEDIDAS
---------- -------------------- -------------- ---------- ---------- -------- ----------------
5555-B     Macarrones                       20          1 Primera    18/02/16               30
5555-B     Atun                             10          3 Primera    21/02/16               10
5555-B     Atun                             10          3 Segunda    11/03/16                4
5555-B     Sardinillas                      10          1 Segunda    11/03/16               10
5555-B     Macarrones                       25          1 Primera    14/04/16               12
5555-B     Fideos                           25          1 Segunda    18/05/16               24
5555-B     Fideos                           25          1 Segunda    19/05/16               20
5555-B     Galletas Cuadradas               15          1 Segunda    20/06/16               15
4141-B     Macarrones                       20          1 Primera    16/04/16               30
4141-B     Atun                             10          3 Primera    21/06/16               10
4141-B     Atun                             10          3 Segunda    12/08/16                9
2222-A     Sardinillas                      10          1 Segunda    12/08/16               20
2222-A     Sardinillas                      10          1 Tercera    12/08/16               22
2222-A     Mejillones                       10          1 Primera    05/03/24             1000
5555-B     Pañales                          30          4 Primera    05/03/24                5
2222-A     Pañales                          30          4 Primera    05/03/24                5
4141-B     Pañales                          30          4 Primera    05/03/24                5

17 filas seleccionadas.


--14--Restar uno a las unidades de los últimos pedidos de la tienda con NIF '5555-B'.

UPDATE PEDIDOS
SET UNIDADES_PEDIDAS = UNIDADES_PEDIDAS-1
WHERE NIF = '5555-B';

--Antes
NIF        ARTICULO             COD_FABRICANTE       PESO CATEGORIA  FECHA_PE UNIDADES_PEDIDAS
---------- -------------------- -------------- ---------- ---------- -------- ----------------
5555-B     Macarrones                       20          1 Primera    18/02/16               30
5555-B     Atun                             10          3 Primera    21/02/16               10
5555-B     Atun                             10          3 Segunda    11/03/16                4
5555-B     Sardinillas                      10          1 Segunda    11/03/16               10
5555-B     Macarrones                       25          1 Primera    14/04/16               12
5555-B     Fideos                           25          1 Segunda    18/05/16               24
5555-B     Fideos                           25          1 Segunda    19/05/16               20
5555-B     Galletas Cuadradas               15          1 Segunda    20/06/16               15

--Ahora

NIF        ARTICULO             COD_FABRICANTE       PESO CATEGORIA  FECHA_PE UNIDADES_PEDIDAS
---------- -------------------- -------------- ---------- ---------- -------- ----------------
5555-B     Macarrones                       20          1 Primera    18/02/16               29
5555-B     Atun                             10          3 Primera    21/02/16                9
5555-B     Atun                             10          3 Segunda    11/03/16                3
5555-B     Sardinillas                      10          1 Segunda    11/03/16                9
5555-B     Macarrones                       25          1 Primera    14/04/16               11
5555-B     Fideos                           25          1 Segunda    18/05/16               23
5555-B     Fideos                           25          1 Segunda    19/05/16               19
5555-B     Galletas Cuadradas               15          1 Segunda    20/06/16               14