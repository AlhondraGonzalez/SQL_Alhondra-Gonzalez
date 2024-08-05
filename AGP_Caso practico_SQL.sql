--CASO PRÁCTICO ALHONDRA MARIA GONZALEZ PEREZ--

--CONTEXTO:El restaurante "Sabores del Mundo", es conocido por su auténtica cocina y su ambiente acogedor.
--Este restaurante lanzó un nuevo menú a principios de año y ha estado recopilando información detallada sobre
--las transacciones de los clientes para identificar áreas de oportunidad y aprovechar al máximo sus datos para optimizar las ventas--


--Identificar cuáles son los productos del menú que han tenido más éxito y cuales son los que menos han gustado a los clientes--

--a) Crear la base de datos con el archivo create_restaurant_db.sql--
SELECT *
FROM menu_items;

--b) Explorar la tabla “menu_items” para conocer los productos del menú.--
--b.1. Encontrar el número de artículos en el menú:RESPUESTA = 32 ARTÍCULOS--
SELECT COUNT(menu_item_id)
FROM menu_items;

--b.2.1 ¿Cuál es el artículo menos caro? RESPUESTA = EDAMAME--
SELECT *
FROM menu_items
ORDER BY price ASC
LIMIT 1;

--b.2.2 ¿Cuál es el artículo más caro en el menú? RESPUESTA = SHRIMP SCAMPI--
SELECT *
FROM menu_items
ORDER BY price DESC
LIMIT 1;

--b.3. ¿Cuántos platos americanos hay en el menú? RESPUESTA = 6 PLATOS AMERICANOS --
SELECT COUNT (category)
FROM menu_items
WHERE category ='American'

--b.4. ¿Cuál es el precio promedio de los platos? RESPUESTA = PRECIO PROMEDIO 13.2859--
SELECT AVG (price)
FROM menu_items;

--c.Explorar la tabla “order_details” para conocer los datos que han sido recolectados--
SELECT *
FROM order_details;

--c.1  ¿Cuántos pedidos únicos se realizaron en total? RESPUESTA = 32 PEDIDOS ÚNICOS EN TOTAL--
SELECT COUNT (DISTINCT (item_id))
FROM order_details;

--c.2. ¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos? RESPUESTA= 1- 440 / 2- 2675 / 3-  3473 / 4- 4305 / 5- 443--
SELECT order_id, COUNT (order_id)
FROM order_details
GROUP BY order_id
ORDER BY 2 DESC
LIMIT 5;

--c.3.1 ¿Cuándo se realizó el primer pedido? RESPUESTA = 2023-01-01 11:38:36 FECHA DEL PRIMER PEDIDO--
SELECT order_date, order_time
FROM order_details
ORDER BY order_date ASC
LIMIT 1;

--c.3.2 ¿Cuándo se realizó el último pedido? RESPUESTA = 2023-03-31 11:22:20 FECHA DEL ÚLTIMO PEDIDO--
SELECT order_date, order_time
FROM order_details
ORDER BY order_date DESC
LIMIT 1;

--c.4 ¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'? RESPUESTA = 308 PEDIDOS--
SELECT COUNT (DISTINCT (order_id))
FROM order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-01-05';

--d) /* Usar ambas tablas para conocer la reacción de los clientes respecto al menú.--
-- Realizar un left join entre entre order_details y menu_items con el identificador item_id(tabla order_details) y menu_item_id(tabla menu_items).--
SELECT *
FROM order_details AS AM1
LEFT JOIN menu_items AS AM2
ON AM1.item_id = AM2.menu_item_id;

--e) Una vez que hayas explorado los datos en las tablas correspondientes y respondido las preguntas planteadas, realiza un análisis adicional utilizando este join entre las tablas--
--El objetivo es identificar 5 puntos clave que puedan ser de utilidad para los dueños del restaurante en el lanzamiento de su nuevo menú. Para ello, crea tus propias consultas y--
--utiliza los resultados obtenidos para llegar a estas conclusiones.--


--PUNTO 1. ¿Cuál es la comida que da más ganancia? RESPUESTA= Korean Beef Bowl (10554.60) ES LA COMIDA DE MÁS GANANCIA--
SELECT item_name, SUM (price)
FROM order_details AS AM1
LEFT JOIN menu_items AS AM2
ON AM1.item_id = AM2.menu_item_id
GROUP BY item_name
ORDER BY SUM (price) DESC;

--PUNTO 2. ¿Cuál es la comida que da menos ganancia? RESPUESTA= Chicken Tacos(1469.85) ES LA COMIDA DE MENOS GANANCIA--
SELECT item_name, SUM (price)
FROM order_details AS AM1
LEFT JOIN menu_items AS AM2
ON AM1.item_id = AM2.menu_item_id
GROUP BY item_name
ORDER BY SUM (price) ASC;

--PUNTO 3. ¿Cuál es la comida más vendida? RESPUESTA = Hamburger (622) ES LA COMIDA MÁS VENDIDA--
SELECT item_name, COUNT (item_name)
FROM order_details AS AM1
LEFT JOIN menu_items AS AM2
ON AM1.item_id = AM2.menu_item_id
GROUP BY item_name
ORDER BY COUNT (item_name) DESC
LIMIT 1;

--PUNTO 4. ¿Cuál categoria de comida es la más vendida? RESPUESTA= Asian (3470) ES LA CATEGORIA DE COMIDA MÁS VENDIDA--
SELECT category, COUNT (category)
FROM order_details AS AM1
LEFT JOIN menu_items AS AM2
ON AM1.item_id = AM2.menu_item_id
GROUP BY category
ORDER BY COUNT (category) DESC
LIMIT 1;

--PUNTO 5. ¿Cuál categoria de comida es la menos vendida? RESPUETA= American (2734) ES LA CATEGORIA DE COMIDA MENOS VENDIDA--
SELECT category, COUNT (category)
FROM order_details AS AM1
LEFT JOIN menu_items AS AM2
ON AM1.item_id = AM2.menu_item_id
GROUP BY category
ORDER BY COUNT (category) ASC
LIMIT 2;


