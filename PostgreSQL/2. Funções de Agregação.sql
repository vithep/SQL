/*FUNÇOES DE AGREGACAO*/

/*Query simples*/

select * from funcionarios;
select * from departamentos;
/* Contando o numero de ocorrencias */

select count(*) from funcionarios;
select count(*) from departamentos;
select count(*) from localizacao;

/* Agrupando por sexo com group by */

select count(*) from funcionarios
group by sexo;

/* colocando o nome da coluna */

select sexo, count(*) as "Quantidade" from funcionarios
group by sexo;


/* mostrando o numero de funcionarios em cada departamento */

select departamento, count(*)
from funcionarios
group by departamento;


/* Exibindo o maximo de salarios - 149929 */

select max(salario) as "SALARIO MAXIMO" from funcionarios;

/* Exibindo o minimo de salarios - 40138 */

select min(salario) as "SALARIO MENOR" from funcionarios;

/* Exibindo o máximo e o mínimo juntos */

select min(salario) as "SALARIO MINIMO", max(salario) as "SALARIO MAXIMO"
from funcionarios;

/* Exibindo o máximo e o mínimo de cada departamento */

select departamento, min(salario), max(salario)
from funcionarios
group by departamento;

/* Exibindo o máximo e o mínimo por sexo */

select sexo, min(salario), max(salario)
from funcionarios
group by sexo;

/*Estatisticas*/

/* Mostrando uma quantidade limitada de linhas */
select * from funcionarios
limit 10;


/* Qual o gasto total de salario pago pela empresa? */
select sum(salario) from funcionarios;


/* Qual o montante total que cada departamento recebe de salario */
select departamento, sum(salario)
from funcionarios
group by departamento;


/* Por departamento, qual o total e a média paga para
os funcionarios? */

select sum(salario), avg(salario)
from funcionarios;

select departamento, sum(salario), avg(salario)
from funcionarios
group by departamento;

/*ordenando*/
select departamento, sum(salario), avg(salario)
from funcionarios
group by departamento
order by 3;

select departamento, sum(salario), avg(salario)
from funcionarios
group by departamento
order by 3 ASC;

select departamento, sum(salario), avg(salario)
from funcionarios
group by departamento
order by 3 DESC;