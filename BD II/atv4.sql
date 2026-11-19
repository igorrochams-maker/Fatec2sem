use bdfatura;
select * from fornecedor;
select * from produto;

-- 1
select f.nrfatura, f.datafatura, f.codcliente, c.nome
from fatura f
cross join cliente c
order by c.nome

-- 2
select * from produto order by descricao

-- 3
select i.nrfatura, sum(i.valor) as valor_total
from itens_fatura i
group by i.nrfatura

-- 4
select 