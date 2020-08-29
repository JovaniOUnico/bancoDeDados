create database socialNetwork;

use socialNetwork;

create table conta(
	id_conta int identity NOT NULL,
	email varchar(90) NOT NULL,
	nome varchar(30) NOT NULL,
	senha varchar(40) NOT NULL,
	
    
    primary key(id_conta)

);

create table albuns(
	id_album int identity NOT NULL,
    id_conta int NOT NULL,
    nome varchar(30),
    descricao varchar(max),
	pub_data date default(GETDATE()),
    
    primary key(id_album),
    foreign key (id_conta) references conta(id_conta)
);

create table fotografia(
	id_fotografia int identity NOT NULL,
    id_album int NOT NULL,
    
    descricao varchar(30),
    titulo varchar(30),
    qtd_like int,
    qtd_not_like int,
    
    primary key(id_fotografia),
    foreign key (id_album) references albuns(id_album)
    
);

create table comentario(
	
    id_comentario int identity NOT NULL,
	id_fotografia int NOT NULL,
    id_conta int NOT NULL,
    comentario varchar(max) NOT NULL,
	
    primary key(id_comentario),
    foreign key (id_fotografia) references fotografia(id_fotografia),
    foreign key (id_conta) references conta(id_conta)  

);

create table reacao(
	
    id_reacao int identity NOT NULL,
	id_fotografia int NOT NULL,
    id_conta int NOT NULL,
    reacao varchar(max) NOT NULL,
	
    primary key(id_reacao),
    foreign key (id_fotografia) references fotografia(id_fotografia),
    foreign key (id_conta) references conta(id_conta)  

);

create table reacao_comentario(
	
    id_reacao int identity NOT NULL,
	id_comentario int NOT NULL,
    id_conta int NOT NULL,
    reacao varchar(max) NOT NULL,
	
    primary key(id_reacao),
    foreign key (id_comentario) references comentario(id_comentario),
    foreign key (id_conta) references conta(id_conta)  

);

/*Popule com mais 3 usuários a tabela de usuários*/

insert into conta (email,nome,senha) values ('jovani0@meumail.com','jovani0','004202005295');
insert into conta (email,nome,senha) values ('jovani1@meumail.com','jovani1','004202005295');
insert into conta (email,nome,senha) values ('jovani2@meumail.com','jovani2','004202005295');

/*Popule com mais 2 álbuns*/

insert into albuns(id_conta,nome,descricao) values (1,'fotos na praia','eu andando na praia');
insert into albuns(id_conta,nome,descricao) values (1,'fotos em cuba','eu passando fome em cuba');

insert into albuns(id_conta,nome,descricao) values (2,'fotos no rio','eu andando no rio');
insert into albuns(id_conta,nome,descricao) values (2,'fotos na coreia do norte','eu vendo o sofrimento na coreia');

insert into albuns(id_conta,nome,descricao) values (3,'fotos da lua','linda fotos que tirei da lua');
insert into albuns(id_conta,nome,descricao) values (3,'fotos na china','eu vendo a china monitorada');

/* Para cada álbum popule com no minimo 3 fotos */

insert into fotografia (id_album,descricao,titulo,qtd_like,qtd_not_like) values (1,'praia cheia lotada de barcos','horizonte azul',0,0);
insert into fotografia (id_album,descricao,titulo,qtd_like,qtd_not_like) values (1,'lindas mulheres andando','sereias',0,0);
insert into fotografia (id_album,descricao,titulo,qtd_like,qtd_not_like) values (1,'eu surfando nas ondas','onda',0,0);

insert into fotografia (id_album,descricao,titulo,qtd_like,qtd_not_like) values (2,'ruas cheias de mendigos','ruas de cuba',0,0);
insert into fotografia (id_album,descricao,titulo,qtd_like,qtd_not_like) values (2,'soldados armados','ruas de cuba',0,0);
insert into fotografia (id_album,descricao,titulo,qtd_like,qtd_not_like) values (2,'eu feliz indo embora','aeroporto de cuba',0,0);

insert into fotografia (id_album,descricao,titulo,qtd_like,qtd_not_like) values (3,'rio cheio de peixes','rio cheio',0,0);
insert into fotografia (id_album,descricao,titulo,qtd_like,qtd_not_like) values (3,'boto cor de rosa perto de mim','boto cor de rosa',0,0);
insert into fotografia (id_album,descricao,titulo,qtd_like,qtd_not_like) values (3,'trilha na beira do rio','trilha',0,0);

