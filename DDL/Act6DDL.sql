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
