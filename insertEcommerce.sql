-- POPULAR A TABELA CLIENTES
insert into clients (Fname, Minit, Lname, CPF, Address)
	        values('Anderson', 'G', 'Silva', '123456789', 'Rua vermelho 16 - cidade 58'),
                  ('Beatriz', 'A', 'Santos', '987654321', 'Rua azul 45- cidade 58'),
                  ('Carlos', 'E', 'Fernandes', '111222333', 'Rua roxo 19 - cidade 58'),
                  ('Denise', 'D', 'Cavalcante', '02012013045', 'Rua amarelo 46 - cidade 58'),
                  ('Everton', 'P', 'Pereira', '95115935720', 'Rua branco 75 - cidade 58'),
                  ('Vinícius', 'O.', 'Guedes', '26912172182', 'Brasília - DF');

-- POPULAR A TABELA PRODUTO
insert into product (Pname, classification_kids, category, avaliacao, size) 
			values('Fone', false, 'Eletrônico', '4', null),
				  ('Celular', false, 'Eletrônico', '5', null),
                  ('Mouse', false, 'Eletrônico', '3', null),
                  ('Carrinho', true, 'Brinquedos', '4', null),
                  ('Sofá', false, 'Móveis', '2', '4x80x50'),
                  ('Camisa', false, 'Vestimenta', '1', null);

-- POPULAR A TABELA PEDIDO
insert into orders (idOrderClient, orderStatus, sendValue, paymentCash)
			values(1, default, 10, 1),
				  (2, 'Cancelado', 50, 0),
                  (3, 'Confirmado', 150, 1),
                  (4, 'Confirmado', null, 1),
                  (5, default, null, 0);

-- POPULAR A TABELA VENDEDOR
insert into seller (SocialName, AbstName, CPF, location, contact) 
			values('José', 'Silva', '243456789', 'São Paulo', '(19) 91010-2020'),
				  ('Pedro', 'Pereira', '987654321', 'São Paulo', '(13) 91613-2570'),
                  ('Camila', 'Sabrina', '156156497', 'Minas Gerais', '(85) 91894-1065'),
                  ('Derik', 'Dante', '4892561795', 'Brasília', '(61) 99841-8974'),
                  ('Jilberto', 'Jonas', '189745045', 'Espirito Santo', '(91) 91189-2492');
                  
-- POPULAR A TABELA PRODUTO/VENDEDOR
insert into productSeller (idPseller, idProduct, prodQuantity)
			values(1, 13, 5),
				  (2, 14, 4),
                  (3, 15, 9),
                  (4, 16, 18),
                  (5, 17, 2),
                  (5, 15, 12),
                  (5, 13, 20);

-- POPULAR A TABELA FORNECEDOR
insert into supplier (SocialName, CNPJ, contact)
			values('Mercado Brasileiro', '123456789101145', 'mrcdbr@gmail.com'),
				  ('Mercado Português', '876543219101234', 'mrcdpt@gmail.com');
                  
-- POPULAR A TABELA ESTOQUE
insert into storageLocation (location)
			values('São Paulo'),
				  ('Belo Horizonte'),
                  ('Salvador'),
                  ('Goiás'),
				  ('Brasília');                  
                  
-- POPULAR A TABELA PRODUTO/ESTOQUE
insert into productStorage (idPSproduct, idPSstorage, prodQuantity)
			values(13, 1, 504),
				  (14, 1, 228),
                  (15, 2, 316),
                  (16, 2, 196),
                  (17, 5, 87);

-- POPULAR A TABELA PRODUTO/PEDIDO
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
			values(13, 1, 3, default),
				  (14, 1, 5, 'Sem estoque'),
                  (15, 1, 1, default),
                  (16, 2, 1, default),
				  (14, 2, 1, 'Sem estoque'),
                  (15, 3, 6, default),
                  (16, 4, 9, default),
                  (17, 5, 12, 'Sem estoque');
                  
-- POPULAR A TABELA PAGAMENTO
insert into payment(typePayment, limitAvailable)
			values('Boleto', null),
				  ('Cartão', 500),
                  ('Cartão', 100),
                  ('Cartão', 3000),
                  ('Dois cartões', 10000);
                  
-- POPULAR A TABELA CLIENTE/PAGAMENTO
insert into clientsPayment(idPayment, idClient)
			values(1, 1),
				  (1, 2),
                  (1, 3),
                  (2, 4),
                  (2, 5),
                  (5, 6);

select Fname, typePayment, limitAvailable from clientsPayment cp, clients c, payment p
	where cp.idClient = c.idClient and cp.idPayment = p.idPayment;

select * from productOrder;

select SocialName, Pname, prodQuantity from productSeller ps,
 product p, seller s where s.idSeller = idPseller and p.idProduct = ps.idProduct;
select * from clients;
select * from orders;
select * from product;
select * from seller;
delete from orders where idOrderClient = 6;
select Fname,Lname, idOrder, orderStatus, sendValue from clients c, orders o where c.idClient = idOrderClient;