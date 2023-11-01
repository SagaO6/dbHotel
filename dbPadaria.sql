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

select * from Pedidos inner join Clientes on Pedidos.idCliente = Clientes.idCliente;
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

select * from itensPedidos;
select Clientes.nomeCliente, Pedidos.idPedido, Pedidos.dataPedido, itensPedidos.quantidade, Produtos.nomeProduto, Produtos.precoProduto 
from (Pedidos inner join Clientes on Pedidos.idCliente = Clientes.idCliente) inner join itensPedidos on Pedidos.idPedido = itensPedidos.idPedido inner join 
Produtos on Produtos.idProduto = itensPedidos.idProduto;