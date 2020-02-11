/* MODELAGEM BASICA */

CLIENTE

NOME CARACTER(30)
CPF NUMERICO(11)
EMAIL CARACTER(30)
TELEFONE CARACTER(30)
SEXO CARACTER(1)
ENDERECO CARACTER(100)

/* PROCESSOS DE MODELAGEM */
/* ADM DE DADOS */
MODELAGEM CONCEITUAL - RASCUNHO 01 

MODELAGEM LOGICA - PROGRMAS COMO BRMODELO

/* AD - DBA */

MODELAGEM FISICA - SCRIPT DO BANCO

/* MODELO FISICO */

/* CRIANDO UM BANCO */

CREATE DATABASE PROJETO;

/* CONECTANDO */

USE PROJETO;

/* CRIANDO A TABELA */

CREATE TABLE CLIENTE(
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	CPF INT(11),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100)
);

/* VERIFICANDO AS TABELAS */

SHOW TABLES; 

/* DESCREVENDO TABELA */

DESC CLIENTE;

/* OS INSERTS */
/* INSERINDO DADOS E VALORES NULOS */

use projeto 

/* MOSTRANDO AS TABELAS */

show tables;

/* EXIBINDO A ESTRUTURA DE UMA TABELA */

desc cliente;

/* FORMA 01 - INCLUINDO AS COLUNAS */

INSERT INTO CLIENTE VALUES('JOAO','M','JOAO@GMAIL.COM',988638273,'22923110','RUA BORTOLO BALVEDI - CANTELE - ERECHIM - RS');
INSERT INTO CLIENTE VALUES('CECILIA','F','CECILIA@GMAIL.COM',238664567,'22924537','RUA UNIAO - CENTROO - RIO DE JANEIRO - RJ');
INSERT INTO CLIENTE VALUES('JORGE','M',NULL,988637377,'22923110','OSCAR CURI - JOAO PESSOA - SAO PAULO - SP');
INSERT INTO CLIENTE VALUES('RENAN','M',NULL,982337377,'22343110','DIONISIO FABIANI - CANTELE - ERECHIM - RS');
INSERT INTO CLIENTE VALUES('ANA JULIA','F',NULL,988623477,'22467110','PORTUGAL - PORTUGAL - FLORIANOPOLIS - SC');

/* FORMA 02 - INCLUINDO AS COLUNAS */   

INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('LILIAN','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','976567876',025678542);

/* FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL */

INSERT INTO CLIENTE VALUES('ANA','F','ANA@GLOBO.COM',234432132,'988764878','PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP');,
						  ('LUIZA','F','LUIZA@GLOBO.COM.BR',234212332,'635764878','DIONISIO FABIANI - SAO CAETANO - ERECHIM - RS');
						  
/* O COMANDO SELECT */

SELECT NOW();

SELECT 'FELIPE MAFRA';

SELECT 'BANCO DE DADOS';
SELECT 
SELECT NOME, SEXO, EMAIL FROM CLIENTE;

/* APENAS FINS ACADEMICOS */

SELECT * FROM CLIENTE;

/* FILTRANDO */

SELECT NOME, SEXO FROM CLIENTE 
WHERE SEXO = 'M';

SELECT NOME, SEXO FROM CLIENTE
WHERE SEXO = 'F';

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO = 'RJ';

/* UTILIZANDO O LIKE */

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE 'RJ';

/* CARACTER CORINGA % */

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE '%RJ';

/* OPERADORES LÓGICOS */
/* OU - OU */

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE 
SEXO = 'M' OR ENDERECO LIKE '%RJ';

SELECT NOME, EMAIL FROM CLIENTE
WHERE 
SEXO = 'F' OR ENDERECO LIKE '%MG';

/* AND - E */

SELECT NOME, EMAIL FROM CLIENTE
WHERE 
SEXO = 'M' AND ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE
SEXO = 'F' AND ENDERECO LIKE '%RJ';

/* COUNT(*), GROUP BY, PERFORMANCE COM OPERADORES LOGICOS */
/* CONTANDO OS REGISTROS DA TABELA */

SELECT COUNT(*)FROM CLIENTE;

SELECT COUNT(*) AS "QUANTIDADE" FROM CLIENTE;

/* OPERADOR GROUP BY */

SELECT SEXO, COUNT(*) AS "QUANTIDADE"
FROM CLIENTE 
GROUP BY SEXO;


/* PERFORMANCE EM OPERADORES LOGICOS */
/* 1 MILHAO DE REGISTROS

PARA CONTAR 
SELECT COUNT(*) FROM CLIENTE;

SELECT SEXO, COUNT(*) FROM CLIENTE
GROUP BY SEXO;

SELECT CIDADE, COUNT(*) FROM CLIENTE
GROUP BY CIDADE;

CONDICAO
SEXO = F 
CIDADE = RIO DE JANEIRO 



/* FILTRANDO VALORES NULOS */

SELECT NOME, SEXO, ENDERECO 
FROM CLIENTE
WHERE EMAIL IS NULL;


/* UTILIZANDO UPDATE PARA ATUALIZAR VALORES */

SELECT NOME, EMAIL FROM CLIENTE;

UPDATE CLIENTE
SET EMAIL = 'LILIAN@HOTMAIL.COM';

/* SEMPRE USAR UPDATE COM A CLAUSULA WHERE */

UPDATE CLIENTE
SET EMAIL = 'JORGE@HOTMAIL.COM'
WHERE NOME = 'JORGE';

/* DELETANDO REGISTROS COM A CLAUSULA DELETE, SEMPRE COM WHERE */

DELETE FROM CLIENTE; ---------- NUNCA FAZER ----------

SELECT COUNT(*) FROM CLIENTE;

DELETE FROM CLIENTE 
WHERE NOME = 'ANA';

SELECT COUNT(*) FROM CLIENTE;

/* CARDINALIDADE - QUEM DEFINE É A REGRA DE NEGÓCIOS */
/* PRIMEIRO ALGARISMO - OBRIGATORIEDADE 
0 - NAO OBRIGATORIO
1 - OBRIGATORIO

SEGUNDO ALGARISMO - CARDINALIDADE 
1 - MAXIMO DE UM
N - MAIS DE UM 
*/



========= /* CRIANDO NOVA TABELA */ =========




CREATE DATABASE COMERCIO;

USE COMERCIO;

