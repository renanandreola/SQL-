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