insert into fotografia (id_album,descricao,titulo,qtd_like,qtd_not_like) values (4,'pessoas saudam o lider','kim morreu?',0,0);
insert into fotografia (id_album,descricao,titulo,qtd_like,qtd_not_like) values (4,'desfile militar','desfile',0,0);
insert into fotografia (id_album,descricao,titulo,qtd_like,qtd_not_like) values (4,'eu feliz podendo sair','aeroporto',0,0);

insert into fotografia (id_album,descricao,titulo,qtd_like,qtd_not_like) values (5,'fotos da lua de baixo','foto da lua1',0,0);
insert into fotografia (id_album,descricao,titulo,qtd_like,qtd_not_like) values (5,'fotos da lua da esquerda','foto da lua2',0,0);
insert into fotografia (id_album,descricao,titulo,qtd_like,qtd_not_like) values (5,'fotos da lua da direita','foto da lua3',0,0);

insert into fotografia (id_album,descricao,titulo,qtd_like,qtd_not_like) values (6,'pessoas saudam o lider','quem morreu?',0,0);
insert into fotografia (id_album,descricao,titulo,qtd_like,qtd_not_like) values (6,'desfile militar','desfile',0,0);
insert into fotografia (id_album,descricao,titulo,qtd_like,qtd_not_like) values (6,'eu feliz podendo sair livre','aeroporto',0,0);

/*Para cada foto popule com 3 reações (qualquer reação)*/

insert into reacao (id_fotografia,id_conta,reacao) values (1,1,'rir');
insert into reacao (id_fotografia,id_conta,reacao) values (1,2,'sorrir');
insert into reacao (id_fotografia,id_conta,reacao) values (1,3,'rir');

insert into reacao (id_fotografia,id_conta,reacao) values (2,1,'rir');
insert into reacao (id_fotografia,id_conta,reacao) values (2,2,'sorrir');
insert into reacao (id_fotografia,id_conta,reacao) values (2,3,'raiva');

insert into reacao (id_fotografia,id_conta,reacao) values (3,1,'surpresa');
insert into reacao (id_fotografia,id_conta,reacao) values (3,2,'sorrir');
insert into reacao (id_fotografia,id_conta,reacao) values (3,3,'sorrir');

insert into reacao (id_fotografia,id_conta,reacao) values (4,1,'surpresa');
insert into reacao (id_fotografia,id_conta,reacao) values (4,2,'rir');
insert into reacao (id_fotografia,id_conta,reacao) values (4,3,'sorrir');

insert into reacao (id_fotografia,id_conta,reacao) values (5,1,'rir');
insert into reacao (id_fotografia,id_conta,reacao) values (5,2,'sorrir');
insert into reacao (id_fotografia,id_conta,reacao) values (5,3,'rir');

insert into reacao (id_fotografia,id_conta,reacao) values (6,1,'rir');
insert into reacao (id_fotografia,id_conta,reacao) values (6,2,'sorrir');
insert into reacao (id_fotografia,id_conta,reacao) values (6,3,'raiva');

insert into reacao (id_fotografia,id_conta,reacao) values (7,1,'surpresa');
insert into reacao (id_fotografia,id_conta,reacao) values (7,2,'sorrir');
insert into reacao (id_fotografia,id_conta,reacao) values (7,3,'sorrir');

insert into reacao (id_fotografia,id_conta,reacao) values (8,1,'surpresa');
insert into reacao (id_fotografia,id_conta,reacao) values (8,2,'rir');
insert into reacao (id_fotografia,id_conta,reacao) values (8,3,'sorrir');

insert into reacao (id_fotografia,id_conta,reacao) values (9,1,'rir');
insert into reacao (id_fotografia,id_conta,reacao) values (9,2,'sorrir');
insert into reacao (id_fotografia,id_conta,reacao) values (9,3,'rir');

insert into reacao (id_fotografia,id_conta,reacao) values (10,1,'rir');
insert into reacao (id_fotografia,id_conta,reacao) values (10,2,'sorrir');
insert into reacao (id_fotografia,id_conta,reacao) values (10,3,'raiva');