CREATE TABLE CLIENTE (
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('COM','RES','CEL' ),
	NUMERO VARCHAR(10),
	ID_CLIENTE INT,
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

/* FOREIGN KEY - CHAVE ESTRANGEIRA - FK */
/* É A CHAVE PREIMARIA DE UMA TABELA, QUE VAI ATE
OUTRA TABELA FAZER REFERENCIA */

/* EM RELACIONAMENTOS 1 X 1, A CHAVE ESTRANGEIRA
FICA NA TABELA MAIS FRACA */

/* EM RELACIONAMENTOS 1 X N, A CHAVE
ESTRANGEIRA FICARA SEMPRE NA TABELA N */

/* FAZENDO OS INSERTS - CLIENTES*/

INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAO@IG.COM','98547-6');
INSERT INTO CLIENTE VALUES(NULL,'RENAN','M','RENAN@TERRA.COM','86664-7');
INSERT INTO CLIENTE VALUES(NULL,'ANA','F','ANA@GLOBO.COM','75658-5');
INSERT INTO CLIENTE VALUES(NULL,'JONAS','M','JONAS@IG.COM','88657-5');
INSERT INTO CLIENTE VALUES(NULL,'CLARA','F',NULL,'99754-7');
INSERT INTO CLIENTE VALUES(NULL,'CECILIA','F','CECILIA@TERRA.COM','77558-5');

SELECT * FROM CLIENTE;

/* FAZENDO OS INSERTS - ENDERECO*/

 INSERT INTO ENDERECO VALUES(NULL,'RUA A','CENTRO','ERECHIM','RS',1);
 INSERT INTO ENDERECO VALUES(NULL,'RUA B','SAO CAETANO','ERECHIM','RS',2);
 INSERT INTO ENDERECO VALUES(NULL,'RUA C','CENTRO','RIO DE JANEIRO','RJ',3);
 INSERT INTO ENDERECO VALUES(NULL,'RUA D','JARDINS','SAO PAULO','SP',4);
 INSERT INTO ENDERECO VALUES(NULL,'RUA E','LINHO','ERECHIM','RS',5);
 INSERT INTO ENDERECO VALUES(NULL,'RUA F','DUENDE','PASSO FUNDO','RS',6);

SELECT * FROM ENDERECO;

/* FAZENDO OS INSERTS - TELEFONE*/

INSERT INTO TELEFONE VALUES(NULL,'CEL','123456789',3);
INSERT INTO TELEFONE VALUES(NULL,'COM','12345624',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','12345645',6);
INSERT INTO TELEFONE VALUES(NULL,'RES','12345583',6);
INSERT INTO TELEFONE VALUES(NULL,'CEL','12349852',3);
INSERT INTO TELEFONE VALUES(NULL,'RES','12316385',5);

SELECT * FROM CLIENTE;
SELECT * FROM ENDERECO;
SELECT * FROM TELEFONE;

/* JOIN - JUNCAO - 2 TABELAS */

SELECT NOME, SEXO, BAIRRO, CIDADE 
FROM CLIENTE 
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE
WHERE SEXO  = 'M';

/* JOIN - JUNCAO - 3 TABELAS */

SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, 
ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE
INNER JOIN ENDERECO
ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE
ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

/* FORMA PRATICA - APELIDOS */

SELECT C.NOME, C.SEXO, E.BAIRRO, 
E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

-----------------------------

SELECT C.NOME, C.SEXO, E.BAIRRO, 
E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F';

/* ESTUDANDO AS QUERIES */

SELECT C.NOME, C.EMAIL, T.NUMERO
FROM CLIENTE C
INNER JOIN TELEFONE  T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
WHERE TIPO = 'CEL' AND ESTADO = 'RJ';


+------+---------------+-----------+
| NOME | EMAIL         | NUMERO    |
+------+---------------+-----------+
| ANA  | ANA@GLOBO.COM | 123456789 |
| ANA  | ANA@GLOBO.COM | 12349852  |
+------+---------------+-----------+

/* IFNULL */

SELECT C.NOME, 
	   IFNULL( C.EMAIL,'SEM EMAIL')  <------
	   T.NUMERO
FROM CLIENTE C
INNER JOIN TELEFONE  T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
WHERE TIPO = 'CEL' AND ESTADO = 'RJ';


/* VIEWS OU VISOES */

CREATE VIEW V_RELATORIO AS
SELECT C.NOME, 
       C.SEXO,
	   IFNULL(C.EMAIL,'SEM E-MAIL'), 
	   T.TIPO, 
	   T.NUMERO, 
	   E.BAIRRO, 
	   E.CIDADE, 
	   E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;

SELECT * FROM RELATORIO;

SELECT * FROM RELATORIO
WHERE SEXO = 'F';

/* APAGANDO VIEW */

DROP VIEW V_RELATORIO

/* ORDER BY */

SELECT NOME, SEXO, CPF, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO 
ON IDCLIENTE = ID_CLIENTE;


SELECT NOME, SEXO, CPF, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO 
ON IDCLIENTE = ID_CLIENTE
ORDER BY NOME;   --------------- ORDENA POR ORDEM ALFABETICA


SELECT NOME, SEXO, CPF, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO 
ON IDCLIENTE = ID_CLIENTE
ORDER BY NOME, CPF ASC;   <---------------- 


SELECT NOME, SEXO, CPF, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO 
ON IDCLIENTE = ID_CLIENTE
ORDER BY 4;      --------------- ORDENA PELA QUARTA COLUNA

/* DELIMITADOR E ESTADO DE SERVIDOR */

DELIMITER $      --------- TROCA O DELIMITADOR

STATUS    -------- COMANDO QUE DIZ COISAS DO SERVIDOR 

/* CRIANDO PROCEDURES */

---> SEMPRE INICIAR MUDANDO O DELIMITADOR 

DELIMITER $

CREATE PROCEDURE NOME()
BEGIN
		ACAO;
END
$

SELECT 10 + 10 AS 'CONTA'$

CREATE PROCEDURE CONTA()
BEGIN	
		SELECT 10 + 10 AS 'CONTA';
END
$

/* CHAMANDO UMA PROCEDURE */

CALL CONTA()$

/* PROCEDURES COM PARAMETROS */
/* APAGANDO PROCEDURE */

DROP PROCEDURE CONTA$

/* COM PARAMETROS */

CREATE PROCEDURE CONTA(NUMERO1 INT, NUMERO2 INT)
BEGIN	
		SELECT NUMERO1 + NUMERO2 AS 'CONTA';
END
$

CALL CONTA(100,78)$
CALL CONTA(13,4564)$
CALL CONTA(2342,4654)$

/* PROCEDURES COM TABELAS */

CREATE TABLE CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	HORAS INT(3) NOT NULL,
	VALOR FLOAT(10,2) NOT NULL
)$

INSERT INTO CURSOS VALUES(NULL,'BANCO DE DADOS FUNDAMENTAL',25,200.00)$

SELECT * FROM CURSOS$


CREATE PROCEDURE CAD_CURSO(P_NOME VARCHAR(30),P_HORAS INT(3),P_PRECO FLOAT(10,2))
BEGIN 
		INSERT INTO CURSOS VALUES(NULL, P_NOME,P_HORAS,P_PRECO);
END
$


CREATE PROCEDURE SEL_CURSO()
BEGIN
		SELECT IDCURSO, NOME, HORAS, VALOR
		FROM CURSOS;
END
$

CALL SEL_CURSO()$

/* FUNCOES DE AGREGACOES NUMERICAS */

CREATE TABLE VENDEDORES(
	IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR (1), 
	JANEIRO FLOAT(10,2),
	FEVEREIRO FLOAT(10,2),
	MARCO FLOAT(10,2)
);

INSERT INTO VENDEDORES VALUES(NULL,'ANDERSON','M',22900.38,30400.87,42345.85);
INSERT INTO VENDEDORES VALUES(NULL,'JOEL','M',12400.38,30200.87,51445.85);
INSERT INTO VENDEDORES VALUES(NULL,'LAURA','F',12300.38,37800.87,74545.85);
INSERT INTO VENDEDORES VALUES(NULL,'EDGAR','M',95600.38,305600.87,74645.85);
INSERT INTO VENDEDORES VALUES(NULL,'MARIA','F',54600.38,23400.87,54345.85);
INSERT INTO VENDEDORES VALUES(NULL,'RENAN','M',23400.38,45400.87,34545.85);
INSERT INTO VENDEDORES VALUES(NULL,'CLARA','F',18900.38,74800.87,32145.85);
INSERT INTO VENDEDORES VALUES(NULL,'ANA','F',24600.38,94600.87,12345.85);

/* MAX - TRAZ O VALOR MAXIMO DE UMA COLUNA */

SELECT MAX(FEVEREIRO) AS MAIOR_FEV
FROM VENDEDORES;

/* MIN - TRAZ O VALOR MINIMO DE UMA COLUNA */

SELECT MIN(FEVEREIRO) AS MENOR_FEV
FROM VENDEDORES;

/* AVG - TRAZ O VALOR MEDIO DE UMA COLUNA */

SELECT AVG(FEVEREIRO) AS MEDIA_FEV
FROM VENDEDORES;

/* VARIAS FUNCOES */

SELECT MAX(JANEIRO) AS MAX_JAN,
	   MIN(JANEIRO) AS MIN_JAN,
	   TRUNCATE (AVG(JANEIRO),2) AS MEDIA_JAN
	   FROM VENDEDORES;
	  
/* FUNCAO TRUNCATE */
SELECT MAX(JANEIRO) AS MAX_JAN,
	   MIN(JANEIRO) AS MIN_JAN,
	   TRUNCATE (AVG(JANEIRO),2) AS MEDIA_JAN
	   FROM VENDEDORES;
	   
/* AGREGANDO COM A FUNCAO SUM() - SOMA OS VALORES DE UAM COLUNA */ 

SELECT SUM(JANEIRO) AS TOTAL_JAN,
	   SUM(FEVEREIRO) AS TOTAL_FEV,
	   SUM(MARCO) AS TOTAL_MAR
FROM VENDEDORES;

/* VENDAS POR SEXO */

SELECT SEXO, SUM(MARCO) AS TOTAL_MARCO
FROM VENDEDORES
GROUP BY SEXO;

/* SUBQUERIES */

/* VENDEDOR QUE VENDEU MENOS EM MARCO E SEU NOME */

SELECT MIN(MARCO) FROM VENDEDORES;

V

SELECT NOME, MARCO FROM VENDEDORES
WHERE MARCO = (SELECT MIN(MARCO) FROM VENDEDORES);

/* VENDEDOR QUE VENDEU MAIS EM MARCO E SEU NOME */

SELECT MAX(MARCO) FROM VENDEDORES;

V

SELECT NOME, MARCO FROM VENDEDORES
WHERE MARCO = (SELECT MAX(MARCO) FROM VENDEDORES);

/* VENDEDOR QUE VENDEU MAIS QUE O VALOR MEDIO DE FEVEREIRO */
SELECT NOME, FEVEREIRO FROM VENDEDORES
WHERE FEVEREIRO > (SELECT AVG(FEVEREIRO) FROM VENDEDORES);


/* OPERACOES EM LINHA */

SELECT * FROM VENDEDORES;

SELECT NOME,
	   JANEIRO,
	   FEVEREIRO,
	   MARCO,
	   (JANEIRO+FEVEREIRO+MARCO) AS "TOTAL",
	   TRUNCATE ((JANEIRO+FEVEREIRO+MARCO)/3,2) AS "MEDIA"
FROM VENDEDORES;


/* ALTERANDO TABELAS */

CREATE TABLE TABELA(
	COLUNA1 VARCHAR(30),
	COLUNA2 VARCHAR(30),
	COLUNA3 VARCHAR(30)
);

CREATE TABLE TABELA(
	COLUNA1 INT PRIMARY KEY AUTO_INCREMENT 
);	

-- ADICIONANDO ESSA PK A TABELA SIMPLES --

ALTER TABLE TABELA
ADD PRIMARY KEY (COLUNA1);

-- ADICIONANDO COLUNA SEM POSICAO. -- SE ADD UMA COLUNA, ELA VAI SEMPRE PARA A ULTIMA POSICAO --

ALTER TABLE TABELA
ADD COLUNA VARCHAR(30);

-- ADICIONANDO UMA COLUNA COM POSICAO --

ALTER TABLE TABELA 
ADD COLUMN COLUNA4 VARCHAR(30) NOT NULL UNIQUE
AFTER COLUNA3;

-- MODIFICANDO O TIPO DE UM CAMPO --

ALTER TABLE TABELA MODIFY COLUNA2 DATE NOT NULL;

-- RENOMEANDO A TABELA --

ALTER TABLE TABELA
RENAME PESSOA;

-- CRIANDO OUTRA TABELA --
CREATE TABLE TIME(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	TIME VARCHAR(30),
	ID_PESSOA VARCHAR(30)
);

-- BOTANDO A FOREING KEY --

ALTER TABLE TIME
ADD FOREIGN KEY(ID_PESSOA)
REFERENCES PESSOA(COLUNA1);

/* VERIFICAR AS CHAVES */

SHOW CREATE TABLE TIME;    ------ DESCRICAO DETALHADA DA TABELA

/* ORGANIZACAO DE CHAVES - CONSTRAINT (REGRA) */

CREATE TABLE JOGADOR (
	IDJOGADOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30)
);

