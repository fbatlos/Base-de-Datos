CREATE TABLE CASAS (
 NUM NUMBER(2) NOT NULL,
 DNOMBRE VARCHAR2(14), 
 LOC VARCHAR2(14) ) ;

CREATE INDEX index_CASA
on CASAS(NUM);

SELECT   index_name, 
    index_type,  
    status  
FROM all_indexes
WHERE table_name = 'CASAS';




CREATE TABLE EQUIPOS (
    id_team NUMBER GENERATED ALWAYS AS IDENTITY,
    description VARCHAR2(100) NOT NULL
);

INSERT INTO EQUIPOS(description)
values('OCULT')

select * from EQUIPOS;