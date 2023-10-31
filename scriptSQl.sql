/* Banco de dados para gerenciamento de um hotel */
show databases;

show tables;

use dbHotel;





create table funcionarios (
	idFunc int primary key auto_increment,
    nomeFunc varchar (100) not null,
    login varchar(20) not null unique,
    email varchar(50) not null,
    senha varchar(255) not null,
	cargo varchar(20)
    
);

describe funcionarios;

insert into funcionarios(nomeFunc, login, email, senha, cargo) values ("Administrador", "admin", "administrador@gmail.com", md5("admin"), "Administrador");
insert into funcionarios(nomeFunc, login, email, senha, cargo) values ("Pamella Pereto", "pamellapereto", "pamella@gmail.com", md5("123@senac"), "TI");
insert into funcionarios(nomeFunc, login, email, senha, cargo) values ("Breno Silva", "brenosilva", "breno@gmail.com", md5("123@senac"), "Contabilidade");
insert into funcionarios(nomeFunc, login, email, senha, cargo) values ("Victoria Cardoso", "victoriacardoso", "victoria@gmail.com", md5("123@senac"), "RH");
insert into funcionarios(nomeFunc, login, email, senha) values ("Fellipe Coelho", "fellipe", "fellipe@gmail.com", md5("123@senac"));
insert into funcionarios(nomeFunc, login, email, senha, cargo) values ("Isack Alves", "Marcelo",  "Isack@gmail.com", md5("123@senac"), "Gerencia");

select * from funcionarios;

select login as Login, senha as Senha from funcionarios where login = "dmin" and senha = md5("admin");
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc desc;
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc asc;
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as cargo_Funcionario from funcionarios order by idFunc desc;
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as cargo_Funcionario from funcionarios where cargo <> 'null' order by idFunc desc;





create table Quartos (
idQuarto int primary key auto_increment,
andar varchar(10) not null,
numeroQuarto varchar(10) not null,
tipoQuarto varchar(50) not null,
ocupacaoMax int not null,
situacao char (3) not null,
nome varchar (50) not null,
descricao text,
foto varchar(255) not null,
preco decimal (10,2) not null,
cafeDaManha char(3) not null,
precoCafe decimal(10, 2),
tipoCama varchar (20),
varanda char (3)

);

describe Quartos;

