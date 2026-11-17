CREATE DATABASE savv_bd;
use savv_bd;


create table usuario (
	id_user int IDENTITY(1,1)  not null,
	nome VARCHAR(100) not null,
    email varchar(250) not null unique,
    senha varchar(250) not null,
    tipo CHAR(1) not null,
    
    constraint PK_USUARIO primary key (id_user)
);

create table funcionario (
    id_funcionario int IDENTITY(1,1)  not null,
    id_user int not null,
    data_cad datetime DEFAULT CURRENT_TIMESTAMP,
	matricula char(5) unique not null,
    cargo varchar(50) not null,
    
    constraint PK_FUNCIONARIO primary key (id_funcionario),
    constraint FK_USUARIO foreign key (id_user) references usuario(id_user)
);

create table servicos (
	protocolo int IDENTITY(1,1)  not null,
    data datetime not null DEFAULT CURRENT_TIMESTAMP,
    obs varchar(500) not null,
    endereco varchar(150) not null,
    coordenada varchar(50) not null,
    img varchar(255) not null,
    status varchar(15) DEFAULT 'PENDENTE',
    categoria varchar(30) not null,
    id_user int not null,
	id_funcionario int,
    
    CONSTRAINT PK_SERVICOS primary key (protocolo),
    CONSTRAINT FK_AUTOR foreign key(id_user) references usuario(id_user),
	constraint FK_FUNCIONARIO_SERVICO foreign key (id_funcionario) references funcionario(id_funcionario),
);


create table historico (
	id_historico int IDENTITY(1,1)  not null,
	id_funcionario int not null,
    data datetime not null DEFAULT CURRENT_TIMESTAMP,
    atualizacao VARCHAR(255),
	protocolo int not null,
    
    constraint PK_HISTORICO primary key (id_historico),
    constraint FK_FUNCIONARIO foreign key (id_funcionario) references funcionario(id_funcionario),
    constraint FK_SERVICO foreign key (protocolo) references servicos(protocolo)
    
);

insert into usuario(nome, email, senha, tipo)
values ('Luis Motta', 'luismotta@gmail.com', 'doritos', 'U'), ('Marcos Vinicius', 'marcosvinicius@gmail.com', 'santos', 'U'), ('Tafaro Souza', 'tafarosouza@gmail.com', 'gaelsouza', 'U'), ('Agatha Silva', 'agathasilva@gmail.com', 'jujubas', 'U'), ('Simone Valentina', 'simonevalentina@gmail.com', 'santos', 'U'), ('Carlos Henrique', 'carlinhos@gmail.com', 'principedotrap', 'A'), ('Gustavo Souza', 'gustavosouza@gmail.com', 'catatau', 'A'), ('Igor Rocha', 'igorrocha@gmail.com', 'santista', 'A'), ('Maycon Moraes', 'mayconmoraes@gmail.com', 'geografia', 'A'), ('Xerife Votorantim', 'xerife@gmail.com', 'xerife', 'A');

insert into funcionario(id_user, matricula, cargo)
values (6, '12345', 'Fiscal'), (7, '23456', 'Fiscal'), (8, '34567', 'Atendente'), (9, '45678', 'Fiscal'), (10, '56789', 'Diretor');

-- Inserindo solicitação de serviços concluídos para consulta
insert into servicos(obs, endereco, coordenada, img, status, categoria, id_user, id_funcionario) 
values 
('Mato muito alto está atrapalhando tráfego de civis.', '977 Av. 31 de Março, Votorantim, São Paulo', '-23.534031013650964, -47.4510674331244', 'Capina-calcada.jpg', 'CONCLUÍDO', 'Capina', 3, 1),
('Galhos da árvore estão atrapalhando a visão dos carrros.', 'R. Sílvio Matioli - Rio Acima, Votorantim - SP', '-23.538667,-47.437452', 'poda-votorantim.jpg', 'CONCLUÍDO', 'Poda', 2, 2),
('Muro está caindo devido a obstrução da raíz da árvore.', 'R. Barcelona, Votorantim - SP', '-23.575905, -47.476525', 'erradicacao-pet.jpg', 'CONCLUÍDO', 'Erradicação', 2, 3)
;

-- Inserindo solicitação de serviços recusados para consulta
insert into servicos(obs, endereco, coordenada, img, status, categoria, id_user, id_funcionario) 
values
('Raízes da árvore estão imposibilitando o tráfego de bicicletas na ciclovia e já obstruíram o meio fio.', 'Estr. Oswaldo Pires De Camargo, 237 - Monte Alegre Votorantim - SP', '-23.544259, -47.455677', 'erradicação-votorantim.jpg', 'RECUSADO', 'Erradicação', 5, 4),
('Galhos das árvores obstruindo totalmente o caminho e enchendo o chão do parque de folhas, nem dá mais para ver a calçada.', 'Av. Santo Antônio Votorantim - SP', '-23.552944, -47.434707', 'poda-parque.jpg', 'RECUSADO', 'Poda', 7, 2)
;

-- Inserindo solicitação de serviço que usa os padrões de data e status, assim que vai ser registrado normalmente
insert into servicos(obs, endereco, coordenada, img, categoria, id_user) 
values 
('Mato alto está atraindo animais peçonhentos para a vizinhança, 3 escorpiões em uma semana', 'R. Mauricio Fomia, 466-526 - Parque Bela Vista Votorantim - SP,', '-23.544747, -47.458225', 'capina-parque.jpg', 'Capina', 3),
('Raízes da árvore já invadiu o espaço para prática de esporte, deixando o campo inviável para uso.', 'Praça de Esportes Votorantim - SP', '-23.577417, -47.473295', 'erradicacao-parque.jpg', 'Erradicação', 5)
;

insert into historico(id_funcionario, atualizacao, protocolo)
values
(1,'Realmente há necessidade da realização de capina nas beiradas da calçadas, mato obstruindo passagem e dificultando tráfego de civis.',1),
(2,'Poda autorizada, visão do cruzamento realmente está prejudicada por conta dos galhos e das folhas',2),
(3,'Erradicação permitida, árvore apresenta sério riscos para a estrutura da vizinhança.',3),
(4,'Solicitação recusada, árvore se encontra em território particular e não é da vontade dos donos realizar a erradicação',4),
(2,'Solicitação recusada, árvores não estão prejudicando o passeio pelo parque, apresentando apenas umas leves quedas do outono.',5);


select s.*, u.nome from servicos s
inner join usuario u on u.id_user = s.id_user
where u.id_user = 2;

select coordenada, categoria from servicos
where status = 'CONCLUÍDO';

select
	SUM(CASE WHEN categoria = 'Erradicação' THEN 1 ELSE 0 END) AS ERRADICACAO,
    SUM(CASE WHEN categoria = 'Poda' THEN 1 ELSE 0 END) AS PODA,
    SUM(CASE WHEN categoria = 'Capina' THEN 1 ELSE 0 END) AS CAPINA
from servicos;

select * from servicos
where status = 'PENDENTE' or status = 'EM ANÁLISE';

select s.*, u.nome from servicos s
inner join funcionario f on f.id_funcionario = s.id_funcionario
inner join usuario u on u.id_user = f.id_user
where f.id_funcionario = 1;


