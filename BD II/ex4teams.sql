use bdfatura;

-- 1
select f.nrfatura, f.datafatura, f.codcliente, c.nome
from fatura f 
cross join cliente c 
order by c.nome;

-- 2
SELECT p.*, f.nomeforn
from produto p
inner join fornecedor f
order by p.descricao;

-- 3 
SELECT f.nrfatura, SUM(i.valor)
from fatura f
inner join itens_fatura i on i.nrfatura = f.nrfatura
group by f.nrfatura;

-- 4
select f.nomeforn, SUM(p.saldo) as "Quantidade de Produto"
from fornecedor f
cross join produto p on p.codforn = f.codforn
group by f.nomeforn;

-- 5
SELECT nrfatura, count(codproduto) as "Contagem de Itens", sum(qtde) as "Quantidade de Produtos"
from itens_fatura
group by nrfatura;

-- 6
select c.nome, sum(i.valor) as "Valor por Cliente"
from cliente c
INNER join fatura f on f.codcliente = c.codcliente
inner join itens_fatura i on i.nrfatura = f.nrfatura
group by c.nome;

-- 7
select area, count(codcliente) as "Clientes por Área"
from cliente
group by area;

-- 8
select f.nomeforn, SUM(p.saldo) as "Quantidade de Produto", count(p.codproduto) as "Contagem de Itens"
from fornecedor f
cross join produto p on p.codforn = f.codforn
group by f.nomeforn;

-- 9 
select nrfatura, avg(valor)
from itens_fatura
group by nrfatura;

-- 10
SELECT nrfatura, sum(qtde)
from itens_fatura
group by nrfatura
having sum(qtde) > 2;
