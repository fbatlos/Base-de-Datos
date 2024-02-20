REM ********** ENTORNO *************
ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY';
SET LINESIZE 130
SET PAGESIZE 60

REM ********** CREACION DE TABLAS *************
DROP TABLE MIEMBROS CASCADE CONSTRAINTS;
CREATE TABLE MIEMBROS(
  COD_MI		NUMBER(3)		PRIMARY KEY,
  NOMBRE_MI		VARCHAR2(40)  	NOT NULL,
  GRUPO_MI		NUMBER(2),
  FECNAC_MI		DATE
);
  
DROP TABLE GRUPOS CASCADE CONSTRAINTS;
CREATE TABLE GRUPOS(
  COD_GR		NUMBER(2)		PRIMARY KEY,
  NOMBRE_GR		VARCHAR2(50),
  LETRISTA_GR	NUMBER(3),
  TIPO_GR		NUMBER(1)
);
 
DROP TABLE TIPO_GRUPO CASCADE CONSTRAINTS;
CREATE TABLE TIPO_GRUPO(
  COD_TP		NUMBER(1)		PRIMARY KEY,
  NOMBRE_TP		VARCHAR2(10)
);

DROP TABLE JURADOS CASCADE CONSTRAINTS;
CREATE TABLE JURADOS(
  COD_JU		NUMBER(1)		PRIMARY KEY,
  NOMBRE_JU		VARCHAR2(12)
);
 
DROP TABLE VOTOS CASCADE CONSTRAINTS;
CREATE TABLE VOTOS(
  GRUPO_VO		NUMBER(2),
  JURADO_VO		NUMBER(1),
  PUNTOS_VO		NUMBER(2), 
  PRIMARY KEY (GRUPO_VO, JURADO_VO)
);

PURGE recyclebin;

