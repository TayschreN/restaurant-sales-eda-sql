-- 6) Combinar as tabelas order_details e menu_items
SELECT *
FROM order_details od
LEFT JOIN menu_items mi 
    ON od.item_id = mi.menu_item_id;


-- 7) Quais foram os itens menos e mais pedidos? E suas categorias?
SELECT 
    item_name, 
    category, 
    COUNT(order_details_id) AS num_purchases
FROM order_details od
LEFT JOIN menu_items mi 
    ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases DESC;


-- 8) Quais foram os 5 pedidos com maior valor gasto?
SELECT 
    order_id, 
    SUM(price) AS total_spend
FROM order_details od
LEFT JOIN menu_items mi 
    ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;


-- 9) Detalhar o pedido com maior valor gasto
-- (Análise por categoria)
SELECT 
    category, 
    COUNT(item_id) AS num_items
FROM order_details od
LEFT JOIN menu_items mi 
    ON od.item_id = mi.menu_item_id
WHERE order_id = 400
GROUP BY category;