insert into Quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, precoCafe, tipoCama, varanda) values 
("1º", "101", "Deluxe", 4, "não", "Casal", 
"O quarto de 32m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 42, wi-fi grátis, cofre digital, 
ftigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho", "https://cf.bstatic.com/xdata/images/hotel/max1024x768/427861759.
jpg?k=8e32bd8bf0f4e883b632dc439164cad3e5fd7059a729b780ccfdb278584a311b&o=&hp=1", 1200.00,  "sim", 60.00, "king size", "sim");

insert into Quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, precoCafe, tipoCama, varanda) values 
("6º", "601", "Superios", 2, "não", "Familiar", 
"O quarto de 32m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 42, wi-fi grátis, cofre digital, 
ftigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho", "https://cf.bstatic.com/xdata/images/hotel/max1024x768/427861759.
jpg?k=8e32bd8bf0f4e883b632dc439164cad3e5fd7059a729b780ccfdb278584a311b&o=&hp=1", 500.00,  "sim", 60.00, "Queen Size", "sim");

insert into Quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, precoCafe, tipoCama, varanda) values 
("5º", "505", "Deluxe", 2, "não", "Casal", 
"O quarto de 32m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 42, wi-fi grátis, cofre digital, 
ftigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho", "https://cf.bstatic.com/xdata/images/hotel/max1024x768/427861759.
jpg?k=8e32bd8bf0f4e883b632dc439164cad3e5fd7059a729b780ccfdb278584a311b&o=&hp=1", 1000.00, "Não", "", "Queen Size", "sim");

select * from Quartos;





create table clientes (
idCliente int key auto_increment,
nomeCompleto varchar (100) not null,
cpf char (14) not null unique,
rg char (12) not null unique,
email varchar (50) unique,
celular varchar (15) not null

);

describe clientes;

insert into clientes (nomeCompleto, cpf, rg, email, celular) values
("Thiago Rivas Caballero", "643.453.400-04", "41.351.272-1", "Thiago@gmail.com", "(11) 98701-0793");
insert into clientes (nomeCompleto, cpf, rg, email, celular) values
("Ana Julia dos Santos", "356.474.465-01", "48.342.289-5", "Ana@gmail.com", "(11) 98721-8931");

select * from clientes;





create table Pedidos (
idPedido int key auto_increment,
dataPedido timestamp default current_timestamp,
statusPedido enum("Pendente", "Finalizado", "Cancelado") not null,
idCliente int not null,
foreign key (idCliente) references clientes (idCliente)

);

describe Pedidos;

insert into Pedidos (statusPedido, idCliente) values ("Pendente", 1);
insert into Pedidos (statusPedido, idCliente) values ("Finalizado", 2);

select * from Pedidos;





create table Reserva (
idReserva int primary key auto_increment,
idPedido int not null,
idQuarto int not null,
foreign key (idPedido) references Pedidos (idPedido),
foreign key (idQuarto) references Quartos (idQuarto),
checkin datetime not null,
checkout datetime not null

);

describe Reserva;

insert into Reserva (idPedido, idQuarto, checkin, checkout) values (1, 4, "2023-11-02 14:00:00", "2023-11-05 12:00:00");
insert into Reserva (idPedido, idQuarto, checkin, checkout) values (1, 11, "2023-11-02 14:00:00", "2023-11-05 12:00:00");

select * from Pedidos inner join clientes on Pedidos.idClientes = clientes.idClientes;
select * from Reserva;
select Reserva.idReserva, Pedidos.idPedido, Quartos.idQuarto, Quartos.nome, Quartos.andar, Quartos.numeroQuarto 
from (Reserva inner join Pedidos on Reserva.idPedido = Pedidos.idPedido) inner join quartos on Reserva.idQuarto = Quartos.idQuarto;










create database dbPadaria;

use dbPadaria;

create table Fornecedores(
idFornecedor int primary key auto_increment,
nomeFornecedor varchar(50) not null,
cnpjFornecedor varchar(20) not null,
telefoneFornecedor varchar(20) not null,
emailFornecedor varchar(50) not null unique,
cep varchar(9),
enderecoFornecedor varchar(100), 
numeroEndereco varchar(10),
bairro varchar(40),
cidade varchar(40),
estado char(2)

);

describe Fornecedores;

insert into Fornecedores (nomeFornecedor, cnpjFornecedor, telefoneFornecedor, emailFornecedor, cep, enderecoFornecedor, numeroEndereco, bairro, cidade,
estado) values ("Rafaela", "76.172.127/0001-50", "(11)968574521", "Rafaela@gmail.com", "18600-270", "Rua Doutor Antônio Carlos de Abreu Sodré", "25",
"Centro", "Botucatu", "SP");

select * from Fornecedores;



create table Produtos(
idProduto int primary key auto_increment,
nomeProduto varchar(50) not null,
descricaoProduto text,
precoProduto decimal(10,2) not null,
estoqueProduto int not null,
categoriaProduto enum ("Pães","Bolos", "confeitaria", "salgados"),
idFornecedor int not null,
foreign key (idFornecedor) references Fornecedores (idFornecedor)

);

describe Produtos;

insert into Produtos (nomeProduto, descricaoProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor) values ("coxinha", 
"massa de farinha de trigo recheada com um delicioso recheio de frango desfiado, catupiry (um tipo de requeijão cremoso), 
temperos e, às vezes, outros ingredientes, como ervilhas e milho.", 2.00, "100", "salgados", 1);

insert into Produtos (nomeProduto, descricaoProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor) values ("pão", "Ele é feito 
a partir de uma mistura de ingredientes simples, principalmente farinha de trigo, água, sal e fermento. Aqui está uma descrição geral de um pão"
, 0.60, "10", "Pães", 1);

select * from Produtos;
select * from Produtos where categoriaProduto = "Pães";
select * from Produtos where precoProduto < 50.00 order by precoProduto asc;

create table Clientes(
idCliente int primary key auto_increment,
nomeCliente varchar(50),
cpfCliente varchar(15) not null unique,
telefoneCliente varchar(20),
emailCliente varchar(50) unique,
cep varchar(9),
enderecoCliente varchar(100),
numeroEndereco varchar(10),
bairro varchar(40),
cidade varchar(40),
estado char(2)

);

describe Clientes;

insert into Clientes (nomeCliente, cpfCliente, telefoneCliente, emailCliente, cep, enderecoCliente, numeroEndereco, bairro, cidade, estado) values 
("Roger", "844.441.178-77", "(11)935354318", "roger@gmail.com", "03415-120", "Rua João Tursi", "19", "Vila Tijuco", "Guarulhos", "SP");

select * from Clientes;

create table Pedidos(
idPedido int primary key auto_increment,
dataPedido timestamp default current_timestamp,
statusPedido enum("Pendente", "Finalizado", "Cancelado"),
idCliente int not null,
foreign key (idCliente) references Clientes (idCliente)

);

describe Pedidos;

insert into Pedidos (statusPedido, idCliente) values ("Finalizado", 1);

select * from Pedidos;

create table itensPedidos(
iditensPedidos int primary key auto_increment,
idPedido int not null,
foreign key (idPedido) references Pedidos(idPedido),
idProduto int not null,
foreign key (idProduto) references Produtos(idProduto),
quantidade int not null

);

describe itensPedidos;

insert into itensPedidos (idPedido, idProduto, quantidade) values (1, 2, 5);

delete from itensPedidos where iditensPedidos = 2; 

select * from itensPedidos;
select itensPedidos.iditensPedidos, Pedidos.idPedido, Produtos.idProduto, Produtos.nomeProduto, Produtos.precoProduto, Produtos.categoriaProduto
from (itensPedidos inner join Pedidos on itensPedidos.idPedido = Pedidos.idPedido) inner join Produtos on itensPedidos.idProduto = Produtos.idProduto;