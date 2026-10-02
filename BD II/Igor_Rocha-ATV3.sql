use FBD;

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





