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