REM ********** TABLA MIEMBROS *************
INSERT INTO MIEMBROS VALUES (100,'Alvarez, Antonio (Bizcocho)   ', 11,'23/07/1981');
INSERT INTO MIEMBROS VALUES (110,'Gutierrez Ellibi, Emilio      ', 11,'15/11/1958');
INSERT INTO MIEMBROS VALUES (120,'Cornejo Cornejo, Manuel       ', 11,'05/08/1965');
INSERT INTO MIEMBROS VALUES (130,'Garcia Cossio, Selu           ', 12,'10/12/1966');
INSERT INTO MIEMBROS VALUES (140,'Rey, Eder (Santonia)          ', 12,'12/04/1977');
INSERT INTO MIEMBROS VALUES (150,'ElLobe , Jose                 ', 12,'11/01/1967');
INSERT INTO MIEMBROS VALUES (160,'Villegas Elgueli, Juan Miguel ', 13,'06/12/1971');
INSERT INTO MIEMBROS VALUES (170,'Santander, Manuel             ', 13,'31/10/1975');
INSERT INTO MIEMBROS VALUES (180,'Perez Lobato, Eduardo Jesus   ', 13,'09/05/1982');
INSERT INTO MIEMBROS VALUES (190,'Ramirez Richarte, Jesus       ', 20,'26/08/1977');
INSERT INTO MIEMBROS VALUES (200,'Martines Ares, Antonio        ', 14,'12/02/1979');
INSERT INTO MIEMBROS VALUES (210,'Sanchez Soriano, Jose Antonio ', 14,'22/04/1973');
INSERT INTO MIEMBROS VALUES (220,'Silva Mulero, Jeronimo        ', 21,'10/02/1987');
INSERT INTO MIEMBROS VALUES (230,'Garcia ElChapa, Miguel Angel  ', 15,'03/07/1987');
INSERT INTO MIEMBROS VALUES (240,'Jimenez Bautista, Angela      ', 15,'05/11/1986');
INSERT INTO MIEMBROS VALUES (250,'Lopez Delgado, Abraham        ', 22,'05/08/1975');
INSERT INTO MIEMBROS VALUES (260,'Beardo, Tamara                ', 16,'02/04/1977');
INSERT INTO MIEMBROS VALUES (270,'Martin Martin, Miguel Angel   ', 21,'09/12/1986');
INSERT INTO MIEMBROS VALUES (280,'Medina Zurbano, Luis          ', 17,'01/01/1986');
INSERT INTO MIEMBROS VALUES (290,'Aguilera, Javier              ', 17,'21/10/1985');
INSERT INTO MIEMBROS VALUES (300,'Movilla Aubri, Miguel Angel   ', 17,'16/12/1995');
INSERT INTO MIEMBROS VALUES (310,'Peinado, Joshua               ', 18,'16/12/2000');
INSERT INTO MIEMBROS VALUES (320,'Peinado, Manuel               ', 18,'19/05/2003');
INSERT INTO MIEMBROS VALUES (330,'Ronquete, Alejandro           ', 18,'16/08/2004');
INSERT INTO MIEMBROS VALUES (340,'Quecuty Ponce, Rafael         ', 19,'22/02/1979');
INSERT INTO MIEMBROS VALUES (350,'Gago, Angel                   ', 19,'12/04/1982');
INSERT INTO MIEMBROS VALUES (360,'Aboza Molina, Jose Antonio    ', 19,'20/02/1987');
INSERT INTO MIEMBROS VALUES (370,'Mendoza Llanos, Paola Elsa    ', 20,'22/05/1993');
INSERT INTO MIEMBROS VALUES (380,'Rivas, Antonio                ', 20,'02/07/1953');
INSERT INTO MIEMBROS VALUES (390,'Andrade Sanchez, Abraham      ', 25,'02/04/1989');
INSERT INTO MIEMBROS VALUES (400,'Baglieto Bueno, Jesus         ', 21,'22/04/1999');
INSERT INTO MIEMBROS VALUES (410,'Pardo, Julio                  ', 32,'22/05/1970');
INSERT INTO MIEMBROS VALUES (420,'Ponce Martinez, Elena         ', 21,'02/07/1993');
INSERT INTO MIEMBROS VALUES (430,'Braza Elsheriff, Juan Manuel  ', 11,'02/04/1959');
INSERT INTO MIEMBROS VALUES (440,'Remolino, Kike                ', 22,'22/04/1979');
INSERT INTO MIEMBROS VALUES (450,'Alba, Paco                    ', 22,'08/05/1968');
INSERT INTO MIEMBROS VALUES (460,'Zahara, Alvaro                ', 23,'02/04/1985');
INSERT INTO MIEMBROS VALUES (470,'Barbate, Juan Antonio         ', 23,'22/04/1983');
INSERT INTO MIEMBROS VALUES (480,'Eco de la Bahia, Umberto      ', 23,'08/05/1982');
INSERT INTO MIEMBROS VALUES (490,'Jimena Hirene, Pascual        ', 23,'19/05/1982');
INSERT INTO MIEMBROS VALUES (500,'Pozo Aguada, Maite            ', 23,'16/08/1985');
INSERT INTO MIEMBROS VALUES (510,'Eldelcesto, Ernesto           ', 23,'22/02/1989');
INSERT INTO MIEMBROS VALUES (520,'Solari Conarte, Elena         ', 23,'11/11/1986');
INSERT INTO MIEMBROS VALUES (530,'Miranda , Enrique             ', 23,'11/08/1977');
INSERT INTO MIEMBROS VALUES (540,'Peralta , Miriam              ', 24,'10/10/1977');
INSERT INTO MIEMBROS VALUES (550,'Elcaja , Pepe                 ', 25,'07/03/1982');
INSERT INTO MIEMBROS VALUES (560,'Jartible, Andrea              ', 26,'11/11/1986');
INSERT INTO MIEMBROS VALUES (570,'Lahierbabuena , Maria         ', 27,'11/08/1990');
INSERT INTO MIEMBROS VALUES (580,'Martinez, ElCabra             ', 28,'12/10/1974');
INSERT INTO MIEMBROS VALUES (590,'Montes, Andres                ', 29,'05/09/1987');
INSERT INTO MIEMBROS VALUES (600,'Elyuyu, Jose Guerrero         ', 29,'02/02/1972');
INSERT INTO MIEMBROS VALUES (610,'Elbatitora, Antonio           ', 30,'01/07/1971');
INSERT INTO MIEMBROS VALUES (620,'EldelMentidero, Juanelo       ', 30,'05/09/1948');
INSERT INTO MIEMBROS VALUES (630,'Fernandez Vilches , Juanfra   ', 31,'01/02/1980');

