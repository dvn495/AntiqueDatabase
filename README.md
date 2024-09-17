![](/img/logico.png)

![](/img/Entidades.png)


### Consultas SQL

1. Consulta para listar todas las antigüedades disponibles para la venta:

   ```sql
   SELECT p.name AS product_name, c.name AS category_name, pr.price, s.description AS state_description
   FROM product p
   JOIN category c ON p.id_category = c.id_category
   JOIN state s ON p.id_state = s.id_state
   JOIN price pr ON p.id_product = pr.id_product
   WHERE p.id_status = (SELECT id_status FROM status WHERE description = 'En venta') AND pr.end_date IS NULL;
   
   +----------------------+---------------+---------+-------------------+
   | product_name         | category_name | price   | state_description |
   +----------------------+---------------+---------+-------------------+
   | Sillón Barroco       | Muebles       | 1500.00 | Excelente         |
   | Retrato Renacentista | Arte          | 3000.00 | Excelente         |
   +----------------------+---------------+---------+-------------------+
   ```

2. Consulta para buscar antigüedades por categoría y rango de precio:

   ```sql
   SELECT p.name AS product_name, pr.price
   FROM product p
   JOIN category c ON p.id_category = c.id_category
   JOIN price pr ON p.id_product = pr.id_product
   WHERE c.name = 'Muebles' AND pr.price BETWEEN 500 AND 2000 AND pr.end_date IS NULL;
   +-----------------+---------+
   | product_name    | price   |
   +-----------------+---------+
   | Sillón Barroco  | 1500.00 |
   +-----------------+---------+
   ```

3. Consulta para mostrar el historial de ventas de un cliente específico:

   ```sql
   SELECT p.name AS product_name, o.order_date, pr.price AS sale_price, u.name AS buyer_name
   FROM order_activity o
   JOIN product p ON o.id_product = p.id_product
   JOIN price pr ON p.id_product = pr.id_product
   JOIN user u ON o.id_user = u.id_user
   WHERE u.name = 'Alice' AND pr.end_date IS NULL AND o.id_type = (SELECT id_type FROM activity_type WHERE name = 'Venta');
   +----------------------+------------+------------+------------+
   | product_name         | order_date | sale_price | buyer_name |
   +----------------------+------------+------------+------------+
   | Retrato Renacentista | 2024-02-15 |    3000.00 | Alice      |
   +----------------------+------------+------------+------------+
   ```

4. Consulta para obtener el total de ventas realizadas en un periodo de tiempo:

   ```sql
   SELECT COUNT(o.id_orderActivity) AS total_sales
   FROM order_activity o
   WHERE o.order_date BETWEEN '2024-01-01' AND '2024-01-31'AND o.id_type = (SELECT id_type FROM activity_type WHERE name = 'Venta');
   +-------------+
   | total_sales |
   +-------------+
   |           1 |
   +-------------+
   ```

5. Consulta para encontrar los clientes más activos (con más compras realizadas):

   ```sql
   SELECT u.name, COUNT(o.id_orderActivity) AS number_of_purchases
   FROM order_activity o
   JOIN user u ON o.id_user = u.id_user
   WHERE o.id_type = (SELECT id_type FROM activity_type WHERE name = 'Compra')
   GROUP BY u.name
   ORDER BY number_of_purchases DESC;
   +-------+---------------------+
   | name  | number_of_purchases |
   +-------+---------------------+
   | Alice |                   1 |
   +-------+---------------------+
   ```

6. Consulta para listar las antigüedades vendidas en un rango de fechas específico:

   ```sql
   SELECT o.order_date,pr.name AS product_name,u.name AS seller_name, b.name AS buyer_name
   FROM order_activity o
   JOIN product pr ON o.id_product = pr.id_product
   JOIN user u ON o.id_user = u.id_user
   JOIN payment p ON o.id_payment = p.id_payment
   JOIN product_ownership po ON pr.id_product = po.id_product
   JOIN user b ON po.id_user = b.id_user
   WHERE o.order_date BETWEEN '2024-01-01' AND '2024-01-31'AND o.id_type = (SELECT id_type FROM activity_type WHERE name = 'Venta');
   +------------+-----------------+-------------+------------+
   | order_date | product_name    | seller_name | buyer_name |
   +------------+-----------------+-------------+------------+
   | 2024-01-20 | Sillón Barroco  | Jane        | Jane       |
   +------------+-----------------+-------------+------------+
   ```

7. Consulta para obtener un informe de inventario actual:

   ```sql
   SELECT c.name AS category_name, SUM(s.quantity) AS total_quantity
   FROM stock s
   JOIN product p ON s.id_product = p.id_product
   JOIN category c ON p.id_category = c.id_category
   GROUP BY c.name;
   +---------------+----------------+
   | category_name | total_quantity |
   +---------------+----------------+
   | Muebles       |              5 |
   | Arte          |              3 |
   +---------------+----------------+
   ```

