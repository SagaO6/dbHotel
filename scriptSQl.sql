/* Mostrar os bancos de dados existentes no servidor */
show databases;

/* Criar um novo banco */
create database dbHotel;

/* Selecionar o banco de dados */
use dbHotel;

/* Criar uma nova tabela */
create table funcionarios (
/* Int se refere ao tipo do campo na tabela
Primary key determina que o campo seja uma chave primaria e será responsavel por identificar
auto_increment determina que o MySQL dê um id novo a cada cadastro*/
	idFunc int primary key auto_increment,
    
/* Varchar é a quantidade variavel de caracteres no nome (nesse caso,até 100 caracteres)
not null determina que  campo seja obrigatorio */

    /*nomeFunc varchar (100) not null,*/
    
/* Unique determina que o campo seja unico e o valor nao possa repetir */
    login varchar(20) not null unique,
    senha varchar(255) not null,
	cargo varchar(20)
);

/* Descrever os campos da tabela */
describe funcionarios;

/* Excluir a tabela do banco */
drop table funcionarios;

show tables;

/* CREATE */
/* Inserir um novo funcionario na tabela, com nome, login, senha criptografada e cargo */
insert into funcionarios(nomeFunc, login, senha, cargo) values ("Administrador", "admin", md5("admin"), "Administrador");

insert into funcionarios(nomeFunc, login, senha, cargo) values ("Pamella Pereto", "pamellapereto", md5("123@senac"), "TI");

insert into funcionarios(nomeFunc, login, senha, cargo) values ("Breno Silva", "brenosilva", md5("123@senac"), "Contabilidade");

insert into funcionarios(nomeFunc, login, senha, cargo) values ("Victoria Cardoso", "victoriacardoso", md5("123@senac"), "RH");

insert into funcionarios(nomeFunc, login, senha) values ("Laura Lopes", "lauralopes", md5("123@senac"));

insert into funcionarios(nomeFunc, login, senha) values ("Fellipe Coelho", "fellipe", md5("123@senac"));

/* READ */
/* Ler/Buscar as informações da tabela funcionarios */
select * from funcionarios;

/* UPDATE */
/* Atualizar o campo login na tabela funcionarios especificando o id */
update funcionarios set login = "felipecoelho" where idFunc = 6;

update funcionarios set cargo = "Gerencia" where idFunc = 4;