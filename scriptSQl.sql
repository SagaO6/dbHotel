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

/*________________________________________________________________________________________________*/

/* Tabela Quartos */

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
varanda char (3)

);

drop table quartos;

describe Quartos;

alter table Quartos add column numeroQuarto varchar(10) not null after andar;
alter table Quartos add column cafeDaManha char(3) not null after preco;
alter table Quartos add column foto varchar (255) not null after descricao;

insert into Quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, preco, tipoCama, varanda, foto, cafeDaManha) values ("1º", "101",
"Deluxe", 4, "não", "Casal", "O quarto de 32m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 42, wi-fi grátis,
cofre digital, ftigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho", 1200.00, "king size", "sim", "", "sim");

update Quartos set cafeDaManha = "não" where idQuarto = 6;
update Quartos set foto = "https://cf.bstatic.com/xdata/images/hotel/max1024x768/427861759.jpg?k=8e32bd8bf0f4e883b632dc439164cad3e5fd7059a729b780ccfdb278584a311b&o=&hp=1" where idQuarto = 9;
update Quartos set foto = "https://cf.bstatic.com/xdata/images/hotel/max1024x768/427861759.jpg?k=8e32bd8bf0f4e883b632dc439164cad3e5fd7059a729b780ccfdb278584a311b&o=&hp=1" where idQuarto = 11;

select * from Quartos where situacao = "não";
select * from Quartos where cafeDaManha = "sim";
select * from Quartos where varanda = "sim" and cafeDaManha = "sim" and situacao = "não";
select * from Quartos where preco < 700.00 and situacao = "não" order by preco asc;

Delete from Quartos Where idQuarto = 10;

select * from Quartos;

/* Fim Quartos */

/*____________________________________________________________________________________________________*/

/* Tabela Clientes */

create table clientes (

idCliente int key auto_increment,
nomeCompleto varchar (100) not null,
cpf char (14) not null unique,
rg char (12) not null unique,
email varchar (50) unique,
celular varchar (15) not null,
numeroCartao varchar (20) not null,
nomeTitular varchar (100) not null,
validade date not null,
cvv char(3) not null,
checkin datetime not null,
checkout datetime not null

);

drop table clientes;

select * from Quartos;

describe clientes;

insert into clientes (nomeCompleto, cpf, rg, email, celular, numeroCartao, nomeTitular, validade, cvv, checkin, checkout) values
("Thiago Rivas Caballero", "643.453.400-04", "41.351.272-1", "Thiago@gmail.com", "(11) 98701-0793", "4455082150938777", "Thiago", "2030-03-26",
 "719", "2023-11-10 13:00:00", "2023-11-15 15:00:00");
 
insert into clientes (nomeCompleto, cpf, rg, email, celular, numeroCartao, nomeTitular, validade, cvv, checkin, checkout) values
("Ana Julia dos Santos", "356.474.465-01", "48.342.289-5", "Ana@gmail.com", "(11) 98721-8931", "8555321495356758", "Ana", "2030-05-30",
 "879", "2023-12-10 09:00:00", "2023-12-15 19:00:00");
 
select * from clientes;


delete from clientes where idCliente = 3;


/* Buscar todas as informações da tabela quartos que está vinculada à tabela clientes pelo campo idQuarto */
select * from Quartos inner join clientes
on Quartos.idQuarto = clientes.idQuarto;



/* Buscar o nome completo e o cellar na tabela clientes que alugou o quarto de numero 505, pois a tabela quartos está vinculada à tabela clientes 
pelo campo idQuarto */
select clientes.nomeCompleto, clientes.celular from Quartos inner join clientes on Quartos.idQuarto where numeroQuarto = 101;

select clientes.nomeCompleto, clientes.checkout, clientes.checkin from Quartos inner join clientes on Quartos.idQuarto = clientes.idQuarto 
where numeroQuarto = 505;

select clientes.nomeCompleto as Nome, date_format(clientes.checkout, '%d/%m/%Y - %H:%i') as checkout from Quartos inner join clientes
on Quartos.idQuarto = clientes.idQuarto where numeroQuarto = 101;

select clientes.nomeCompleto as Nome, date_format(clientes.checkout, '%d/%m/%Y - %H:%i') as checkout from Quartos inner join clientes
on Quartos.idQuarto = clientes.idQuarto where numeroQuarto = 505;

/* Fim Clientes */

/*_____________________________________________________________________________________________________________________________________________________*/

/* Tabela Pedidos*/
 
/* dataPedido timestamp default current_timestamp, significa que a data do sistema é o mesmo do pedido
statusPedido é a situação do pedido*/

create table Pedidos (

idPedidos int key auto_increment,
dataPedido timestamp default current_timestamp,
statusPedido enum("Pendente", "Finalizado", "Cancelado") not null,
idCliente int not null,
foreign key (idCliente) references clientes (idCliente)

);

describe Pedidos;

/* Abertura de pedidos */

insert into Pedidos (statusPedido, idCliente) values ("Pendente", 1);
insert into Pedidos (statusPedido, idCliente) values ("Finalizado", 2);

select * from Pedidos;

/* Fim Pedidos*/

/*______________________________________________________________________________________________________________*/

/* Tabela Reservas */

create table Reservas (
idReserva int primary key auto_increment,
idPedidos int not null,
idQuarto int not null,
foreign key (idPedidos) references Pedidos (idPedidos),
foreign key (idQuarto) references Quartos (idQuarto)

);

drop table Reservas;

describe Reservas;

/* Fim Reservas */