insert into reacao (id_fotografia,id_conta,reacao) values (11,1,'surpresa');
insert into reacao (id_fotografia,id_conta,reacao) values (11,2,'sorrir');
insert into reacao (id_fotografia,id_conta,reacao) values (11,3,'sorrir');

insert into reacao (id_fotografia,id_conta,reacao) values (12,1,'surpresa');
insert into reacao (id_fotografia,id_conta,reacao) values (12,2,'rir');
insert into reacao (id_fotografia,id_conta,reacao) values (12,3,'sorrir');

insert into reacao (id_fotografia,id_conta,reacao) values (13,1,'surpresa');
insert into reacao (id_fotografia,id_conta,reacao) values (13,2,'rir');
insert into reacao (id_fotografia,id_conta,reacao) values (13,3,'sorrir');

insert into reacao (id_fotografia,id_conta,reacao) values (14,1,'rir');
insert into reacao (id_fotografia,id_conta,reacao) values (14,2,'sorrir');
insert into reacao (id_fotografia,id_conta,reacao) values (14,3,'rir');

insert into reacao (id_fotografia,id_conta,reacao) values (15,1,'rir');
insert into reacao (id_fotografia,id_conta,reacao) values (15,2,'sorrir');
insert into reacao (id_fotografia,id_conta,reacao) values (15,3,'raiva');

insert into reacao (id_fotografia,id_conta,reacao) values (16,1,'surpresa');
insert into reacao (id_fotografia,id_conta,reacao) values (16,2,'sorrir');
insert into reacao (id_fotografia,id_conta,reacao) values (16,3,'sorrir');

insert into reacao (id_fotografia,id_conta,reacao) values (17,1,'rir');
insert into reacao (id_fotografia,id_conta,reacao) values (17,2,'sorrir');
insert into reacao (id_fotografia,id_conta,reacao) values (17,3,'rir');

insert into reacao (id_fotografia,id_conta,reacao) values (18,1,'rir');
insert into reacao (id_fotografia,id_conta,reacao) values (18,2,'sorrir');
insert into reacao (id_fotografia,id_conta,reacao) values (18,3,'raiva');

/*Escolha 2 fotos e popule com 3 comentários*/

insert into comentario (id_fotografia,id_conta,comentario) values (1,1,'bom demais');
insert into comentario (id_fotografia,id_conta,comentario) values (1,2,'nossa');
insert into comentario (id_fotografia,id_conta,comentario) values (1,3,'legal');

insert into comentario (id_fotografia,id_conta,comentario) values (2,1,'eita bom demais');
insert into comentario (id_fotografia,id_conta,comentario) values (2,2,'nossa');
insert into comentario (id_fotografia,id_conta,comentario) values (2,3,'nosioa');

/* Escolha 1 comentário e popule com 3 reações (qualquer uma) */

insert into reacao_comentario (id_comentario,id_conta,reacao) values (1,1,'rir');
insert into reacao_comentario (id_comentario,id_conta,reacao) values (1,2,'sorrir');
insert into reacao_comentario (id_comentario,id_conta,reacao) values (1,3,'raiva');

/* Escreva uma consulta que mostra o nome e a descrição do álbum, o nome do proprietário e a data de publicação do álbum.*/

select albuns.nome,albuns.descricao,conta.nome,albuns.pub_data from albuns inner join conta on conta.id_conta = albuns.id_conta;

/* Escreva uma consulta que mostra o Nome da Foto, o Nome do álbum, o nome do proprietário do álbum. */

select albuns.nome,fotografia.titulo,conta.nome from fotografia inner join albuns on fotografia.id_album = albuns.id_album inner join conta on conta.id_conta = albuns.id_conta ;

/* Escreva uma consulta que mostra o nome do álbum e a quantidade de fotos que cada álbum possui. */

select albuns.nome,COUNT(fotografia.id_fotografia)as qtd_fotografia from albuns inner join fotografia on fotografia.id_album = albuns.id_album group by albuns.nome;

/* Escreva uma consulta que mostra o Nome da Foto, o proprietário da foto, os comentários, e quem comentou */

select fotografia.titulo,conta.nome,comentario.comentario from fotografia inner join albuns on fotografia.id_album = albuns.id_album inner join conta on conta.id_conta = albuns.id_conta inner join comentario on comentario.id_fotografia = fotografia.id_fotografia and comentario.id_conta = conta.id_conta;