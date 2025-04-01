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

