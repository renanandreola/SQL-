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