CREATE TABLE TIMES(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	NOMETIME VARCHAR(30),
	ID_JOGADOR INT,
	FOREIGN KEY(ID_JOGADOR)
	REFERENCES JOGADOR(IDJOGADOR)
);

INSERT INTO JOGADOR VALUES(NULL,'GUERRERO');
INSERT INTO TIMES VALUES(NULL,'FLAMENGO',1);

SHOW CREATE TABLE JOGADOR;
SHOW CREATE TABLE TIMES;

/* ORGANIZANOD CHAVES E ACOES DE CONSTRAINTS */

DROP TABLE ENDERECO;
DROP TABLE TELEFONE;
DROP TABLE CLIENTE;

CREATE TABLE CLIENTE(
	IDCLIENTE INT,
	NOME VARCHAR(30)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT,
	TIPO CHAR(3) NOT NULL,
	NUMERO VARCHAR(30) NOT NULL,
	ID_CLIENTE INT
);

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE
PRIMARY KEY(IDCLIENTE);

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);

SHOW CREATE TABLE TELEFONE;

/* DICIONARIO DE DADOS */
-- GUARDA OS METADADOS --

SHOW DATABASES;

USE INFORMATION_SCHEMA;

DESC TABLE_CONSTRAINTS;

SELECT CONSTRAINT_SCHEMA AS 'BANCO',
		TABLE_NAME AS 'TABELA',
		CONSTRAINT_NAME AS 'NOME DA REGRA',
		CONSTRAINT_TYPE AS 'TIPO'
		FROM TABLE_CONSTRAINTS
		WHERE CONSTRAINT_SCHEMA = 'COMERCIO';

/* APAGANDO CONSTRAINTS */

ALTER TABLE TELEFONE
DROP FOREIGN KEY FK_CLIENTE_TELEFONE;

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);

/* ESTRUTURA DE UMA TRIGGER */

-- PRIMEIRO MUDAR O DELIMITADOR --

CREATE TRIGGER NOME
BEFORE/AFTER INSERT/DELETE/UPDATE ON TABELA
FOR EACH ROW (PARA CADA LINHA)
BEGIN -> INICIO 

		QUALQUER COMANDO SQL

END -> FIM

CREATE DATABASE AULA40;

USE AULA40;

CREATE TABLE USUARIO(
	IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30),
	SENHA VARCHAR(100)
);

CREATE TABLE BKP_USUARIO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDUSUARIO INT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30)
);

-- CRIANDO A TRIGGER DO BACKUP--

DELIMITER $

CREATE TRIGGER BACKUP_USUARIO
BEFORE DELETE ON USUARIO
FOR EACH ROW
BEGIN 

	INSERT INTO BKP_USUARIO VALUES
	(NULL,OLD.IDUSUARIO,OLD.NOME,OLD.LOGIN);	

END
$

INSERT INTO USUARIO VALUES(NULL,'RENAN','RENAN2910','MINHASENHA');

SELECT * FROM USUARIO;

DELETE FROM USUARIO WHERE IDUSUARIO = 1;

/* COMUNICACAO ENTRE BANCOS DE DADOS */

CREATE DATABASE LOJA;

USE LOJA;

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

-- -- -- --

CREATE DATABASE BACKUP;

USE BACKUP;

CREATE TABLE BKP_PRODUTO(
	IDBKP INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,1000,'TESTE',0.0);

SELECT * FROM BACKUP.BKP_PRODUTO;

