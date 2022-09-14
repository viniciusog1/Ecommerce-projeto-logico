# Projeto Lógico - ECommerce

Desafio da plataforma [DIO](https://dio.me) (Digital Innovation One), no bootcamp [Database Experience](https://web.dio.me/track/database-experience).

## Sobre o desafio
O desafio consiste em realizar um projeto lógico de um ambiente de ECommerce, entendendo o negócio, realizando o levantamento de requisitos, construindo o modelo conceitual e criando o script do banco de dados em questão.

[ECommerce - Projeto Conceitual](https://github.com/vncs31/Ecommerce-projeto-conceitual)

## Narrativa
### Produto
- Os produtos são vendidos por uma única plataforma online.
  Contudo, estes podem ter vendedores distintos (terceiros);
- Cada produto possui um fornecedor;
- Um ou mais produtos podem compor um pedido.

### Cliente
- O cliente pode se cadastrar no site com seu CPF ou CNPJ;
- O Endereço do cliente irá determinar o valor do frete;
- Um cliente pode comprar mais de um pedido. Este tem um período de carência para devolução do produto.

### Pedido
- O pedidos são criados por clientes e possuem informaçöes de compra, endereço e status da entrega;
- Um produto ou mais compoem o pedido;
- O pedido pode ser cancelado.

## Estoque
- O estoque possui produtos;
- Um ou mais produtos podem compor o estoque;
- o estoque possui um local;

## Fornecedor
- O fornecedor deve possuir CNPJ;
- O fornecedor deve possuir razão social;
- Um fornecedor pode fornecer vários produtos
