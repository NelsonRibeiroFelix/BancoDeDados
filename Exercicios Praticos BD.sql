-- Contar o número total de clientes
SELECT COUNT(*) 
FROM Clientes;

-- Contar o número total de pedidos
SELECT COUNT(*)
FROM pedidos;

-- Calcular o valor total de todos os pedidos
SELECT SUM(quantidade * preco)
FROM pedidos as pe
	JOIN produtos as pr ON pr.id = pe.produto_id;

--  Calcular a média de preço dos produtos

--  Listar todos os clientes e seus pedidos

--  Listar todos os pedidos e seus produtos, incluindo pedidos sem produtos
SELECT *
FROM pedidos as pe
	LEFT JOIN produtos as pr ON pe.produto_id = pr.id;

--  Listar os produtos mais caros primeiro

--  Listar os produtos com menor estoque

--  Contar quantos pedidos foram feitos por cliente

--  Contar quantos produtos diferentes foram vendidos

--  Mostrar os clientes que não realizaram pedidos

--  Mostrar os produtos que nunca foram vendidos

--  Contar o número de pedidos feitos por dia

--  Listar os produtos mais vendidos

--  Encontrar o cliente que mais fez pedidos

--  Listar os pedidos e os clientes que os fizeram, incluindo pedidos sem clientes

--  Listar os produtos e o total de vendas por produto

--  Calcular a média de quantidade de produtos por pedido

--  Listar os pedidos ordenados por data (mais recentes primeiro)

--  Contar quantos clientes possuem telefone cadastrado

--  Encontrar o cliente que gastou mais dinheiro em pedidos.

-- Listar os 5 produtos mais vendidos.

-- Listar os clientes que já fizeram pedidos e o número de pedidos de cada um.

-- Encontrar a data com mais pedidos realizados

-- Calcular a média de valor gasto por pedido