DELIMITER $

-- CRIANDO A TRIGGER DO INSERT --

CREATE TRIGGER BACKUP_PRODUTO
BEFORE INSERT ON PRODUTO 
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BKP_PRODUTO VALUES
	(NULL,NEW.IDPRODUTO,NEW.NOME,NEW.VALOR,'I');

END
$

-- -- -- -- 

DELIMITER ;

INSERT INTO PRODUTO VALUES(NULL,'LIVRO MODELAGEM',50.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO BI',59.90);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO SQL',90.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO PYTON',100.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO de TESTE',60.25);

SELECT * FROM PRODUTO;

SELECT * FROM BACKUP.BKP_PRODUTO;

-- CRIANDO A TRIGGER DO DELETE --

CREATE TRIGGER BACKUP_PRODUTO_DEL
BEFORE DELETE ON PRODUTO 
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BKP_PRODUTO VALUES
	(NULL,OLD.IDPRODUTO,OLD.NOME,OLD.VALOR);

END
$

DELETE FROM PRODUTO WHERE IDPRODUTO = 2;

DROP TRIGGER BACKUP_PRODUTO;

CREATE TRIGGER BACKUP_PRODUTO
AFTER INSERT ON PRODUTO 
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BKP_PRODUTO VALUES
	(NULL,NEW.IDPRODUTO,NEW.NOME,NEW.VALOR);

END
$

-- INDICANDO SE FOI PRO BACKUP ATRAVES DE DELETE OU INSERT --

ALTER TABLE BACKUP.BKP_PRODUTO
ADD EVENTO CHAR(1);

DROP TRIGGER BACKUP_PRODUTO_DEL;

CREATE TRIGGER BACKUP_PRODUTO_DEL
BEFORE DELETE ON PRODUTO 
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BKP_PRODUTO VALUES
	(NULL,OLD.IDPRODUTO,OLD.NOME,OLD.VALOR,'D');

END
$

DELETE FROM PRODUTO WHERE IDPRODUTO = 4;

SELECT * FROM BACKUP.BKP_PRODUTO;

/* TRIGGER DE AUDITORIA */

DROP DATABASE LOJA;
DROP DATABASE BACKUP;

CREATE DATABASE LOJA;

USE LOJA;

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

INSERT INTO PRODUTO VALUES(NULL,'LIVRO MODELAGEM',50.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO BI',59.90);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO SQL',90.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO PYTON',100.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO de TESTE',60.25);


SELECT NOW(); -- QUANDO 
SELECT CURRENT_USER(); -- QUEM 

CREATE DATABASE BACKUP;

USE BACKUP;

CREATE TABLE BKP_PRODUTO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(30),
	VALOR_ORIGINAL FLOAT(10,2),
	VALOR_ALTERADO FLOAT(10,2),
	DATA DATETIME,
	USUARIO VARCHAR(30),
	EVENTO CHAR(1)
);

USE LOJA;

INSERT INTO PRODUTO VALUES(NULL,'LIVRO MODELAGEM',50.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO BI',59.90);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO SQL',90.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO PYTON',100.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO de TESTE',60.25);


CREATE TRIGGER AUDIT_PROD
AFTER UPDATE ON PRODUTO
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BKP_PRODUTO VALUES
	(NULL,OLD.IDPRODUTO,OLD.NOME,OLD.VALOR,
	NEW.VALOR,NOW(),CURRENT_USER(),'U');

END
$


UPDATE PRODUTO SET VALOR = 150.00
WHERE IDPRODUTO = 4;

SELECT * FROM PRODUTO;

SELECT * FROM BACKUP.BKP_PRODUTO;

/* AULA 44 - AUTORRELACIONAMENTO */  

CREATE TABLE CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	HORAS INT,
	VALOR FLOAT(10,2),
	ID_PREREQ INT
);

ALTER TABLE CURSOS ADD CONSTRAINT FK_PREREQ
FOREIGN KEY(ID_PREREQ) REFERENCES CURSOS(IDCURSO);

INSERT INTO CURSOS VALUES(NULL,'BD RELACIONAL',20,400.00,NULL);
INSERT INTO CURSOS VALUES(NULL,'BUSINESS INTELIGENCE',74,860.99,1);
INSERT INTO CURSOS VALUES(NULL,'RELATORIOS AVANCADOS',32,100.00,2);
INSERT INTO CURSOS VALUES(NULL,'LOGICA PROGRAMACAO',40,680.00,NULL);
INSERT INTO CURSOS VALUES(NULL,'JAVA SCRIPT',18.100,00,4);

SELECT * FROM CURSOS;

SELECT NOME, VALOR, HORAS, IFNULL(ID_PREREQ,'SEM REQ') REQUISITO
FROM CURSOS;

/* NOME, VALOR, HORAS E NOME DO PRE REQUISITO */

SELECT C.NOME AS CURSO, 
	   C.VALOR AS VALOR, 
	   C.HORAS CARGA_HORARIA, 
	   IFNULL(P.NOME, '---') AS PREREQ
FROM CURSOS C
LEFT JOIN CURSOS P
ON P.IDCURSO = C.ID_PREREQ;

/* CURSORES */

CREATE DATABASE CURSORES;

USE CURSORES;

CREATE TABLE VENDEDORES(
	IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(50),
	JAN INT,
	FEV INT,
	MAR INT
);

INSERT INTO VENDEDORES VALUES(NULL,'RENAN',1231,1245,6789);
INSERT INTO VENDEDORES VALUES(NULL,'CLARA',164561,123445,62349);
INSERT INTO VENDEDORES VALUES(NULL,'LUAN',17891,97845,9789);
INSERT INTO VENDEDORES VALUES(NULL,'ANA',56771,15677,45649);
INSERT INTO VENDEDORES VALUES(NULL,'LAURA',14566,77788,63636);

SELECT * FROM VENDEDORES;

SELECT NOME, (JAN+FEV+MAR) AS TOTAL FROM VENDEDORES;

SELECT NOME, (JAN+FEV+MAR) AS TOTAL, (JAN+FEV+MAR)/3 AS MEDIA FROM VENDEDORES;

CREATE TABLE VEND_TOTAL(
	NOME VARCHAR(50),
	JAN INT,
	FEV INT,
	MAR INT,
	TOTAL INT,
	MEDIA INT
);

DELIMITER $

CREATE PROCEDURE INSEREDADOS()
BEGIN  
	DECLARE FIM INT DEFAULT 0;
	DECLARE VAR1, VAR2, VAR3, VTOTAL, VMEDIA INT;
	DECLARE VNOME VARCHAR(50);

	DECLARE REG CURSOR FOR( 
		SELECT NOME, JAN, FEV, MAR FROM VENDEDORES
	);

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET FIM = 1; 

	OPEN REG;

	REPEAT 

		FETCH REG INTO VNOME, VAR1, VAR2, VAR3;
		IF NOT FIM THEN 

			SET VTOTAL = VAR1 + VAR2 + VAR3;
			SET VMEDIA = VTOTAL / 3;

			INSERT INTO VEND_TOTAL VALUES(VNOME,VAR1,VAR2,VAR3,VTOTAL,VMEDIA);
		END IF;
	
	UNTIL FIM END REPEAT;

	CLOSE REG;

END
$

SELECT * FROM VENDEDORES;

SELECT * FROM VEND_TOTAL;

DELIMITER ;

CALL INSEREDADOS();

/* SEGUNDA E TERCEIRA FORMAS NORMAIS  */

-- PRIMEIRA FORMA NORMAL > UM CAMPO NAO PODE SER DIVISIVEL
-- UM CAMPO NAO PODE SER VETORIZADO --
-- PK CHAVE PRIMARIA --

CREATE DATABASE CONSULTORIO;

