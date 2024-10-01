PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

CREATE TABLE categories(category_id integer auto_increment, name varchar(50) not null, primary key(category_id));
INSERT INTO categories VALUES(NULL,'Electronics');
INSERT INTO categories VALUES(NULL,'Clothing');
INSERT INTO categories VALUES(NULL,'Home and Kitchen');

CREATE TABLE IF NOT EXISTS "products" (
    product_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50),
    price DECIMAL(10, 2),
    description VARCHAR(100),
    tags VARCHAR(100),
    supplier VARCHAR(100),
    category_id INTEGER,
    FOREIGN KEY (category_id) REFERENCES categories (category_id)
);

INSERT INTO products VALUES(1,'Laptop',NULL,'High-performance laptop for professionals','electronics, portable, tech','SupplierA',1);
INSERT INTO products VALUES(2,'Headphones',129.990000000000009,'Over-ear wireless headphones','electronics, audio, accessories','SupplierB',1);
INSERT INTO products VALUES(3,'Backpack',49.9900000000000019,'Stylish and durable backpack for everyday use','fashion, accessories, travel','NULL',2);
INSERT INTO products VALUES(4,'Coffee Maker',NULL,'Automatic drip coffee maker with programmable timer','home, kitchen, appliances','NULL',3);
INSERT INTO products VALUES(5,'Fitness Tracker',79.9899999999999948,'Water-resistant fitness tracker with heart rate monitor','electronics, fitness, wearables','NULL',1);

CREATE TABLE Customer (
  customer_id SERIAL PRIMARY KEY, 
  customer_name VARCHAR(100) NOT NULL, 
  email VARCHAR(100) NOT NULL, 
  phone_number VARCHAR(20), 
  address VARCHAR(255), 
  City VARCHAR(255)
);

INSERT INTO Customer VALUES(NULL,'Alice Johnson','alice@example.com','123-456-7890','123 Main St','Cityville');
INSERT INTO Customer VALUES(NULL,'Bob Smith','bob@example.com','987-654-3210','456 Oak Ave','Townsville');
INSERT INTO Customer VALUES(NULL,'Charlie Brown','charlie@example.com','555-123-4567','789 Pine Ln','New York');
INSERT INTO Customer VALUES(NULL,'David White','david@example.com','222-333-4444','567 Maple Dr','NYC');
INSERT INTO Customer VALUES(NULL,'Eva Black','eva@example.com','999-888-7777','890 Cedar Rd','Big Apple');
INSERT INTO Customer VALUES(NULL,'Frank Green','frank@example.com','111-222-3333','123 Elm St','Gotham City');

CREATE TABLE Orders (
  order_id SERIAL PRIMARY KEY, 
  customer_id INT, 
  product_id INT, 
  total_quantity INT, 
  total_amount DECIMAL(10, 2), 
  order_rating DECIMAL(3, 1), 
  length DECIMAL(5, 2), 
  width DECIMAL(5, 2), 
  order_timestamp TIMESTAMP, 
  delivery_timestamp TIMESTAMP,
	 FOREIGN KEY (customer_id) REFERENCES Customer(customer_id), 
	 FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Orders VALUES(NULL,1,1,5,120.5,4.5,2.29999999999999982,1.80000000000000004,'2023-01-15 10:30:00','2023-01-16 15:45:00');
INSERT INTO Orders VALUES(NULL,2,2,3,75.25,3.79999999999999982,1.5,1.19999999999999995,'2023-02-03 14:20:00','2023-02-05 11:10:00');
INSERT INTO Orders VALUES(NULL,3,3,7,210.75,4.20000000000000017,2.79999999999999982,2,'2023-03-12 08:45:00','2023-03-14 09:30:00');
INSERT INTO Orders VALUES(NULL,1,4,2,50,4,1.80000000000000004,1.5,'2023-04-05 12:15:00','2023-04-07 18:20:00');

DELETE FROM sqlite_sequence;

INSERT INTO sqlite_sequence VALUES('products',5);

COMMIT;
