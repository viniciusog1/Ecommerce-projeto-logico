-- Criação do banco de dados para o cenário de E-commerce
create DATABASE ecommerce;
use ecommerce;

-- Criar tabela Cliente
create table clients(
	idClient int auto_increment primary key,
	Fname varchar(10),
	Minit char(3),
	Lname varchar(20),
	CPF char(11) not null,
	Address varchar(30),
	constraint unique_cpf_client unique(CPF)
);
            
-- Criar tabela Produto
create table product(
	idProduct int auto_increment primary key,
	Pname varchar(0) not null,
	classification_kids bool,
	category enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Moveis') default 'Eletronico',
	avaliacao float default 0,
	size varchar(10)
);

-- Criar tabela Pagamento
create table payment(
	idPayment int auto_increment primary key,
	typePayment enum('Boleto', 'Cartão', 'Dois cartões'),
	limitAvailable float
);

-- Criar tabela de relação cliente/pagamento
create table clientsPayment(
	idPayment int,
    idClient int,
    primary key(idClient, idPayment),
    constraint fk_payment_client foreign key (idClient) references clients(idClient),
    constraint fk_payment_payment foreign key (idPayment) references payment(idPayment)
);

-- Criar tabela Pedido
create table orders(
	idOrder int auto_increment primary key,
	idOrderClient int,
	orderStatus enum('Cancelado', 'Confirmado', 'Processamento') default 'Processamento',
	orderDescription varchar(255),
	sendValue float default 10,
	paymentCash bool default false,
	constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
			on update cascade
            on delete set null
);

-- Criar tabela Estoque
CREATE TABLE storageLocation(
  idStorageLocation int auto_increment primary key,
  location varchar(255)
);

-- Criar tabela de relacionamento entre Produto/Estoque
create table productStorage(
	idPSproduct int,
	idPSstorage int,
	prodQuantity int default 0,
	PRIMARY KEY(idPSproduct, idPSstorage),
	CONSTRAINT fk_storage_location_product FOREIGN KEY (idPSproduct) REFERENCES product(idProduct),
	CONSTRAINT fk_storage_location_storage FOREIGN KEY (idPSstorage) REFERENCES storageLocation(idStorageLocation)
);

-- Criar tabela Fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_cnpj_supplier unique (CNPJ)
);

-- Criar tabela Vendedor
create table seller(
	idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
  	AbstName varchar(255) not null,
    CPF char(20) not null,
  	location varchar(255),
    contact char(20) not null,
    constraint unique_cpf_seller unique (CPF)
);

-- Criar tabela Vendedor
create table productSeller(
  	idPseller int,
  	idProduct int,
  	prodQuantity int default 1,
  	primary key (idPseller, idProduct),
  	CONSTRAINT fk_product_seller FOREIGN KEY (idPseller) REFERENCES seller(idSeller),
  	CONSTRAINT fk_product_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
);
 
CREATE TABLE productOrder(
  idPOproduct int,
  idPOorder int,
  poQuantity int DEFAULT 1,
  poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
  PRIMARY KEY(idPOproduct, idPOorder),
  CONSTRAINT fk_productorder_seller FOREIGN KEY (idPOproduct) REFERENCES product(idProduct),
  CONSTRAINT fk_productorder_product FOREIGN KEY (idPOorder) REFERENCES orders(idOrder)
);

-- Mostra todas as constraints utilizadas
use information_schema;
select * from referential_constraints where constraint_schema = 'ecommerce';