CREATE TABLE PACIENTE(
	IDPACIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	NASCIMENTO DATE
);

CREATE TABLE MEDICO(
	IDMEDICO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR(1),
	ESPECIALIDADE VARCHAR(30),
	FUNCIONARIO ENUM('S','N')
);

CREATE TABLE HOSPITAL(
	IDHOSPITAL INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	BAIRRO VARCHAR(30),
	CIDADE VARCHAR(30),
	ESTADO CHAR(2)
);

CREATE TABLE CONSULTA(
	IDCONSULTA INT PRIMARY KEY AUTO_INCREMENT,
	ID_PACIENTE INT,
	ID_MEDICO INT,
	ID_HOSPITAL INT,
	DATA DATETIME,
	DIAGNOSTICO VARCHAR(50)
);

CREATE TABLE INTERNACAO(
	IDINTERNACAO INT PRIMARY KEY AUTO_INCREMENT,
	ENTRADA DATETIME,
	QUARTO INT,
	SAIDA DATETIME,
	OBSERVACOES VARCHAR(50),
	ID_CONSULTA INT UNIQUE	
);  
						  

/* CRIANDO AS CONSTRAINTS - CORREÇÃO COD do OBJ (PK, FK) _ TABELA PERTENCENTE _ TABELA DE ONDE VEM*/

ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_PACIENTE
FOREIGN KEY(ID_PACIENTE) REFERENCES PACIENTE(IDPACIENTE);

ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_MEDICO
FOREIGN KEY(ID_MEDICO) REFERENCES MEDICO(IDMEDICO);

ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_HOSPITAL
FOREIGN KEY(ID_HOSPITAL) REFERENCES HOSPITAL(IDHOSPITAL);

ALTER TABLE INTERNACAO ADD CONSTRAINT FK_INTERNACAO_CONSULTA
FOREIGN KEY(ID_CONSULTA) REFERENCES CONSULTA(IDCONSULTA);




















/*  SQL SERVER  */

/* CONECTANDO A UM BANCO */

USE EMPRESA
GO

/*CRIACAO DE TABELAS */

CREATE TABLE ALUNO(
	IDALUNO INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(30) NOT NULL,
	SEXO CHAR(1) NOT NULL,
	NASCIMENTO DATE NOT NULL,
	EMAIL VARCHAR(30) UNIQUE
)
GO

/*CONSTRAINTS */

ALTER TABLE ALUNO
ADD CONSTRAINT CK_SEXO CHECK (SEXO IN('M','F'))
GO

/* 1 X 1 */

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY IDENTITY(100,10),
	BAIRRO VARCHAR(30),
	UF CHAR(2) NOT NULL
	CHECK (UF IN('RJ','SP','MG')),
	ID_ALUNO INT UNIQUE
)
GO

/* CRIANDO A FK */

ALTER TABLE ENDERECO ADD CONSTRAINT FK_ENDERECO_ALUNO
FOREIGN KEY(ID_ALUNO) REFERENCES ALUNO(IDALUNO)
GO

/* COMANDOS DE DESCRICAO */

/* PROCEDURES - JA CRIADAS E ARMAZENAS NO SISTEMA */

SP_COLUMNS ALUNO
GO

SP_HELP ALUNO
GO

/* INSERINDO DADOS */

INSERT INTO ALUNO VALUES('ANDRE','M','1981/12/09','ANDRE@IG.COM')
INSERT INTO ALUNO VALUES('ANA','F','1978/03/09','ANA@IG.COM')
INSERT INTO ALUNO VALUES('RUI','M','1951/07/09','RUI@IG.COM')
INSERT INTO ALUNO VALUES('JOAO','M','2002/11/09','JOAO@IG.COM')
GO

SELECT * FROM ALUNO
GO

/* ENDERECO */

INSERT INTO ENDERECO VALUES('FLAMENGO','RJ',1)
INSERT INTO ENDERECO VALUES('MORUMBI','SP',2)
INSERT INTO ENDERECO VALUES('CENTRO','MG',4)
INSERT INTO ENDERECO VALUES('CENTRO','SP',6)
GO

/* CRIANDO A TABELA TELEFONES 1 X N */
CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY IDENTITY,
	TIPO CHAR(3) NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_ALUNO INT,
	CHECK (TIPO IN ('RES','COM','CEL'))
)
GO


INSERT INTO TELEFONE VALUES('CEL','7899889',1)
INSERT INTO TELEFONE VALUES('RES','4325444',1)
INSERT INTO TELEFONE VALUES('COM','4354354',2)
INSERT INTO TELEFONE VALUES('CEL','2344556',2)
GO

SELECT * FROM ALUNO
GO

/* PEGAR DATA ATUAL */

SELECT GETDATE()
GO

/* CLAUSULA AMBIGUA */

SELECT A.NOME, T.TIPO, T.NUMERO, E.BAIRRO, E.UF
FROM ALUNO A
INNER JOIN TELEFONE T
ON A.IDALUNO = T.ID_ALUNO
INNER JOIN ENDERECO E
ON A.IDALUNO = E.ID_ALUNO
GO

SELECT A.NOME, T.TIPO, T.NUMERO, E.BAIRRO, E.UF
FROM ALUNO A LEFT JOIN TELEFONE T
ON A.IDALUNO = T.ID_ALUNO
INNER JOIN ENDERECO E
ON A.IDALUNO = E.ID_ALUNO
GO

/* IFNULL */

SELECT  A.NOME, 
		ISNULL(T.TIPO, 'SEM') AS "TIPO", 
		ISNULL(T.NUMERO,'NUMERO') AS "TELEFONE", 
		E.BAIRRO, 
		E.UF
FROM ALUNO A LEFT JOIN TELEFONE T
ON A.IDALUNO = T.ID_ALUNO
INNER JOIN ENDERECO E
ON A.IDALUNO = E.ID_ALUNO
GO

/* DATAS */

SELECT * FROM ALUNO
GO

SELECT NOME, NASCIMENTO
FROM ALUNO
GO

/* DATEDIFF - CALCULA A DIFERENÇA ENTRE 2 DATAS 
FUNCAO GETDATE() TRAZ DIA E HORA
*/

SELECT NOME, GETDATE() AS DIA_HORA FROM ALUNO
GO

/* 1 PASSO */

SELECT NOME, DATEDIFF(DAY,NASCIMENTO,GETDATE()) 
FROM ALUNO
GO

/*2 PASSO */

SELECT NOME, DATEDIFF(DAY,NASCIMENTO,GETDATE()) AS "IDADE"
FROM ALUNO
GO

SELECT NOME, DATEDIFF(DAY,NASCIMENTO,GETDATE()) IDADE
FROM ALUNO
GO

/* 3 PASSO - RETORNO EM INTEIRO + OPER MATEMATICA */

SELECT NOME, (DATEDIFF(DAY,NASCIMENTO,GETDATE())/365) AS "IDADE"
FROM ALUNO
GO

SELECT NOME, (DATEDIFF(MONTH,NASCIMENTO,GETDATE())/12) AS "IDADE"
FROM ALUNO
GO

SELECT NOME, DATEDIFF(YEAR,NASCIMENTO,GETDATE()) AS "IDADE"
FROM ALUNO
GO

/* DATENAME - TRAZ O NOME DA PARTE DA DATA EM QUESTAO - STRING */

SELECT NOME, DATENAME(MONTH, NASCIMENTO)
FROM ALUNO
GO

SELECT NOME, DATENAME(YEAR, NASCIMENTO)
FROM ALUNO
GO

SELECT NOME, DATENAME(WEEKDAY, NASCIMENTO)
FROM ALUNO
GO

/* DATEPART - POREM O RETORNO É UM INTEIRO */

