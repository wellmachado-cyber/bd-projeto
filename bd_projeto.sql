create database sistema_estoque collate utf8mb4_general_ci charset utf8mb4;

use sistema_estoque;

create table produtos(
id INT auto_increment NOT NULL,
nome varchar(40) NOT NULL,
codigo varchar(30) NOT NULL unique,
quantidade_minima float not null,
quantidade_atual float not null,
tipo_medida enum("kg", "ml", "l", "g", "unit"),
primary key(id)
);

create table categorias(
id int auto_increment not null,
nome varchar(40) not null,
primary key(id)
);

create table pratos(
id int auto_increment not null,
nome varchar(60) not null,
valor float not null,
primary key(id)
);

insert into produtos(
nome, 
codigo, 
quantidade_minima, 
quantidade_atual, 
tipo_medida
) values (
"arroz", 
"PROD_0001",
1,
10,
"kg"
);

select * from produtos;
select * from categorias;

insert into categorias(nome) values ("Brasileira");

alter table produtos
add categoria_id int;

alter table produtos
add constraint fk_categoria
foreign key (categoria_id) references categorias(id);

update produtos
set nome = "Arroz"
where id = 1;

create table pratos_produtos(
prato_id int not null,
produto_id int not null,
primary key(prato_id, produto_id),
foreign key (prato_id) references pratos(id) on delete cascade,
foreign key (produto_id) references produtos(id) on delete cascade
);