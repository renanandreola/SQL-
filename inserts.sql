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