SELECT NOME, DATEPART(MONTH,NASCIMENTO), DATENAME(MONTH, NASCIMENTO)
FROM ALUNO
GO

/* DATEADD - RETORNA UMA DATA SOMANDO A OUTRA DATA */

SELECT DATEADD(DAY,365,GETDATE())

SELECT DATEADD(YEAR,10,GETDATE())

/* CONVERSAO DE DADOS */

SELECT 1 + '1'
GO

SELECT '1' + '1'
GO

SELECT 'CURSO DE BANCO DE DADOS' + '1'
GO

SELECT 'CURSO DE BANCO DE DADOS' + 1
GO

/* FUNCOES DE CONVERSAO DE DADOS */

SELECT CAST('1' AS INT) + CAST('1' AS INT)
GO

/* CONVERSAO E CONCATENACAO 
https://msdn.microsoft.com/en-us/library/ms191530.aspx
*/

SELECT NOME,
NASCIMENTO
FROM ALUNO
GO

SELECT NOME, NASCIMENTO
FROM ALUNO 
GO

SELECT NOME, DAY(NASCIMENTO)
FROM ALUNO
GO

SELECT NOME, MONTH(NASCIMENTO)
FROM ALUNO
GO

SELECT NOME, YEAR(NASCIMENTO)
FROM ALUNO
GO


SELECT NOME,
DAY(NASCIMENTO) + '/' + MONTH(NASCIMENTO) + '/' + YEAR(NASCIMENTO)
FROM ALUNO
GO

/*EXERCICIO*/

SELECT NOME,
DAY(NASCIMENTO) + '/' + 
MONTH(NASCIMENTO) + '/' + 
YEAR(NASCIMENTO)
FROM ALUNO
GO

/* CORRECAO */

SELECT NOME,
CAST(DAY(NASCIMENTO) AS VARCHAR) + '/' + 
CAST(MONTH(NASCIMENTO) AS VARCHAR) + '/' + 
CAST(YEAR(NASCIMENTO) AS VARCHAR) AS "NASCIMENTO"
FROM ALUNO
GO

/*CHARINDEX - RETORNA UM INTEIRO 
CONTAGEM DEFAULT - INICIA EM 01
*/

SELECT NOME, CHARINDEX('A',NOME) AS INDICE
FROM ALUNO
GO 

SELECT NOME, CHARINDEX('A',NOME,2) AS INDICE
FROM ALUNO
GO 

/* BULK INSERT - IMPORTACAO DE ARQUIVOS */

CREATE TABLE LANCAMENTO_CONTABIL(
	CONTA INT,
	VALOR INT,
	DEB_CRED CHAR(1)
)
GO

SELECT * FROM LANCAMENTO_CONTABIL
GO	

/* \t = TAB */

BULK INSERT LANCAMENTO_CONTABIL
FROM 'C:\ARQUIVOS\CONTAS.txt'
WITH
(
	FIRSTROW = 2,
	DATAFILETYPE = 'char',
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n'

)

select * from LANCAMENTO_CONTABIL

delete from LANCAMENTO_CONTABIL

/* DESAFIO DO SALDO 
QUERY QUE TRAGA O NUMERO DA CONTA
SALDO - DEVEDOR OU CREDOR */

SELECT CONTA, VALOR, DEB_CRED,
CHARINDEX('D',DEB_CRED) AS DEBITO,
CHARINDEX('C',DEB_CRED) AS CREDITO,
CHARINDEX('C',DEB_CRED) * 2 - 1 AS MULTIPLICADOR
FROM LANCAMENTO_CONTABIL
GO

SELECT CONTA,
SUM(VALOR * (CHARINDEX('C',DEB_CRED) * 2 - 1)) AS SALDO
FROM LANCAMENTO_CONTABIL
GROUP BY CONTA
GO

/* TRIGGERS */


CREATE TABLE PRODUTOS(
	IDPRODUTO INT IDENTITY PRIMARY KEY,
	NOME VARCHAR(50) NOT NULL,
	CATEGORIA VARCHAR(30) NOT NULL,
	PRECO NUMERIC(10,2) NOT NULL
)
GO

CREATE TABLE HISTORICO(
	IDOPERACAO INT PRIMARY KEY IDENTITY,
	PRODUTO VARCHAR(50) NOT NULL,
	CATEGORIA VARCHAR(30) NOT NULL,
	PRECOANTIGO NUMERIC(10,2) NOT NULL,
	PRECONOVO NUMERIC(10,2) NOT NULL,
	DATA DATETIME,
	USUARIO VARCHAR(30),
	MENSAGEM VARCHAR(100)
)
GO

INSERT INTO PRODUTOS VALUES('LIVRO SQL SERVER','LIVROS',98.00)
INSERT INTO PRODUTOS VALUES('LIVRO ORACLE','LIVROS',50.00)
INSERT INTO PRODUTOS VALUES('LICENÇA POWERCENTER','SOFTWARES',45000.00)
INSERT INTO PRODUTOS VALUES('NOTEBOOK I7','COMPUTADORES',3150.00)
INSERT INTO PRODUTOS VALUES('LIVRO BUSINESS INTELLIGENCE','LIVROS',90.00)
GO

SELECT * FROM PRODUTOS
SELECT * FROM HISTORICO
GO

/* VERIFICANDO O USUARIO */

SELECT SUSER_NAME()
GO

/* TRIGGER DE DADOS - DATA MANIPULATION LANGUAGE */

CREATE TRIGGER TRG_ATUALIZA_PRECO
ON DBO.PRODUTOS
FOR UPDATE
AS
		DECLARE @IDPRODUTO INT
		DECLARE @PRODUTO VARCHAR(30)
		DECLARE @CATEGORIA VARCHAR(10)
		DECLARE @PRECO NUMERIC(10,2)
		DECLARE @PRECONOVO NUMERIC(10,2)
		DECLARE @DATA DATETIME
		DECLARE @USUARIO VARCHAR(30)
		DECLARE @ACAO VARCHAR(100)

		--PRIMEIRO BLOCO
		SELECT @IDPRODUTO = IDPRODUTO FROM inserted
		SELECT @PRODUTO = NOME FROM inserted
		SELECT @CATEGORIA = CATEGORIA FROM inserted
		SELECT @PRECO = PRECO FROM deleted
		SELECT @PRECONOVO = PRECO FROM inserted

		--SEGUNDO BLOCO
		SET @DATA = GETDATE()
		SET @USUARIO = SUSER_NAME()
		SET @ACAO = 'VALOR INSERIDO PELA TRIGGER TRG_ATUALIZA_PRECO'

		INSERT INTO HISTORICO
		(PRODUTO,CATEGORIA,PRECOANTIGO,PRECONOVO,DATA,USUARIO,MENSAGEM)
		VALUES
		(@PRODUTO,@CATEGORIA,@PRECO,@PRECONOVO,@DATA,@USUARIO,@ACAO)

		PRINT 'TRIGGER EXECUTADA COM SUCESSO'
GO

/* EXECUTANDO UM UPDATE */

UPDATE PRODUTOS SET PRECO = 100.00
WHERE IDPRODUTO = 1
GO

SELECT * FROM PRODUTOS
SELECT * FROM HISTORICO
GO

UPDATE PRODUTOS SET NOME = 'LIVRO C#'
WHERE IDPRODUTO = 1
GO

/* PROGRAMANDO TRIGGER EM UMA COLUNA */

DROP TRIGGER TRG_ATUALIZA_PRECO
GO

