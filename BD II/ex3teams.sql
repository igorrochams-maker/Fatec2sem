/*

Seleção de tabela com intersecção (chave estrangeira) *de acordo com a primeira tabela citada (Puxando dados de setores com base nos funcionários)

Select c.nome_cliente, p.num_pedido
from cliente c
left outer join pedido p on c.cod_cliente = p.cod_cliente
^^^^^^^^^^^^^^^

Seleção sem a intersecção (!chave estrangeira) *de acordo com a primeira tabela citada (Puxando dados de setores com base nos funcionários)

Select c.nome_cliente, p.num_pedido
from cliente c
left outer join pedido p on c.cod_cliente = p.cod_cliente
where p.cod_cliente is null
^^^^^^^^^^^^^^^^^^^^^^^^^^

Seleção de tabela com intersecção (chave estrangeira) *de acordo com a segunda tabela citada (Puxando dados de funcionários com base nos setores)

select f.primeiro_nome, f.salario, s.nome_setor
from Funcionario f
right outer join Setor s on f.cod_setor = s.cod_setor
^^^^^^^^^^^^^^^^

Seleção de tabela com intersecção (!chave estrangeira) *de acordo com a segunda tabela citada (Puxando dados de funcionários com base nos setores)

insert into Setor(nome_setor) values ('Marketing')

select f.primeiro_nome, f.salario, s.nome_setor
from Funcionario f
right outer join Setor s on f.cod_setor = s.cod_setor

select f.primeiro_nome, f.salario, s.nome_setor
from Funcionario f
Right outer join Setor s on f.cod_setor = s.cod_setor
where f.primeiro_nome is NULL

Seleção total Conjuntos completos com a intersecção

select c.nome_cliente, p.num_pedido
from cliente c 
full outer join pedido p on c.cod_cliente = p.cod_cliente
^^^^^^^^^^^^^^^

Consulta cruzada de tabelas 

select f.primeiro_nome, f.salario, s.nome_setor
from Funcionario f
cross join Setor s
order by f.primeiro_nome

Lista o menor valor e o maior

select min(salario_fixo) AS 'MENOR SALARIO', max(salario_fixo) AS 'MAIOR SALARIO'
from vendedor

Calcula a média do salario

select avg(salario_fixo) AS MEDIA_SALARIO
from vendedor

Conta quantos com aquela especificação de dados estão na tabela

select count(*) from vendedor
where salario_fixo > 2500.00

Consulta a quantidade total de produtos no pedido especificado

select sum (quantidade)
from item_pedido
where cod_produto =3

Lista quantas vezes pediram produtos dentro de um pedido

select num_pedido, total_produtos = count(*)
from item_pedido
group by num_pedido

Consulta quantos pediu mais de uma vez 5x um produto

select num_pedido, total_produtos = count(*)
from item_pedido
where quantidade > 5
group by num_pedido
having count(*) > 1
*/

use FBD;
select * from Funcionario


-- 1
Select primeiro_nome, ultimo_nome, salario from Funcionario
where salario > 2500

-- 2 
select primeiro_nome, ultimo_nome, cod_setor from Funcionario
where NR_matricula = 7

-- 3
Select primeiro_nome, ultimo_nome, salario from Funcionario
where salario NOT BETWEEN 1500 and 3500

-- 4
select primeiro_nome, ultimo_nome, cod_setor, data_admissao from Funcionario
where year(data_admissao) > 2009
ORDER BY data_admissao

-- 5 
select primeiro_nome, cod_setor from Funcionario 
where cod_setor in (1,4)
order by cod_setor

-- 6 
select primeiro_nome from funcionario
where primeiro_nome like '_a%'

-- 7 
select primeiro_nome from funcionario
where primeiro_nome like '%a%' or primeiro_nome like '%e%'

-- 8 
select primeiro_nome, cod_setor from Funcionario 
where cod_setor in (2,5)

-- 9
select primeiro_nome, cod_setor from Funcionario 
where cod_setor = 2
ORDER BY primeiro_nome

-- 10
select primeiro_nome, cod_setor from Funcionario 
where cod_setor = 3 and salario > 2.300

-- 11
-- a)
select DISTINCT(cod_setor) from Funcionario

-- b)
select 'Nome: ' + primeiro_nome + ', Setor: ' + CONVERT(VARCHAR,cod_setor) as 'Funcionário e Setor' from funcionario

Select * from Setor
Select * from Funcionario



