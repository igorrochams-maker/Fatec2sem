/*
create table Setor (
Cod_setor int identity (1,1),
nome_setor varchar (30) not null,
constraint PK_Setor primary key (Cod_setor)
)

create table Funcionario (
NR_matricula int identity (1,1),
primeiro_nome varchar(20),
ultimo_nome varchar (50),
email varchar (200),
telefone varchar (20),
data_admissao datetime,
salario float,
Cod_setor int,
foreign key (Cod_setor) references Setor(Cod_setor),
constraint PK_Funcionario primary key (NR_matricula)
)

insert into Setor (nome_setor) values 
('TI'),
('Compras'),
('Produção'),
('RH'),
('Contabilidade')


insert into Funcionario (primeiro_nome, ultimo_nome, 
email, telefone, data_admissao, salario, Cod_setor)
values
('João', 'Silva', 'joao.silva@email.com', '(11) 1234-5678', '20-09-2019', 5000.00, 1),
('Maria', 'Santos', 'maria.santos@email.com', '(11) 2345-6789', '15-12-2008', 5500.00, 2),
('Carlos', 'Ferreira', 'carlos.ferreira@email.com', '(11) 3456-7890', '21-03-2015', 6000.00, 3),
('Ana', 'Oliveira', 'ana.oliveira@email.com', '(11) 4567-8901', '18-05-2010', 5200.00, 4),
('Rafael', 'Costa', 'rafael.costa@email.com', '(11) 5678-9012', '21-12-2023', 5800.00, 5),
('Fernanda', 'Gomes', 'fernanda.gomes@email.com', '(11) 6789-0123', '11-12-2013', 5300.00, 1),
('Luiz', 'Rodrigues', 'luiz.rodrigues@email.com', '(11) 7890-1234', '25-11-2025', 6200.00, 2),
('Mariana', 'Machado', 'mariana.machado@email.com', '(11) 8901-2345', '26-09-2020', 5400.00, 3)


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





