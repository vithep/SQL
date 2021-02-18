/* Modelagem Banco de Dados x Data Science */

/* Banco de Dados -> 1,2 e 3 Formas normais
Evitam reduncancia, consequentemente poupam espaço em disco.
Consomem muito processamento em função de Joins. Queries lentas

Data Science e B.I -> Focam em agregaçoes e performance. Não se 
preocupam com espaço em disco. Em B.I, modelagem mínima (DW)
em Data Science, preferencialmente modelagem Colunar */

/* O servidor de maquinas gerou um arquivo de log CSV.
Vamos importá-lo e analisa-lo dentro do nosso banco */

/*Importando CSV*/

CREATE TABLE MAQUINAS(
	MAQUINA VARCHAR(20),
	DIA INT,
	QTD NUMERIC(10,2)
);

C:\Scripts SQL DataScience

COPY MAQUINAS
FROM 'C:\Scripts SQL DataScience\lOGmAQUINAS.csv' 
DELIMITER ','
CSV HEADER;

SELECT * FROM MAQUINAS;

/*QUAL A MEDIA DE CADA MAQUINA */

SELECT MAQUINA, AVG(QTD) AS MEDIA_QTD
FROM MAQUINAS
GROUP BY MAQUINA
ORDER BY 2 DESC;

/*ARREDONDANDO */

ROUND(COLUNA,2)

SELECT MAQUINA, ROUND(AVG(QTD),2) AS MEDIA_QTD
FROM MAQUINAS
GROUP BY MAQUINA
ORDER BY 2 DESC;

/* QUAL A MODA DAS QUANTIDADES */

select maquina, qtd, count(*) as moda
from maquinas
group by maquina, qtd
order by 3 desc


/* QUAL A MODA DAS QUANTIDADES DE CADA MAQUINA */

SELECT MAQUINA, QTD, COUNT(*) FROM MAQUINAS
WHERE MAQUINA = 'Maquina 01'
GROUP BY MAQUINA, QTD
ORDER BY 3 DESC
LIMIT 1;

SELECT MAQUINA, QTD, COUNT(*) FROM MAQUINAS
WHERE MAQUINA = 'Maquina 02'
GROUP BY MAQUINA, QTD
ORDER BY 3 DESC
LIMIT 1;


SELECT MAQUINA, QTD, COUNT(*) FROM MAQUINAS
WHERE MAQUINA = 'Maquina 03'
GROUP BY MAQUINA, QTD
ORDER BY 3 DESC
LIMIT 1;

/* moda do dataset inteiro */

SELECT  QTD, COUNT(*) AS MODA
FROM MAQUINAS
GROUP BY QTD
ORDER BY 2 DESC;


/* QUAL O MAXIMO E MINIMO E AMPLITUDE DE CADA MAQUINA  */

SELECT MAQUINA,
	   MAX(QTD) AS MAXIMO,
	   MIN(QTD) AS MINIMO,
	   MAX(QTD) - MIN(QTD) AS AMPLITUDE
	   FROM MAQUINAS
	   GROUP BY MAQUINA
	   ORDER BY 4 DESC;
		

/* ACRESCENTE A MEDIA AO RELATORIO */

SELECT MAQUINA,
	   ROUND(AVG(QTD),2) AS MEDIA,
	   MAX(QTD) AS MAXIMO,
	   MIN(QTD) AS MINIMO,
	   MAX(QTD) - MIN(QTD) AS AMPLITUDE
	   FROM MAQUINAS
	   GROUP BY MAQUINA
	   ORDER BY 4 DESC;


/* DESVIO PADRAO E VARIANCIA */

STDDEV_POP(coluna)
VAR_POP(coluna)

SELECT MAQUINA,
	   ROUND(AVG(QTD),2) AS MEDIA,
	   MAX(QTD) AS MAXIMO,
	   MIN(QTD) AS MINIMO,
	   MAX(QTD) - MIN(QTD) AS AMPLITUDE,
	   ROUND(STDDEV_POP(QTD),2) AS DESV_PAD,
	   ROUND(VAR_POP(QTD),2) AS VARIANCIA
	   FROM MAQUINAS
	   GROUP BY MAQUINA
	   ORDER BY 4 DESC;