CREATE TRIGGER TRG_ATUALIZA_PRECO
ON DBO.PRODUTOS
FOR UPDATE AS
IF UPDATE(PRECO)
BEGIN

		DECLARE @IDPRODUTO INT
		DECLARE @PRODUTO VARCHAR(30)
		DECLARE @CATEGORIA VARCHAR(10)
		DECLARE @PRECO NUMERIC(10,2)
		DECLARE @PRECONOVO NUMERIC(10,2)
		DECLARE @DATA DATETIME
		DECLARE @USUARIO VARCHAR(30)
		DECLARE @ACAO VARCHAR(100)

		--PRIMEIRO BLOCO
		SELECT @IDPRODUTO = IDPRODUTO FROM inserted
		SELECT @PRODUTO = NOME FROM inserted
		SELECT @CATEGORIA = CATEGORIA FROM inserted
		SELECT @PRECO = PRECO FROM deleted
		SELECT @PRECONOVO = PRECO FROM inserted

		--SEGUNDO BLOCO
		SET @DATA = GETDATE()
		SET @USUARIO = SUSER_NAME()
		SET @ACAO = 'VALOR INSERIDO PELA TRIGGER TRG_ATUALIZA_PRECO'

		INSERT INTO HISTORICO
		(PRODUTO,CATEGORIA,PRECOANTIGO,PRECONOVO,DATA,USUARIO,MENSAGEM)
		VALUES
		(@PRODUTO,@CATEGORIA,@PRECO,@PRECONOVO,@DATA,@USUARIO,@ACAO)

		PRINT 'TRIGGER EXECUTADA COM SUCESSO'
END
GO

UPDATE PRODUTOS SET PRECO = 300.00
WHERE IDPRODUTO = 2
GO

SELECT * FROM HISTORICO

UPDATE PRODUTOS SET NOME = 'LIVRO JAVA'
WHERE IDPRODUTO = 2
GO

/* VARIAVEIS COM SELECT */

SELECT 10 + 10
GO

CREATE TABLE RESULTADO(
	IDRESULTADO INT PRIMARY KEY IDENTITY,
	RESULTADO INT
)
GO

INSERT INTO RESULTADO VALUES((SELECT 10 + 10))
GO

SELECT * FROM RESULTADO
GO

/* ATRIBUINDO SELECTS A VARIAVEIS - ANONIMO */

DECLARE
		@RESULTADO INT
		SET @RESULTADO = (SELECT 50 + 50)
		INSERT INTO RESULTADO VALUES(@RESULTADO)
		GO
		


DECLARE
		@RESULTADO INT
		SET @RESULTADO = (SELECT 50 + 50)
		INSERT INTO RESULTADO VALUES(@RESULTADO)
		PRINT 'VALOR INSERIDO NA TABELA: ' + CAST(@RESULTADO AS VARCHAR)
		GO
		

/* TRIGGER UPDATE */

CREATE TABLE EMPREGADO(
	IDEMP INT PRIMARY KEY,
	NOME VARCHAR(30),
	SALARIO MONEY,
	IDGERENTE INT
)
GO

ALTER TABLE EMPREGADO ADD CONSTRAINT FK_GERENTE
FOREIGN KEY(IDGERENTE) REFERENCES EMPREGADO(IDEMP)
GO


INSERT INTO EMPREGADO VALUES(1,'CLARA',5000.00,NULL)
INSERT INTO EMPREGADO VALUES(2,'CELIA',4000.00,1)
INSERT INTO EMPREGADO VALUES(3,'JOAO',4000.00,1)
GO

CREATE TABLE HIST_SALARIO(
	IDEMPREGADO INT,
	ANTIGOSAL MONEY,
	NOVOSAL MONEY,
	DATA DATETIME
)
GO

CREATE TRIGGER TG_SALARIO
ON DBO.EMPREGADO
FOR UPDATE AS
IF UPDATE(SALARIO)
BEGIN
	 INSERT INTO HIST_SALARIO
	 (IDEMPREGADO,ANTIGOSAL,NOVOSAL,DATA)
	 SELECT D.IDEMP,D.SALARIO,I.SALARIO,GETDATE()
	 FROM DELETED D, inserted I
	 WHERE D.IDEMP = I.IDEMP
END
GO

UPDATE EMPREGADO SET SALARIO = SALARIO * 1.1
GO

SELECT * FROM EMPREGADO
GO

SELECT * FROM HIST_SALARIO
GO

/* SALARIO ANTIGO, NOVO, DATA E NOME DO EMPREGO */

CREATE TABLE SALARIO_RANGE(
	MINSAL MONEY,
	MAXSAL MONEY
)
GO

INSERT INTO SALARIO_RANGE VALUES(3000.00,6000.00)
GO

CREATE TRIGGER TG_RANGE
ON DBO.EMPREGADO
FOR INSERT,UPDATE
AS 
	DECLARE
		@MINSAL MONEY,
		@MAXSAL MONEY,
		@ATUALSAL MONEY

	SELECT @MINSAL = MINSAL, @MAXSAL = MAXSAL FROM SALARIO_RANGE

	SELECT @ATUALSAL = I.SALARIO
	FROM INSERTED I

	IF(@ATUALSAL < @MINSAL)
	BEGIN
			RAISERROR('SALARIO MENOR QUE O PISO',16,1)
			ROLLBACK TRANSACTION
	END

	IF(@ATUALSAL > @MAXSAL)
	BEGIN
			RAISERROR('SALARIO MAIOR QUE O TETO',16,1)
			ROLLBACK TRANSACTION
	END
GO

UPDATE EMPREGADO SET SALARIO = 9000.00
WHERE IDEMP = 1
GO

UPDATE EMPREGADO SET SALARIO = 1000.00
WHERE IDEMP = 1
GO

/* VERIFICANDO O TEXTO DE NA TRIGGER */

SP_HELPTEXT TG_RANGE
GO

/* PROCEDURES */

--SP_ STORAGE PROCEDURE

CREATE TABLE PESSOA(
	IDPESSOA INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(30) NOT NULL,
	SEXO CHAR(1) NOT NULL CHECK (SEXO IN('M','F')), --ENUM
	MASCIMENTO DATE NOT NULL
)
GO

CREATE TABLE TELEFONE(
	IDTELEFONE INT NOT NULL IDENTITY,
	TIPO CHAR(3) NOT NULL CHECK ( TIPO IN('CEL','COM')),
	NUMERO CHAR(10) NOT NULL,
	ID_PESSOA INT
)
GO

ALTER TABLE TELEFONE ADD CONSTRAINT FK_TELEFONE_PESSOA
FOREIGN KEY(ID_PESSOA) REFERENCES PESSOA(IDPESSOA)
ON DELETE CASCADE
GO

INSERT INTO PESSOA VALUES('ANTONIO','M','1981-02-13')
INSERT INTO PESSOA VALUES('DANIEL','M','1985-03-18')
INSERT INTO PESSOA VALUES('CLEIDE','F','1979-10-13')
INSERT INTO PESSOA VALUES('MAFRA','M','1981-02-13')

SELECT @@IDENTITY -- GUARDA O ULTIMO IDENTITY INSERIDO NA SEÇÃO
GO

SELECT * FROM PESSOA

INSERT INTO TELEFONE VALUES('CEL','9879008',1)
INSERT INTO TELEFONE VALUES('COM','8757909',1)
INSERT INTO TELEFONE VALUES('CEL','9875890',2)
INSERT INTO TELEFONE VALUES('CEL','9347689',2)
INSERT INTO TELEFONE VALUES('COM','2998689',3)
INSERT INTO TELEFONE VALUES('COM','2098978',2)
INSERT INTO TELEFONE VALUES('CEL','9008679',3)
GO
/* CRIANDO A PROCEDURE */

CREATE PROC SOMA
AS
	SELECT 10 + 10 AS SOMA
GO

/* EXECUÇÃO DA PROCEDURE */

SOMA

EXEC SOMA
GO

/* DINAMICAS - COM PARAMETROS */

