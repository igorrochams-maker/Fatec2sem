create database LISTA2teams;
use LISTA2teams;

-- 1
create table Tbl_clientes(
	Id int primary key,
	Nome varchar(50),
	Email varchar(100),
	Telefone varchar(15)
);

-- 2 e 3
insert into Tbl_clientes
values (1, 'João Silva', 'joao@email.com', '(11) 1234-5678'), (2, 'Igor Rocha', 'igor@email.com', '(11) 9999-9999'), (3, 'Gabriela Fernanda', 'gabi@email.com', '(11) 9999-9998'), (4, 'Cintia Rocha', 'cintia@email.com', '(11) 9999-9988'), (5, 'Ronaldo Lopes', 'ronaldo@email.com', '(11) 9999-9888'), (6, 'Isabelle Rocha', 'isabelle@email.com', '(11) 9999-8888'), (7, 'Danielle Rocha', 'dani@email.com', '(11) 9998-8888'), (8, 'Gabriel Bontempo', 'bontempo@email.com', '(11) 9988-8888'), (9, 'Gabigol', 'gabigol@email.com', '(11) 9888-8888'), (10, 'Neymar Junior', 'neymar@email.com', '(11) 9911-1010'), (11, 'Rony', 'rony@email.com', '(11) 9111-1111');

-- 4
update Tbl_clientes
set Telefone = '(11) 8765-4321'
where Id = 1;

-- 5
create table Tbl_produtos(
	Id int primary key,
	Nome varchar(50),
	Preco decimal(5,2),
	Estoque int
);

-- 6 e 7
insert into Tbl_produtos
values (1, 'Camiseta', 29.99, 100), (2, 'Camisa', 49.99, 60), (3, 'Regata', 19.99, 130), (4, 'Blusa', 69.99, 40), (5, 'Jaqueta', 89.99, 50), (6, 'Colete', 79.99, 23), (7, 'Cachecol', 19.99, 10),(8, 'Ombreira', 09.99, 8),(9, 'Mochila', 94.99, 5),(10, 'Bolsa', 69.99, 30),(11, 'Lancheira', 749.99, 1);

-- 8
Update Tbl_produtos
set Preco = 39.99
where id =1;

-- 9
create table Tbl_pedidos(
	Id int primary key,
	ClienteId int,
	ProdutoId int,
	Quantidade int,
	DataPedido date,

	constraint FK_Cliente foreign key(ClienteId) references Tbl_clientes(Id),
	constraint FK_Produto foreign key(ProdutoId) references Tbl_produtos(Id)
);

-- 10 e 12
insert into Tbl_pedidos 
values (1,1,1,2,getdate()), (2,2,2,5,getdate()), (3,6,5,1,getdate()), (4,4,5,2,getdate()), (5,7,3,7,getdate()), (6,3,5,4,getdate()), (7,1,9,3,getdate()), (8,8,7,1,getdate()), (9,9,2,1,getdate()), (10,10,10,2,getdate()), (11,11,1,2,getdate());

-- 11
update Tbl_pedidos
set quantidade = 3
where id = 1

-- 13
create table Tbl_funcionarios (
	Id int primary key,
	Nome Varchar(50),
	Cargo Varchar(50),
	Salario decimal(7,2)
)

-- 14 e 16
insert into Tbl_funcionarios
values (1, 'Maria Santos', 'Gerente', 5000.00), (2, 'Igor Santos', 'Assistente', 2000.00), (3, 'Gabi Santos', 'Coordenadora', 5500.00), (5, 'Isabelle Santos', 'Estagiária', 2500.00), (6, 'Priscila Santos', 'Jovem', 1200.00), (7, 'João Santos', 'Analista Jr', 3100.00), (8, 'Cintia Santos', 'Gerente Pessoas', 8000.00), (9, 'Ronaldo Santos', 'TI', 9000.00),  (10, 'Helena Santos', 'Marketing', 2750.00), (11, 'Vitória Santos', 'CO', 9000.00);

-- 15
Update Tbl_funcionarios
set Salario = 6000.00
where id = 1;

-- 17 
create table Tbl_vendas (
	Id int primary key,
	ProdutoId int,
	Quantidade int,
	ValorTotal decimal(5,2),
	DataVenda date,

	constraint FK_ProdutoVenda foreign key(ProdutoId) references Tbl_produtos(Id)
);

-- 18 e 19
insert into Tbl_vendas
values ( 1, 1, 2, 79.98, getdate()), ( 2, 2, 1, 49.98, getdate()), ( 3, 5, 1, 39.98, getdate()), ( 4, 10, 3, 119.98, getdate()), ( 5, 11, 1, 499.99, getdate()), ( 6, 4, 1, 44.98, getdate()), ( 7, 3, 2, 99.98, getdate()), ( 8, 7, 2, 89.98, getdate()), ( 9, 9, 2, 149.98, getdate()), ( 10, 1, 2, 49.98, getdate()), ( 11, 11, 2, 999.98, getdate());

-- 20
Delete Tbl_vendas
where id = 1;