COMMIT;

REM ********** TABLA GRUPOS: *************

INSERT INTO GRUPOS VALUES (11, 'El grinch de Cadiz'        , 430, 1);          
INSERT INTO GRUPOS VALUES (12, 'Que ni las hambre vamos a sentir', 130, 1);          
INSERT INTO GRUPOS VALUES (13, 'Los exageraos'        , 160, 1);          
INSERT INTO GRUPOS VALUES (14, 'La oveja negra', 200, 3);          
INSERT INTO GRUPOS VALUES (15, 'Los colgaos'       , 230, 3);          
INSERT INTO GRUPOS VALUES (16, 'Los ofendiditos'  , 260, 3);          
INSERT INTO GRUPOS VALUES (17, 'Los coco de Cadiz', 290, 2);          
INSERT INTO GRUPOS VALUES (18, 'En mi caseta cabe to el mundo'       , 320, 2);          
INSERT INTO GRUPOS VALUES (19, 'Punk y circo', 350, 2);          
INSERT INTO GRUPOS VALUES (20, 'El gremio'           , 380, 4);          
INSERT INTO GRUPOS VALUES (21, 'Los Luciernagas'     , 410, 4);          
INSERT INTO GRUPOS VALUES (22, 'Los iluminaos'    , 440, 4);   
INSERT INTO GRUPOS VALUES (23, 'Valiente Principe', 460, 5);          
INSERT INTO GRUPOS VALUES (24, 'Las sin filtro'        , 540, 5);          
INSERT INTO GRUPOS VALUES (25, 'Los Bacardi'          , 390, 5);  
INSERT INTO GRUPOS VALUES (26, 'Los becarios del telediario'        , 560, 5); 
INSERT INTO GRUPOS VALUES (27, 'Annunakis inmortales en la playa de los corrales'  , 570, 6);          
INSERT INTO GRUPOS VALUES (28, 'Callehero'           , 580, 6);          
INSERT INTO GRUPOS VALUES (29, 'Nostagia de hueva', 590, 6);  
INSERT INTO GRUPOS VALUES (30, 'La IA la gran puta'     , 600, 6);
INSERT INTO GRUPOS VALUES (31, 'Los Taquilleros de Vilches'  , 630, 3);  
INSERT INTO GRUPOS VALUES (32, 'El paraiso'  , 410, 4);  
        
COMMIT;

REM ********** TABLA TIPO_GRUPO: *************
INSERT INTO TIPO_GRUPO VALUES (1, 'CHIRIGOTA');
INSERT INTO TIPO_GRUPO VALUES (2, 'CUARTETO' );
INSERT INTO TIPO_GRUPO VALUES (3, 'COMPARSA' );
INSERT INTO TIPO_GRUPO VALUES (4, 'CORO'     );
INSERT INTO TIPO_GRUPO VALUES (5, 'CALLEJERA');
INSERT INTO TIPO_GRUPO VALUES (6, 'ROMANCERO');
COMMIT;

REM ********** TABLA JURADO: *************
INSERT INTO JURADOS VALUES (1, 'JUAN ANTONIO');
INSERT INTO JURADOS VALUES (2, 'MARIA'       );
INSERT INTO JURADOS VALUES (3, 'JORGE'       );
INSERT INTO JURADOS VALUES (4, 'JOSE MARIA'  );
COMMIT;