CREATE PROC CONTA @NUM1 INT, @NUM2 INT
AS
	SELECT @NUM1 + @NUM2 AS RESULTADO
GO

/* EXECUTANDO */

EXEC CONTA 90, 78
GO

/* APAGANDO A PROCEDURE */

DROP PROC CONTA
GO

/* PROCEDURES EM TABELAS */

SELECT NOME, NUMERO
FROM PESSOA
INNER JOIN TELEFONE
ON IDPESSOA = ID_PESSOA
WHERE TIPO = 'CEL'
GO

/* TRAZER OS TELEFONES DE ACORDO COM O TIPO PASSADO */
CREATE PROC TELEFONES @TIPO CHAR(3)
AS
	SELECT NOME, NUMERO
	FROM PESSOA
	INNER JOIN TELEFONE
	ON IDPESSOA = ID_PESSOA
	WHERE TIPO = @TIPO
GO

EXEC TELEFONES 'CEL'
GO

EXEC TELEFONES 'COM'
GO

/* PARAMETROS DE OUTPUT */ 

SELECT TIPO, COUNT(*) AS QUANTIDADE
FROM TELEFONE
GROUP BY TIPO
GO

/* CRIANDO PROCEDURE COM PARAMETROS DE ENTRADA E PARAMETRO DE SAIDA */

CREATE PROCEDURE GETTIPO @TIPO CHAR(3), @CONTADOR INT OUTPUT
AS
	SELECT @CONTADOR = COUNT(*)
	FROM TELEFONE
	WHERE TIPO = @TIPO
	GO

/* EXECUCAO DA PROC COM PARAMETRO DE SAIDA */

/* TRANSACTION SQL -> LINGUAGEM QUE O SQL SERVER TRABALHA */

DECLARE @SAIDA INT
EXEC GETTIPO @TIPO = 'CEL', @CONTADOR = @SAIDA OUTPUT
SELECT @SAIDA
GO

DECLARE @SAIDA INT
EXEC GETTIPO 'CEL', @SAIDA OUTPUT
SELECT @SAIDA
GO

/* PROCEDURE DE CADASTRO */

CREATE PROC CADASTRO @NOME VARCHAR(30), @SEXO CHAR(1), @NASCIMENTO DATE,
@TIPO CHAR(3), @NUMERO VARCHAR(10)
AS
	DECLARE @FK INT

	INSERT INTO PESSOA VALUES(@NOME,@SEXO,@NASCIMENTO) --GERAR UM ID

	SET @FK = (SELECT IDPESSOA FROM PESSOA WHERE IDPESSOA
	= @@IDENTITY)

	INSERT INTO TELEFONE VALUES(@TIPO,@NUMERO,@FK)
GO

CADASTRO 'JORGE','M','1981-01-01','CEL','97273822'  
GO

SELECT PESSOA.*, TELEFONE.*
FROM PESSOA
INNER JOIN TELEFONE
ON IDPESSOA = ID_PESSOA
GO

/* TSQL É UM BLOCO DE LINGUAGEM DE PROGRAMACAO.
PROGRAMAS SAO UNIDADES QUE PODEM SER CHAMADAS DE BLOCOS
ANÔNIMOS. BLOCOS ANONIMOS NAO RECEBEM NOME, POIS
NAO SAO SALVOS NO BANCO. CRIAMOS BLOCOS ANONIMOS QUANDO
IREMOS EXECUTA-LOS UMA SO VEZ OU TESTAR ALGO */

/* BLOCO DE EXECUÇÃO */

BEGIN
		PRINT 'PRIMEIRO BLOCO'
END
GO

/* BLOCOS DE ATRIBUICAO DE VARIAVEIS */

DECLARE
		@CONTADOR INT
BEGIN
		SET @CONTADOR = 5
		PRINT @CONTADOR
END
GO

/* NO SQL SERVER CADA COLUNA, VARIAVEL LOCAL, EXPRESSAO E PARAMETRO TEM UM TIPO. */

DECLARE

		@V_NUMERO NUMERIC(10,2) = 100.52,
		@V_DATA DATETIME = '20170207'
BEGIN
		PRINT 'VALOR NUMERICO: ' + CAST(@V_NUMERO AS VARCHAR)
		PRINT 'VALOR NUMERICO: ' +CONVERT(VARCHAR, @V_NUMERO)
		PRINT 'VALOR DE DATA: ' + CAST(@V_DATA AS VARCHAR)
		PRINT 'VALOR DE DATA: ' + CONVERT(VARCHAR, @V_DATA, 121)
		PRINT 'VALOR DE DATA: ' + CONVERT(VARCHAR, @V_DATA, 120)
		PRINT 'VALOR DE DATA: ' + CONVERT(VARCHAR, @V_DATA, 105)
END
GO

/* ATRIBUINDO RESULTADOS A UMA VARIAVEL */

CREATE TABLE CARROS(
	CARRO VARCHAR(20),
	FABRICANTE VARCHAR(30)
)
GO

INSERT INTO CARROS VALUES('KA','FORD')
INSERT INTO CARROS VALUES('FIESTA','FORD')
INSERT INTO CARROS VALUES('PRISMA','FORD')
INSERT INTO CARROS VALUES('CLIO','RENAULT')
INSERT INTO CARROS VALUES('SANDERO','RENAULT')
INSERT INTO CARROS VALUES('CHEVETE','CHEVROLET')
INSERT INTO CARROS VALUES('OMEGA','CHEVROLET')
INSERT INTO CARROS VALUES('PALIO','FIAT')
INSERT INTO CARROS VALUES('DOBLO','FIAT')
INSERT INTO CARROS VALUES('UNO','FIAT')
INSERT INTO CARROS VALUES('GOL','VOLKSWAGEN')
GO

DECLARE 
		@V_CONT_FORD INT,
		@V_CONT_FIAT INT
BEGIN
		--METODO 1 - O SELECT PRECISA RETORNAR UMA SIMPLES COLUNA
		--E UM SO RESULTADO
		SET @V_CONT_FORD = (SELECT COUNT(*) FROM CARROS
		WHERE FABRICANTE = 'FORD')
		
		PRINT 'QUANTIDADE FORD: ' + CAST(@V_CONT_FORD AS VARCHAR)

		--METODO 2
		SELECT @V_CONT_FIAT = COUNT(*) FROM CARROS WHERE FABRICANTE = 'FIAT'

		PRINT 'QUANTIDADE FIAT: ' + CONVERT(VARCHAR, @V_CONT_FIAT)

END
GO





/* BLOCOS IF E ELSE 
BLOCO NOMEADO - PROCEDURES
*/

DECLARE
		@NUMERO INT = 6 --DINAMICO
BEGIN
		IF @NUMERO = 5 -- EXPRESSAO BOOLEANA - TRUE
			PRINT 'O VALOR É VERDADEIRO'
		ELSE
			PRINT 'O VALOR É FALSO'
END
GO

/* CASE */

DECLARE
		@CONTADOR INT
BEGIN
		SELECT -- O CASE REPRESENTA UMA COLUNA
		CASE
			WHEN FABRICANTE = 'FIAT' THEN 'FAIXA 1'
			WHEN FABRICANTE = 'CHEVROLET' THEN 'FAIXA 2'
			ELSE 'OUTRAS FAIXAS'
		END AS "INFORMACOES",
		*
		FROM CARROS
END
GO

		SELECT -- O CASE REPRESENTA UMA COLUNA
		CASE
			WHEN FABRICANTE = 'FIAT' THEN 'FAIXA 1'
			WHEN FABRICANTE = 'CHEVROLET' THEN 'FAIXA 2'
			ELSE 'OUTRAS FAIXAS'
		END AS "INFORMACOES",
		*
		FROM CARROS





































