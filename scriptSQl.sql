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

    nomeFunc varchar (100) not null,
    
/* Unique determina que o campo seja unico e o valor nao possa repetir */
    login varchar(20) not null unique,
    senha varchar(255) not null,
	cargo varchar(20)
);

/* Descrever os campos da tabela */
describe funcionarios;

alter table funcionarios drop column email;

/* Reposicionar o campo email para que se torne obrigatorio, ou seja, nao nulo (not null) */
alter table funcionarios modify column email varchar (50) not null after login;

alter table funcionarios add column email varchar(50) not null;

show tables;

/* CREATE */
/* Inserir um novo funcionario na tabela, com nome, login, senha criptografada e cargo */
insert into funcionarios(nomeFunc, login, senha, cargo) values ("Administrador", "admin", md5("admin"), "Administrador");

insert into funcionarios(nomeFunc, login, senha, cargo) values ("Pamella Pereto", "pamellapereto", md5("123@senac"), "TI");

insert into funcionarios(nomeFunc, login, senha, cargo) values ("Breno Silva", "brenosilva", md5("123@senac"), "Contabilidade");

insert into funcionarios(nomeFunc, login, senha, cargo) values ("Victoria Cardoso", "victoriacardoso", md5("123@senac"), "RH");

insert into funcionarios(nomeFunc, login, senha) values ("Laura Lopes", "lauralopes", md5("123@senac"));

insert into funcionarios(nomeFunc, login, senha) values ("Fellipe Coelho", "fellipe", md5("123@senac"));

insert into funcionarios(nomeFunc, login, senha, email, cargo) values ("Isack Alves", "Marcelo", md5("123@senac"), "Isack@gmail.com", "Gerencia");

create table Quartos (
idQuarto int primary key auto_increment,
andar varchar(10) not null,
tipoQuarto varchar(50) not null,
ocupacaoMax int not null,
situacao char (3) not null,
nome varchar (50) not null,
descricao text,
preco decimal (10,2) not null,
tipoCama varchar (20),
varada char (3)
);

describe Quartos;

alter table Quartos add column numeroQuarto varchar(10) not null after andar;

/* READ */
/* Ler/Buscar as informações da tabela funcionarios */
select * from funcionarios;

/* Buscar o login e a senha da tabela funcionarios em que o login seja admin e senha seja admin */
select login as Login, senha as Senha from funcionarios where login = "dmin" and senha = md5("admin");

/* Buscas o ID e o nome do funcionario da tabela funcionarios ordenado o nome alfabeticamente (ascendente, de A a Z) */
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc desc;

/* Buscas o ID e o nome do funcionario da tabela funcionarios ordenado o nome alfabeticamente (descedente, de A a Z) */
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc asc;

/* ATIVIDADE: busque os campos ID com o apelido ID_Funcionario, nome com o apelido Nome_Funcionario, e cargo com o apelido cargo_Funcionario
da tabela funcionarios e ordene de forma descendente (do maior ID para o menor) */

select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as cargo_Funcionario from funcionarios order by idFunc desc;

/* cargo <> 'null' tira todos os cargos que sao nulos (<>, significa diferente dele) */
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as cargo_Funcionario from funcionarios where cargo <> 'null' order by idFunc desc;

select * from funcionarios where cargo = 'Gerencia';

/* UPDATE */
/* Atualizar o campo login na tabela funcionarios especificando o id */
update funcionarios set login = "felipecoelho" where idFunc = 6;

update funcionarios set cargo = "Gerencia" where idFunc = 4;

update funcionarios set email = "fellipe@gmail.com" where idFunc = 6;

/* Delete */
delete from funcionarios where idFunc = 5;