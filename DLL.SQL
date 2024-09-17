CREATE DATABASE IF NOT EXISTS antique;

USE antique;

CREATE TABLE role (
  id_role INT(10) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  description TEXT
);

CREATE TABLE user (
  id_user INT(10) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  lastName VARCHAR(50) NOT NULL,
  id_role INT(10),
  CONSTRAINT FK_user_role FOREIGN KEY (id_role) REFERENCES role(id_role)
);

CREATE TABLE category (
  id_category INT(10) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE state (
  id_state INT(10) PRIMARY KEY AUTO_INCREMENT,
  description VARCHAR(100) NOT NULL
);

CREATE TABLE era (
  id_era INT(10) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE status (
  id_status INT(10) PRIMARY KEY AUTO_INCREMENT,
  description VARCHAR(50) NOT NULL
);

CREATE TABLE product (
  id_product INT(10) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  id_category INT(10),
  id_state INT(10),
  id_era INT(10),
  id_status INT(10),
  CONSTRAINT FK_category FOREIGN KEY (id_category) REFERENCES category(id_category),
  CONSTRAINT FK_state FOREIGN KEY (id_state) REFERENCES state(id_state),
  CONSTRAINT FK_era FOREIGN KEY (id_era) REFERENCES era(id_era),
  CONSTRAINT FK_status FOREIGN KEY (id_status) REFERENCES status(id_status)
);

CREATE TABLE product_ownership (
  id_ownership INT(10) PRIMARY KEY AUTO_INCREMENT,
  id_product INT(10),
  id_user INT(10),
  start_date DATE NOT NULL,
  end_date DATE,
  CONSTRAINT FK_product_ownership FOREIGN KEY (id_product) REFERENCES product(id_product),
  CONSTRAINT FK_user_ownership FOREIGN KEY (id_user) REFERENCES user(id_user)
);

CREATE TABLE stock (
  id_stock INT(10) PRIMARY KEY AUTO_INCREMENT,
  id_product INT(10),
  quantity INT(5) NOT NULL,
  CONSTRAINT FK_stock_product FOREIGN KEY (id_product) REFERENCES product(id_product)
);

CREATE TABLE price (
  id_price INT(10) PRIMARY KEY AUTO_INCREMENT,
  id_product INT(10),
  price DECIMAL(10, 2) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  CONSTRAINT FK_price_product FOREIGN KEY (id_product) REFERENCES product(id_product)
);

CREATE TABLE payment_method (
  id_payment_method INT(10) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL
);


CREATE TABLE payment (
  id_payment INT(10) PRIMARY KEY AUTO_INCREMENT,
  id_payment_method INT(10) NOT NULL,
  payment_date DATE NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  CONSTRAINT FK_payment_method FOREIGN KEY (id_payment_method) REFERENCES payment_method(id_payment_method)
);

CREATE TABLE delivery_method (
  id_deliveryMethod INT(10) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE company (
  id_company INT(10) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE delivery_state (
  id_deliveryState INT(10) PRIMARY KEY AUTO_INCREMENT,
  description VARCHAR(100) NOT NULL
);

CREATE TABLE delivery (
  id_delivery INT(10) PRIMARY KEY AUTO_INCREMENT,
  id_deliveryMethod INT(10),
  id_company INT(10),
  id_deliveryState INT(10),
  delivery_date DATE,
  address VARCHAR(255),
  CONSTRAINT FK_delivery_method FOREIGN KEY (id_deliveryMethod) REFERENCES delivery_method(id_deliveryMethod),
  CONSTRAINT FK_deliveryState FOREIGN KEY (id_deliveryState) REFERENCES delivery_state(id_deliveryState),
  CONSTRAINT FK_company_delivery FOREIGN KEY (id_company) REFERENCES company(id_company)
);

CREATE TABLE activity_type (
  id_type INT(10) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  description TEXT
);

CREATE TABLE order_activity (
  id_orderActivity INT(10) PRIMARY KEY AUTO_INCREMENT,
  id_user INT(10),
  id_product INT(10),
  id_payment INT(10),
  id_delivery INT(10),
  id_type INT(10), 
  order_date DATE NOT NULL,
  quantity INT(5) NOT NULL,
  total DECIMAL(10,2) NOT NULL,
  CONSTRAINT FK_user_orderActivity FOREIGN KEY (id_user) REFERENCES user(id_user),
  CONSTRAINT FK_product_orderActivity FOREIGN KEY (id_product) REFERENCES product(id_product),
  CONSTRAINT FK_payment_orderActivity FOREIGN KEY (id_payment) REFERENCES payment(id_payment),
  CONSTRAINT FK_delivery_orderActivity FOREIGN KEY (id_delivery) REFERENCES delivery(id_delivery),
  CONSTRAINT FK_type_orderActivity FOREIGN KEY (id_type) REFERENCES activity_type(id_type)
);