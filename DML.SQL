
USE antique;

INSERT INTO role (name, description) VALUES ('Admin', 'Administrador del sistema');
INSERT INTO role (name, description) VALUES ('Seller', 'Vendedor de antigüedades');
INSERT INTO role (name, description) VALUES ('Buyer', 'Comprador de antigüedades');

INSERT INTO user (name, lastName, id_role) VALUES ('John', 'Doe', 1);
INSERT INTO user (name, lastName, id_role) VALUES ('Jane', 'Smith', 2);
INSERT INTO user (name, lastName, id_role) VALUES ('Alice', 'Johnson', 3);

INSERT INTO category (name) VALUES ('Muebles');
INSERT INTO category (name) VALUES ('Arte');
INSERT INTO category (name) VALUES ('Joyas');

INSERT INTO state (description) VALUES ('Excelente');
INSERT INTO state (description) VALUES ('Bueno');
INSERT INTO state (description) VALUES ('Regular');

INSERT INTO era (name) VALUES ('Renacimiento');
INSERT INTO era (name) VALUES ('Barroco');
INSERT INTO era (name) VALUES ('Moderno');

INSERT INTO status (description) VALUES ('En venta');
INSERT INTO status (description) VALUES ('Vendida');
INSERT INTO status (description) VALUES ('Retirada');

INSERT INTO product (name, description, id_category, id_state, id_era, id_status) VALUES ('Sillón Barroco', 'Sillón de época Barroca en excelente estado', 1, 1, 2, 1);
INSERT INTO product (name, description, id_category, id_state, id_era, id_status) VALUES ('Retrato Renacentista', 'Pintura Renacentista con marco dorado', 2, 1, 1, 1);
INSERT INTO product (name, description, id_category, id_state, id_era, id_status) VALUES ('Anillo Vintage', 'Anillo de oro con piedras preciosas', 3, 2, 3, 1);

INSERT INTO product_ownership (id_product, id_user, start_date, end_date) VALUES (1, 2, '2024-01-15', NULL);
INSERT INTO product_ownership (id_product, id_user, start_date, end_date) VALUES (2, 3, '2024-02-10', NULL);

INSERT INTO stock (id_product, quantity) VALUES (1, 5);
INSERT INTO stock (id_product, quantity) VALUES (2, 3);

INSERT INTO price (id_product, price, start_date, end_date) VALUES (1, 1500.00, '2024-01-01', NULL);
INSERT INTO price (id_product, price, start_date, end_date) VALUES (2, 3000.00, '2024-01-01', NULL);

INSERT INTO payment_method (name) VALUES ('Tarjeta de crédito');
INSERT INTO payment_method (name) VALUES ('Transferencia bancaria');


INSERT INTO payment (id_payment_method, payment_date, amount) VALUES (1, '2024-01-20', 1500.00);
INSERT INTO payment (id_payment_method, payment_date, amount) VALUES (2, '2024-02-15', 3000.00);

INSERT INTO delivery_method (name) VALUES ('Presencial');
INSERT INTO delivery_method (name) VALUES ('Domicilio');

INSERT INTO company (name) VALUES ('Antigüedades Express');

INSERT INTO delivery_state (description) VALUES ('Pendiente');
INSERT INTO delivery_state (description) VALUES ('Enviado');
INSERT INTO delivery_state (description) VALUES ('Entregado');

INSERT INTO delivery (id_deliveryMethod, id_company, id_deliveryState, delivery_date, address) VALUES (2, 1, 3, '2024-02-20', '123 Main St, Ciudad');

INSERT INTO activity_type (name, description) VALUES ('Venta', 'Venta de antigüedades');
INSERT INTO activity_type (name, description) VALUES ('Compra', 'Compra de antigüedades');

INSERT INTO order_activity (id_user, id_product, id_payment, id_delivery, id_type, order_date, quantity, total) VALUES (2, 1, 1, 1, 1, '2024-01-20', 1, 1500.00);
INSERT INTO order_activity (id_user, id_product, id_payment, id_delivery, id_type, order_date, quantity, total) VALUES (3, 2, 2, 1, 1, '2024-02-15', 1, 3000.00);
INSERT INTO order_activity (id_user, id_product, id_payment, id_delivery, id_type, order_date, quantity, total) VALUES (3, 2, 2, 1, 2, '2024-02-15', 1, 3000.00);
