CREATE DATABASE savv_bd;
use savv_bd;

create table usuario (
	id_user int not null AUTO_INCREMENT,
    nome VARCHAR(100) not null,
    email varchar(250) not null unique,
    senha varchar(250) not null,
    tipo CHAR(1) not null,
    
    constraint PK_USUARIO primary key (id_user)
);

create table funcionario (
    id_funcionario int not null AUTO_INCREMENT,
    id_user int not null,
    data_cad datetime DEFAULT CURRENT_TIMESTAMP,
	matricula char(5) unique not null,
    cargo varchar(50) not null,
    
    constraint PK_FUNCIONARIO primary key (id_funcionario),
    constraint FK_USUARIO foreign key (id_user) references usuario(id_user)
);

create table servicos (
	protocolo int not null AUTO_INCREMENT,
    data datetime not null DEFAULT CURRENT_TIMESTAMP,
    obs varchar(500) not null,
    endereco varchar(150) not null,
    coordenada varchar(50) not null,
    img varchar(255) not null,
    status varchar(15) not null,
    categoria varchar(30) not null,
    id_user int not null,
    
    CONSTRAINT PK_SERVICOS primary key (protocolo),
    CONSTRAINT FK_AUTOR foreign key(id_user) references usuario(id_user)
);


create table historico (
	id_historico int not null AUTO_INCREMENT,
    data datetime not null DEFAULT CURRENT_TIMESTAMP,
    obs varchar(255) not null,
    id_funcionario int not null,
    protocolo int not null,
    atualizacao VARCHAR(100),
    
    constraint PK_HISTORICO primary key (id_historico),
    constraint FK_FUNCIONARIO foreign key (id_funcionario) references funcionario(id_funcionario),
    constraint FK_SERVICO foreign key (protocolo) references servicos(protocolo)
    
);

insert into usuario(nome, email, senha, tipo)
values ('Luis Motta', 'luismotta@gmail.com', 'doritos', 'U'), ('Marcos Vinicius', 'marcosvinicius@gmail.com', 'santos', 'U'), ('Tafaro Souza', 'tafarosouza@gmail.com', 'gaelsouza', 'U'), ('Agatha Silva', 'agathasilva@gmail.com', 'jujubas', 'U'), ('Simone Valentina', 'simonevalentina@gmail.com', 'santos', 'U'), ('Carlos Henrique', 'carlinhos@gmail.com', 'principedotrap', 'A'), ('Gustavo Souza', 'gustavosouza@gmail.com', 'catatau', 'A'), ('Igor Rocha', 'igorrocha@gmail.com', 'santista', 'A'), ('Maycon Moraes', 'mayconmoraes@gmail.com', 'geografia', 'A'), ('Xerife Votorantim', 'xerife@gmail.com', 'xerife', 'A')

insert into funcionario(id_user, matricula, cargo)
values (6, '12345', 'Fiscal'), (7, '23456', 'Fiscal'), (8, '34567', 'Atendente'), (9, '45678', 'Fiscal'), (10, '56789', 'Diretor')