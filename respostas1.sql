SELECT * FROM order_details;

-- Renomear coluna com erro de codificação
ALTER TABLE order_details
CHANGE `ï»¿order_details_id` `order_details_id` INT;


-- 1️) Qual é o intervalo de datas da tabela?
SELECT 
    MIN(order_date) AS start_date,
    MAX(order_date) AS end_date
FROM order_details;


-- 2️) Quantos pedidos foram realizados nesse intervalo?
SELECT 
    MIN(order_date) AS start_date, 
    COUNT(DISTINCT order_id) AS num_orders,
    MAX(order_date) AS end_date
FROM order_details;


-- 3️) Quantos itens foram pedidos nesse período?
SELECT COUNT(*) AS total_items
FROM order_details;


-- 4) Quais pedidos tiveram o maior número de itens?
SELECT 
    order_id, 
    COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;


-- 5) Quantos pedidos tiveram mais de 12 itens?
WITH more_than_12 AS (
    SELECT 
        order_id, 
        COUNT(item_id) AS num_items
    FROM order_details
    GROUP BY order_id
    HAVING num_items > 12
)
SELECT COUNT(*) AS quantity
FROM more_than_12;

