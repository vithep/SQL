/* DICIONARIO DE DADOS */

SHOW DATABASES;

USE INFORMATION_SCHEMA;

STATUS

SHOW TABLES;

DESC TABLE_CONSTRAINTS;

SELECT CONSTRAINT_SCHEMA AS "BANCO",
	   TABLE_NAME AS "TABELA",
	   CONSTRAINT_NAME AS "NOME REGRA",
	   CONSTRAINT_TYPE AS "TIPO"
	   FROM TABLE_CONSTRAINTS
	   WHERE CONSTRAINT_SCHEMA = 'COMERCIO';

/* APAGANDO CONSTRAINTS */

USE COMERCIO;

ALTER TABLE TELEFONE
DROP FOREIGN KEY FK_CLIENTE_TELEFONE;

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);

/*36 E ACOES DE CONSTRAINTS */

SHOW TABLES;

INSERT INTO CLIENTE VALUES(1,'RICARDO');
INSERT INTO CLIENTE VALUES(2,'CLARA');
INSERT INTO CLIENTE VALUES(3,'JULIO');
INSERT INTO CLIENTE VALUES(4,'ANA');

INSERT INTO TELEFONE VALUES(10,'CEL','37834334',2);
INSERT INTO TELEFONE VALUES(20,'RES','67465656',2);
INSERT INTO TELEFONE VALUES(30,'CEL','88665645',1);
INSERT INTO TELEFONE VALUES(40,'RES','77543546',3);
INSERT INTO TELEFONE VALUES(50,'COM','75454675',1);
INSERT INTO TELEFONE VALUES(60,'CEL','76765455',4);

SELECT NOME, TIPO, NUMERO
FROM CLIENTE
INNER JOIN TELEFONE
ON IDCLIENTE = ID_CLIENTE;

/*ERRO DE REFERENCIA */
DELETE FROM CLIENTE WHERE IDCLIENTE = 1;

/*CORRIGIR ERRO*/
DELETE FROM TELEFONE
WHERE ID_CLIENTE = 1;
DELETE FROM CLIENTE WHERE IDCLIENTE = 1;

/* APAGANDO A FOREIGN KEY */

ALTER TABLE TELEFONE DROP FOREIGN KEY FK_CLIENTE_TELEFONE;

/*RECRIANDO A FK */

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
ON DELETE CASCADE;

SELECT NOME, TIPO, NUMERO
FROM CLIENTE
INNER JOIN TELEFONE
ON IDCLIENTE = ID_CLIENTE;

DELETE FROM CLIENTE WHERE IDCLIENTE = 2;

ALTER TABLE TELEFONE DROP FOREIGN KEY FK_CLIENTE_TELEFONE;

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
ON DELETE SET NULL;

SELECT NOME, TIPO, NUMERO
FROM CLIENTE
INNER JOIN TELEFONE
ON IDCLIENTE = ID_CLIENTE;

SELECT * FROM CLIENTE;

DELETE FROM CLIENTE WHERE IDCLIENTE = 3;

SELECT * FROM TELEFONE;

/* SET NULL - DELETE CASCADE */