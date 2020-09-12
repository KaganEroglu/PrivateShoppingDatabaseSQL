CREATE TABLE stores (
 store_id INT IDENTITY (1, 1) PRIMARY KEY,
 store_name VARCHAR (250) NOT NULL,
 phone VARCHAR (25),
 email VARCHAR (250),
 city VARCHAR (250),
 district VARCHAR (250),
 open_adress VARCHAR (250),
 );

 CREATE TABLE categories (
 category_id INT IDENTITY (1,1) PRIMARY KEY,
 category_name VARCHAR(250),
 );

 CREATE TABLE staffs (
 staff_id INT IDENTITY (1, 1) PRIMARY KEY,
 first_name VARCHAR (50) NOT NULL,
 last_name VARCHAR (50) NOT NULL,
 email VARCHAR (250) NOT NULL UNIQUE,
 phone VARCHAR (25),
 store_id INT NOT NULL,
 FOREIGN KEY (store_id) 
        REFERENCES stores (store_id)
		
);

CREATE TABLE brands (
 brand_id INT IDENTITY (1, 1) PRIMARY KEY,
 brand_name VARCHAR (250) NOT NULL
);

 CREATE TABLE product_prices (
 product_id INT,
 price DECIMAL (10,2) NOT NULL PRIMARY KEY,
 FOREIGN KEY (product_id) 
        REFERENCES products (product_id),
);

CREATE TABLE products (
 product_id INT IDENTITY (1, 1) PRIMARY KEY,
 product_name VARCHAR (250) NOT NULL,
 brand_id INT NOT NULL,
 category_id INT NOT NULL,
 brand_name VARCHAR (250) NOT NULL,
 FOREIGN KEY (category_id) 
        REFERENCES categories (category_id), 
 FOREIGN KEY (brand_id) 
        REFERENCES brands (brand_id)
);

ALTER TABLE products
	ADD 
		price DECIMAL (10,2) NOT NULL,
		rating_star DECIMAL (2,1),
		product_information VARCHAR (999),
		customer_reviews VARCHAR (999),
		price_with_discount DECIMAL (10,2),
		FOREIGN KEY (price) 
        REFERENCES product_prices (price)
		
		

CREATE TABLE customers (
 customer_id INT IDENTITY (1, 1) PRIMARY KEY,
 first_name VARCHAR (250) NOT NULL,
 last_name VARCHAR (250) NOT NULL,
 phone VARCHAR (25),
 email VARCHAR (250) NOT NULL,
 city VARCHAR (50),
 street VARCHAR (50),
 customer_open_address VARCHAR (250),
 
);
ALTER TABLE customers
	ADD
		registered INT NOT NULL ;

CREATE TABLE orders (
 order_id INT IDENTITY (1, 1) PRIMARY KEY,
 customer_id INT,
 order_status VARCHAR(15) NOT NULL,
 order_date DATE NOT NULL,
 offered_date DATE NOT NULL,
 shipped_date DATE,
 store_id INT NOT NULL,
 staff_id INT NOT NULL,
 FOREIGN KEY (customer_id) 
        REFERENCES customers (customer_id) ,
 FOREIGN KEY (store_id) 
        REFERENCES stores (store_id), 
 FOREIGN KEY (staff_id) 
        REFERENCES staffs (staff_id),
);

CREATE TABLE order_items(
 order_id INT ,
 product_id INT NOT NULL,
 quantity INT NOT NULL,
 discount DECIMAL (4, 2) NOT NULL DEFAULT 0,
 FOREIGN KEY (order_id) 
        REFERENCES orders (order_id),
 FOREIGN KEY (product_id) 
        REFERENCES products (product_id) 
);

CREATE TABLE stocks (
 store_id INT,
 product_id INT,
 quantity INT,
 FOREIGN KEY (store_id) 
        REFERENCES stores (store_id), 
 FOREIGN KEY (product_id) 
        REFERENCES products (product_id),

);

CREATE TABLE payments (
 customer_id INT,
 price DECIMAL (10, 2) NOT NULL,
 creditcart_type VARCHAR (50),
 installment INT NOT NULL DEFAULT 0,
 shipping_fee DECIMAL (10, 2) NOT NULL,
 FOREIGN KEY (price) 
        REFERENCES product_prices (price),
);
	
 CREATE TABLE lower_clothes (
 product_id INT,
 price DECIMAL (10,2),
 size_lower INT PRIMARY KEY,
 colour VARCHAR,
 FOREIGN KEY (product_id) 
        REFERENCES products (product_id),
 FOREIGN KEY (price) 
        REFERENCES product_prices (price),
 );

 CREATE TABLE upper_clothes (
 product_id INT,
 price DECIMAL (10,2),
 size_upper INT PRIMARY KEY,
 colour VARCHAR,
 FOREIGN KEY (product_id) 
        REFERENCES products (product_id),
 FOREIGN KEY (price) 
        REFERENCES product_prices (price),
 );

 CREATE TABLE clothes (
  product_id INT,
  price DECIMAL (10,2),
  store_id INT,
  clothe_type VARCHAR(50),
  sex VARCHAR (25),
  season VARCHAR (50),
  FOREIGN KEY (product_id) 
        REFERENCES products (product_id),
  FOREIGN KEY (store_id) 
        REFERENCES stores (store_id),
  FOREIGN KEY (price) 
        REFERENCES product_prices (price),
		);

CREATE TABLE shoes (
  product_id INT,
  price DECIMAL (10,2),
  store_id INT,
  sex VARCHAR (25),
  season VARCHAR (50),
  shoe_size INT NOT NULL PRIMARY KEY,
  FOREIGN KEY (product_id) 
        REFERENCES products (product_id),
  FOREIGN KEY (store_id) 
        REFERENCES stores (store_id),
  FOREIGN KEY (price) 
        REFERENCES product_prices (price),
		);

CREATE TABLE bags (
  product_id INT,
  price DECIMAL (10,2),
  store_id INT,
  bag_type VARCHAR (25),
  colour VARCHAR (50),
  bag_name VARCHAR (250),
  FOREIGN KEY (product_id) 
        REFERENCES products (product_id),
  FOREIGN KEY (store_id) 
        REFERENCES stores (store_id),
  FOREIGN KEY (price) 
        REFERENCES product_prices (price),
		);

CREATE TABLE accesories (
  product_id INT,
  price DECIMAL (10,2),
  store_id INT,
  accesory_type VARCHAR (50),
  colour VARCHAR (50),
  accesory_name VARCHAR (250),
  sex VARCHAR (50),
  FOREIGN KEY (product_id) 
        REFERENCES products (product_id),
  FOREIGN KEY (store_id) 
        REFERENCES stores (store_id),
  FOREIGN KEY (price) 
        REFERENCES product_prices (price),
		);

CREATE TABLE cosmetics (
  product_id INT,
  price DECIMAL (10,2),
  store_id INT,
  cosmetic_type VARCHAR (50),
  cosmetic_name VARCHAR (250),
  FOREIGN KEY (product_id) 
        REFERENCES products (product_id),
  FOREIGN KEY (store_id) 
        REFERENCES stores (store_id),
  FOREIGN KEY (price) 
        REFERENCES product_prices (price),
		);