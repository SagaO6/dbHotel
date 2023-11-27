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

insert into Quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, precoCafe, tipoCama, varanda) values 
("2º", "207", "Deluxe", 3, "não", "Familiar", 
"O quarto de 32m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 42, wi-fi grátis, cofre digital, 
ftigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho", "https://cf.bstatic.com/xdata/images/hotel/max1024x768/427861759.
jpg?k=8e32bd8bf0f4e883b632dc439164cad3e5fd7059a729b780ccfdb278584a311b&o=&hp=1", 3000.00, "sim", "70.00", "Queen Size", "sim");

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
insert into Pedidos (statusPedido, idCliente) values ("Pendente", 2);

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

insert into Reserva (idPedido, idQuarto, checkin, checkout) values (2, 9, "2023-11-02 14:00:00", "2023-11-05 12:00:00");


select * from Reserva;
select clientes.nomeCompleto, clientes.cpf, clientes.email, Pedidos.idPedido, Pedidos.dataPedido, Quartos.tipoQuarto, Quartos.nome, Quartos.andar,
Quartos.numeroQuarto, Quartos.preco, Reserva.checkin, Reserva.checkout 
from (Reserva inner join Pedidos on Reserva.idPedido = Pedidos.idPedido) inner join Quartos on Reserva.idQuarto = Quartos.idQuarto;

select clientes.nomeCompleto, clientes.cpf, clientes.email, Pedidos.idPedido, Pedidos.dataPedido, Quartos.tipoQuarto, Quartos.nome, Quartos.andar,
Quartos.numeroQuarto, Quartos.preco, Reserva.checkin, Reserva.checkout from clientes
inner join Pedidos on clientes.idCliente = Pedidos.idCliente 
inner join Reserva on Reserva.idPedido = Pedidos.idPedido 
inner join Quartos on Reserva.idQuarto = Quartos.idQuarto;

select sum(Quartos.preco) as total from Reserva inner join Quartos on Reserva.idQuarto = Quartos.idQuarto where idPedido = 2;

select clientes.nomeCompleto, clientes.cpf, Pedidos.idPedido, Quartos.tipoQuarto, Quartos.nome, Quartos.andar, Quartos.numeroQuarto, 
sum(Quartos.preco) as total from clientes 
inner join Pedidos on clientes.idCliente = Pedidos.idCliente 
inner join Reserva on Reserva.idPedido = Pedidos.idPedido 
inner join Quartos on Reserva.idQuarto = Quartos.idQuarto where Pedidos.idPedido = 1
group by clientes.nomeCompleto, clientes.cpf, Pedidos.idPedido, Quartos.tipoQuarto, Quartos.nome, Quartos.andar, Quartos.numeroQuarto;


/* Ana Julia dos Santos - idPedido 2
Deluxe ( 5º andar, numero 505, preço/diaria R$1000.00 )*
check in: 2023-11-02 14:00:00
checkout: 2023-11-05 12:00:00/* 