REM ********** TABLA VOTOS: *************
INSERT INTO VOTOS VALUES (11, 1, 47);          
INSERT INTO VOTOS VALUES (12, 1, 23);          
INSERT INTO VOTOS VALUES (13, 1, 46);          
INSERT INTO VOTOS VALUES (14, 1, 49);          
INSERT INTO VOTOS VALUES (15, 1,  2);          
INSERT INTO VOTOS VALUES (16, 1, 15);          
INSERT INTO VOTOS VALUES (17, 1, 28);          
INSERT INTO VOTOS VALUES (18, 1, 31);          
INSERT INTO VOTOS VALUES (19, 1, 49);          
INSERT INTO VOTOS VALUES (20, 1,  7);          
INSERT INTO VOTOS VALUES (21, 1, 17);          
INSERT INTO VOTOS VALUES (22, 1, 25);  
INSERT INTO VOTOS VALUES (11, 2, 32);          
INSERT INTO VOTOS VALUES (12, 2, 40);          
INSERT INTO VOTOS VALUES (13, 2,  3);          
INSERT INTO VOTOS VALUES (14, 2, 16);          
INSERT INTO VOTOS VALUES (15, 2, 29);          
INSERT INTO VOTOS VALUES (16, 2, 32);          
INSERT INTO VOTOS VALUES (17, 2, 45);          
INSERT INTO VOTOS VALUES (18, 2,  8);          
INSERT INTO VOTOS VALUES (19, 2, 11);          
INSERT INTO VOTOS VALUES (20, 2, 24);          
INSERT INTO VOTOS VALUES (21, 2, 37);          
INSERT INTO VOTOS VALUES (22, 2, 41);  
INSERT INTO VOTOS VALUES (11, 3,  5);          
INSERT INTO VOTOS VALUES (12, 3, 10);          
INSERT INTO VOTOS VALUES (13, 3, 51);          
INSERT INTO VOTOS VALUES (14, 3, 30);          
INSERT INTO VOTOS VALUES (15, 3, 43);          
INSERT INTO VOTOS VALUES (16, 3,  6);          
INSERT INTO VOTOS VALUES (17, 3, 19);          
INSERT INTO VOTOS VALUES (18, 3, 22);          
INSERT INTO VOTOS VALUES (19, 3, 35);          
INSERT INTO VOTOS VALUES (20, 3, 48);          
INSERT INTO VOTOS VALUES (21, 3,  1);          
INSERT INTO VOTOS VALUES (22, 3, 14);  
INSERT INTO VOTOS VALUES (11, 4, 27);          
INSERT INTO VOTOS VALUES (12, 4, 31);          
INSERT INTO VOTOS VALUES (13, 4, 44);          
INSERT INTO VOTOS VALUES (14, 4,  7);          
INSERT INTO VOTOS VALUES (15, 4, 11);          
INSERT INTO VOTOS VALUES (16, 4, 25);          
INSERT INTO VOTOS VALUES (17, 4, 30);          
INSERT INTO VOTOS VALUES (18, 4, 41);          
INSERT INTO VOTOS VALUES (19, 4,  3);          
INSERT INTO VOTOS VALUES (20, 4, 19);          
INSERT INTO VOTOS VALUES (21, 4, 28);          
INSERT INTO VOTOS VALUES (22, 4, 38);  
COMMIT;                          
                                 
REM ********** FOREIGN KEY *************
ALTER TABLE MIEMBROS ADD CONSTRAINT FK_MIEMBROS_GR FOREIGN KEY (GRUPO_MI)    REFERENCES GRUPOS     ON DELETE CASCADE;
ALTER TABLE GRUPOS   ADD CONSTRAINT FK_GRUPOS_GR   FOREIGN KEY (LETRISTA_GR) REFERENCES MIEMBROS   ON DELETE CASCADE;
ALTER TABLE GRUPOS   ADD CONSTRAINT FK_GRUPOS_TP   FOREIGN KEY (TIPO_GR)     REFERENCES TIPO_GRUPO ON DELETE CASCADE;
ALTER TABLE VOTOS    ADD CONSTRAINT FK_VOTOS_GR    FOREIGN KEY (GRUPO_VO)    REFERENCES GRUPOS     ON DELETE CASCADE;
ALTER TABLE VOTOS    ADD CONSTRAINT FK_VOTOS_JU    FOREIGN KEY (JURADO_VO)   REFERENCES JURADOS    ON DELETE CASCADE;

REM ********** SELECT *************
SELECT * FROM MIEMBROS;
SELECT * FROM GRUPOS;
SELECT * FROM TIPO_GRUPO;
SELECT * FROM JURADOS;
SELECT * FROM VOTOS;

REM ********** FIN *************************
