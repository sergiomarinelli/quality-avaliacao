-- Criação do banco de dados (schema)
CREATE DATABASE IF NOT EXISTS QUALITY_TESTE_SERGIO;

-- Seleção do banco de dados para uso
USE QUALITY_TESTE_SERGIO;

-- Criação das tabelas

-- Criação da tabela PROPRIEDADE_AGRICOLA
CREATE TABLE IF NOT EXISTS PROPRIEDADE_AGRICOLA (
    PROP_CODIGO INT(4) AUTO_INCREMENT PRIMARY KEY,       -- Código da propriedade
    PROP_DESCRICAO VARCHAR(30),                          -- Descrição da propriedade
    PROP_AREA DECIMAL(6,2)                               -- Área da propriedade
);

-- Criação da tabela TALHAO
CREATE TABLE IF NOT EXISTS TALHAO (
    TALH_SAFRA INT(4),                                  	 					-- Safra
    TALH_CODIGO_PROP INT(4),                            	 					-- Código da propriedade (FK)
    TALH_CODIGO INT(5),                                 	 					-- Código do talhão
    PRIMARY KEY (TALH_SAFRA, TALH_CODIGO_PROP, TALH_CODIGO), 					-- Chave primária composta
    FOREIGN KEY (TALH_CODIGO_PROP) REFERENCES PROPRIEDADE_AGRICOLA(PROP_CODIGO) -- Chave estrangeira
);

-- Inserção de dados de exemplo na tabela PROPRIEDADE_AGRICOLA
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade A', 125.50);
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade B', 2130.75);
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade C', 1524.00);
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade D', 1425.50);
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade E', 2140.75);
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade F', 124.00);
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade G', 1225.50);
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade H', 210.75);
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade I', 1424.00);
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade J', 1625.50);
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade K', 2510.75);
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade L', 1244.00);
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade M', 1225.50);
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade N', 2130.75);
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade O', 1524.00);
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade P', 1245.50);
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade Q', 210.75);
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade R', 624.00);
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade S', 124.00);
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade W', 224.00);
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade X', 424.00);
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade Y', 123.00);
INSERT INTO PROPRIEDADE_AGRICOLA (PROP_DESCRICAO, PROP_AREA) VALUES ('Propriedade Z', 124.00);

-- Inserção de dados de exemplo na tabela TALHAO
INSERT INTO TALHAO (TALH_SAFRA, TALH_CODIGO_PROP, TALH_CODIGO) VALUES (2014, 1, 1);
INSERT INTO TALHAO (TALH_SAFRA, TALH_CODIGO_PROP, TALH_CODIGO) VALUES (2021, 1, 2);
INSERT INTO TALHAO (TALH_SAFRA, TALH_CODIGO_PROP, TALH_CODIGO) VALUES (2022, 1, 2);
INSERT INTO TALHAO (TALH_SAFRA, TALH_CODIGO_PROP, TALH_CODIGO) VALUES (2022, 20, 4);
INSERT INTO TALHAO (TALH_SAFRA, TALH_CODIGO_PROP, TALH_CODIGO) VALUES (2022, 20, 5);
INSERT INTO TALHAO (TALH_SAFRA, TALH_CODIGO_PROP, TALH_CODIGO) VALUES (2022, 20, 6);
INSERT INTO TALHAO (TALH_SAFRA, TALH_CODIGO_PROP, TALH_CODIGO) VALUES (2022, 20, 5);
INSERT INTO TALHAO (TALH_SAFRA, TALH_CODIGO_PROP, TALH_CODIGO) VALUES (2022, 20, 5);
INSERT INTO TALHAO (TALH_SAFRA, TALH_CODIGO_PROP, TALH_CODIGO) VALUES (2022, 20, 6);
INSERT INTO TALHAO (TALH_SAFRA, TALH_CODIGO_PROP, TALH_CODIGO) VALUES (2023, 3, 10);
INSERT INTO TALHAO (TALH_SAFRA, TALH_CODIGO_PROP, TALH_CODIGO) VALUES (2023, 3, 15);
INSERT INTO TALHAO (TALH_SAFRA, TALH_CODIGO_PROP, TALH_CODIGO) VALUES (2023, 3, 20);
INSERT INTO TALHAO (TALH_SAFRA, TALH_CODIGO_PROP, TALH_CODIGO) VALUES (2023, 5, 10);
INSERT INTO TALHAO (TALH_SAFRA, TALH_CODIGO_PROP, TALH_CODIGO) VALUES (2023, 5, 15);
INSERT INTO TALHAO (TALH_SAFRA, TALH_CODIGO_PROP, TALH_CODIGO) VALUES (2023, 5, 20);

-- Consultas SQL

-- (a): Retorna todos os talhões da propriedade 20 na safra 2022 ordenada pelo código do talhão
SELECT TALH_CODIGO, TALH_SAFRA, TALH_CODIGO_PROP
FROM TALHAO
WHERE TALH_CODIGO_PROP = 20
  AND TALH_SAFRA = 2022
ORDER BY TALH_CODIGO;

-- (b): Mostra a soma das áreas de todas as propriedades
SELECT SUM(PROP_AREA) AS TOTAL_AREA
FROM PROPRIEDADE_AGRICOLA;

-- (c): Retorna todos os talhões com código maior que 15 na safra 2023 e da propriedade 3, ordenada pelo código do talhão
SELECT TALH_CODIGO, TALH_SAFRA, TALH_CODIGO_PROP
FROM TALHAO
WHERE TALH_CODIGO > 15
  AND TALH_SAFRA = 2023
  AND TALH_CODIGO_PROP = 5
ORDER BY TALH_CODIGO;

-- (d): Retorna quantos talhões tem na safra 2021
SELECT COUNT(*) AS QUANTIDADE_TALHAO
FROM TALHAO
WHERE TALH_SAFRA = 2021;

-- (e): Retorna quantos talhões a propriedade 1 tem na safra 2022
SELECT COUNT(*) AS QUANTIDADE_TALHAO
FROM TALHAO
WHERE TALH_CODIGO_PROP = 1
  AND TALH_SAFRA = 2022;
