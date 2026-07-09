CREATE DATABASE ecommerce_sales_analytics;
USE ecommerce_sales_analytics;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    gender ENUM('Male','Female','Other'),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    registration_date DATE
);
show tables;
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL,
    description VARCHAR(255)
);
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    price DECIMAL(10,2),
    stock_quantity INT,
    brand VARCHAR(50),
    FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);
SHOW TABLES;
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    order_status VARCHAR(30),
    payment_method VARCHAR(30),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATE,
    payment_status VARCHAR(30),
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);
SHOW TABLES;
INSERT INTO categories (category_name, description) VALUES
('Electronics','Electronic gadgets and accessories'),
('Fashion','Clothing and apparel'),
('Home & Kitchen','Home appliances and kitchen items'),
('Books','Books and educational materials'),
('Beauty','Beauty and personal care'),
('Sports','Sports and fitness equipment'),
('Toys','Kids toys and games'),
('Groceries','Daily grocery products'),
('Furniture','Home and office furniture'),
('Footwear','Shoes and sandals');
SELECT * FROM categories;
INSERT INTO customers
(first_name, last_name, email, phone, gender, city, state, country, registration_date)
VALUES
('Rahul','Sharma','rahul.sharma@email.com','9876500001','Male','Bengaluru','Karnataka','India','2024-01-10'),
('Priya','Nair','priya.nair@email.com','9876500002','Female','Chennai','Tamil Nadu','India','2024-01-15'),
('Arjun','Patel','arjun.patel@email.com','9876500003','Male','Ahmedabad','Gujarat','India','2024-02-05'),
('Sneha','Reddy','sneha.reddy@email.com','9876500004','Female','Hyderabad','Telangana','India','2024-02-18'),
('Karan','Mehta','karan.mehta@email.com','9876500005','Male','Mumbai','Maharashtra','India','2024-03-02'),
('Ananya','Iyer','ananya.iyer@email.com','9876500006','Female','Coimbatore','Tamil Nadu','India','2024-03-15'),
('Vikram','Singh','vikram.singh@email.com','9876500007','Male','Delhi','Delhi','India','2024-04-01'),
('Pooja','Joshi','pooja.joshi@email.com','9876500008','Female','Pune','Maharashtra','India','2024-04-10'),
('Rohan','Das','rohan.das@email.com','9876500009','Male','Kolkata','West Bengal','India','2024-04-22'),
('Meera','Kapoor','meera.kapoor@email.com','9876500010','Female','Jaipur','Rajasthan','India','2024-05-03');
SELECT * FROM customers;
INSERT INTO customers
(first_name, last_name, email, phone, gender, city, state, country, registration_date)
VALUES
('Aisha','Khan','aisha.khan@email.com','9876500011','Female','Bhopal','Madhya Pradesh','India','2024-05-12'),
('Manoj','Verma','manoj.verma@email.com','9876500012','Male','Lucknow','Uttar Pradesh','India','2024-05-18'),
('Divya','Menon','divya.menon@email.com','9876500013','Female','Kochi','Kerala','India','2024-06-01'),
('Siddharth','Roy','siddharth.roy@email.com','9876500014','Male','Kolkata','West Bengal','India','2024-06-08'),
('Neha','Gupta','neha.gupta@email.com','9876500015','Female','Noida','Uttar Pradesh','India','2024-06-15'),
('Abhishek','Yadav','abhishek.yadav@email.com','9876500016','Male','Patna','Bihar','India','2024-06-21'),
('Kavya','Shetty','kavya.shetty@email.com','9876500017','Female','Mangaluru','Karnataka','India','2024-07-03'),
('Harsh','Jain','harsh.jain@email.com','9876500018','Male','Indore','Madhya Pradesh','India','2024-07-10'),
('Nisha','Bose','nisha.bose@email.com','9876500019','Female','Bhubaneswar','Odisha','India','2024-07-18'),
('Aman','Chopra','aman.chopra@email.com','9876500020','Male','Chandigarh','Chandigarh','India','2024-07-25');
SELECT COUNT(*) AS total_customers
FROM customers;
INSERT INTO customers
(first_name, last_name, email, phone, gender, city, state, country, registration_date)
VALUES
('Aditya','Kulkarni','aditya.kulkarni@email.com','9876500021','Male','Nagpur','Maharashtra','India','2024-08-01'),
('Riya','Shah','riya.shah@email.com','9876500022','Female','Surat','Gujarat','India','2024-08-05'),
('Nitin','Mishra','nitin.mishra@email.com','9876500023','Male','Kanpur','Uttar Pradesh','India','2024-08-09'),
('Shreya','Paul','shreya.paul@email.com','9876500024','Female','Guwahati','Assam','India','2024-08-12'),
('Akash','Saxena','akash.saxena@email.com','9876500025','Male','Dehradun','Uttarakhand','India','2024-08-18'),
('Ishita','Ghosh','ishita.ghosh@email.com','9876500026','Female','Siliguri','West Bengal','India','2024-08-22'),
('Rakesh','Pillai','rakesh.pillai@email.com','9876500027','Male','Thiruvananthapuram','Kerala','India','2024-09-01'),
('Simran','Kaur','simran.kaur@email.com','9876500028','Female','Amritsar','Punjab','India','2024-09-05'),
('Varun','Bhat','varun.bhat@email.com','9876500029','Male','Mysuru','Karnataka','India','2024-09-10'),
('Deepika','Rao','deepika.rao@email.com','9876500030','Female','Visakhapatnam','Andhra Pradesh','India','2024-09-15');
SELECT COUNT(*) AS total_customers
FROM customers;
INSERT INTO customers
(first_name, last_name, email, phone, gender, city, state, country, registration_date)
VALUES
('Arnav','Desai','arnav.desai@email.com','9876500031','Male','Vadodara','Gujarat','India','2024-09-20'),
('Pallavi','Nanda','pallavi.nanda@email.com','9876500032','Female','Cuttack','Odisha','India','2024-09-25'),
('Yash','Malhotra','yash.malhotra@email.com','9876500033','Male','Ludhiana','Punjab','India','2024-10-01'),
('Anjali','Bansal','anjali.bansal@email.com','9876500034','Female','Faridabad','Haryana','India','2024-10-05'),
('Rohit','Kumar','rohit.kumar@email.com','9876500035','Male','Ranchi','Jharkhand','India','2024-10-10'),
('Sanya','Chatterjee','sanya.chatterjee@email.com','9876500036','Female','Durgapur','West Bengal','India','2024-10-15'),
('Naveen','Reddy','naveen.reddy@email.com','9876500037','Male','Warangal','Telangana','India','2024-10-18'),
('Komal','Patil','komal.patil@email.com','9876500038','Female','Nashik','Maharashtra','India','2024-10-22'),
('Pranav','Naik','pranav.naik@email.com','9876500039','Male','Panaji','Goa','India','2024-10-25'),
('Bhavna','Agarwal','bhavna.agarwal@email.com','9876500040','Female','Agra','Uttar Pradesh','India','2024-10-30'),
('Tarun','Joshi','tarun.joshi@email.com','9876500041','Male','Udaipur','Rajasthan','India','2024-11-03'),
('Aarti','Verma','aarti.verma@email.com','9876500042','Female','Jabalpur','Madhya Pradesh','India','2024-11-07'),
('Kishore','Raman','kishore.raman@email.com','9876500043','Male','Madurai','Tamil Nadu','India','2024-11-12'),
('Lavanya','Krishnan','lavanya.krishnan@email.com','9876500044','Female','Salem','Tamil Nadu','India','2024-11-18'),
('Mohit','Soni','mohit.soni@email.com','9876500045','Male','Ajmer','Rajasthan','India','2024-11-22'),
('Nandini','Kulkarni','nandini.kulkarni@email.com','9876500046','Female','Hubballi','Karnataka','India','2024-11-25'),
('Sahil','Mehra','sahil.mehra@email.com','9876500047','Male','Shimla','Himachal Pradesh','India','2024-12-01'),
('Priti','Das','priti.das@email.com','9876500048','Female','Jamshedpur','Jharkhand','India','2024-12-06'),
('Vivek','Chauhan','vivek.chauhan@email.com','9876500049','Male','Meerut','Uttar Pradesh','India','2024-12-10'),
('Ritika','Mohan','ritika.mohan@email.com','9876500050','Female','Vijayawada','Andhra Pradesh','India','2024-12-15');
SELECT COUNT(*) AS total_customers
FROM customers;
INSERT INTO products
(product_name, category_id, price, stock_quantity, brand)
VALUES
('iPhone 16',1,79999.00,25,'Apple'),
('Samsung Galaxy S24',1,74999.00,30,'Samsung'),
('OnePlus 13',1,59999.00,20,'OnePlus'),
('Sony WH-1000XM5 Headphones',1,29999.00,15,'Sony'),
('Boat Smartwatch',1,4999.00,50,'Boat'),
('Levis Jeans',2,2499.00,40,'Levis'),
('Puma T-Shirt',2,1499.00,60,'Puma'),
('Zara Dress',2,3999.00,20,'Zara'),
('Allen Solly Shirt',2,1999.00,35,'Allen Solly'),
('Nike Hoodie',2,3499.00,25,'Nike'),
('Prestige Pressure Cooker',3,2899.00,30,'Prestige'),
('Philips Mixer Grinder',3,4999.00,18,'Philips'),
('Milton Water Bottle',3,599.00,100,'Milton'),
('Pigeon Induction Stove',3,2799.00,25,'Pigeon'),
('Butterfly Cookware Set',3,4599.00,15,'Butterfly'),
('Atomic Habits',4,599.00,50,'Penguin'),
('Rich Dad Poor Dad',4,499.00,40,'Plata Publishing'),
('Clean Code',4,899.00,30,'Pearson'),
('Deep Work',4,699.00,20,'Grand Central'),
('The Psychology of Money',4,550.00,45,'Jaico');
SELECT COUNT(*) AS total_products
FROM products;
INSERT INTO products
(product_name, category_id, price, stock_quantity, brand)
VALUES
('Lakme Face Wash',5,299.00,80,'Lakme'),
('Mamaearth Shampoo',5,449.00,60,'Mamaearth'),
('Maybelline Lipstick',5,599.00,70,'Maybelline'),
('Nivea Body Lotion',5,399.00,90,'Nivea'),
('Minimalist Vitamin C Serum',5,699.00,50,'Minimalist'),
('Cosco Football',6,999.00,35,'Cosco'),
('Yonex Badminton Racquet',6,2499.00,20,'Yonex'),
('Adidas Cricket Bat',6,3499.00,18,'Adidas'),
('Nike Football Shoes',6,4999.00,22,'Nike'),
('Decathlon Yoga Mat',6,899.00,45,'Decathlon'),
('LEGO Classic Set',7,2999.00,20,'LEGO'),
('Barbie Doll',7,1499.00,30,'Mattel'),
('Remote Control Car',7,1799.00,25,'Hot Wheels'),
('Wooden Puzzle',7,499.00,50,'Funskool'),
('Teddy Bear',7,899.00,40,'Hamleys'),
('Aashirvaad Atta 5kg',8,320.00,120,'Aashirvaad'),
('Tata Salt 1kg',8,30.00,200,'Tata'),
('Fortune Sunflower Oil 1L',8,180.00,90,'Fortune'),
('Amul Butter 500g',8,275.00,75,'Amul'),
('Bru Instant Coffee',8,420.00,65,'Bru');
SELECT COUNT(*) AS total_products
FROM products;
INSERT INTO products
(product_name, category_id, price, stock_quantity, brand)
VALUES
('Godrej Wardrobe',9,18999.00,10,'Godrej'),
('Nilkamal Office Chair',9,6499.00,20,'Nilkamal'),
('IKEA Study Table',9,7999.00,15,'IKEA'),
('Wooden Bookshelf',9,5999.00,12,'Home Centre'),
('Sofa Set',9,35999.00,8,'Urban Ladder'),
('Nike Air Max Shoes',10,6999.00,25,'Nike'),
('Adidas Running Shoes',10,6499.00,20,'Adidas'),
('Puma Sneakers',10,4999.00,30,'Puma'),
('Bata Formal Shoes',10,2999.00,40,'Bata'),
('Woodland Boots',10,5499.00,18,'Woodland'),
('Dell Inspiron Laptop',1,64999.00,15,'Dell'),
('HP Pavilion Laptop',1,62999.00,12,'HP'),
('Canon EOS Camera',1,55999.00,8,'Canon'),
('Apple AirPods Pro',1,24999.00,25,'Apple'),
('Samsung Smart TV 55"',1,68999.00,10,'Samsung'),
('US Polo T-Shirt',2,1799.00,50,'US Polo'),
('Van Heusen Blazer',2,5499.00,18,'Van Heusen'),
('H&M Jacket',2,4299.00,22,'H&M'),
('Louis Philippe Trousers',2,2799.00,30,'Louis Philippe'),
('Roadster Jeans',2,1899.00,35,'Roadster');
INSERT INTO products
(product_name, category_id, price, stock_quantity, brand)
VALUES
('Borosil Glass Set',3,899.00,50,'Borosil'),
('Kent Water Purifier',3,15999.00,10,'Kent'),
('LG Microwave Oven',3,12999.00,15,'LG'),
('Prestige Gas Stove',3,4999.00,25,'Prestige'),
('Cello Lunch Box',3,699.00,60,'Cello'),
('Ikigai',4,499.00,40,'Penguin'),
('Think Like a Monk',4,599.00,35,'HarperCollins'),
('The Alchemist',4,399.00,60,'HarperOne'),
('The Power of Habit',4,699.00,30,'Random House'),
('Zero to One',4,550.00,25,'Crown'),
('Dove Shampoo',5,349.00,80,'Dove'),
('Loreal Face Cream',5,799.00,45,'Loreal'),
('Biotique Face Pack',5,299.00,70,'Biotique'),
('Himalaya Face Wash',5,220.00,100,'Himalaya'),
('Mamaearth Onion Oil',5,499.00,65,'Mamaearth'),
('Vector X Volleyball',6,799.00,35,'Vector X'),
('Nivia Basketball',6,999.00,28,'Nivia'),
('SG Cricket Ball',6,450.00,60,'SG'),
('Yonex Shuttlecock',6,850.00,40,'Yonex'),
('Cosco Skipping Rope',6,299.00,75,'Cosco');
SELECT COUNT(*) FROM products;
INSERT INTO products
(product_name, category_id, price, stock_quantity, brand)
VALUES
('Hot Wheels Car Set',7,899.00,45,'Hot Wheels'),
('Nerf Blaster',7,1599.00,20,'Nerf'),
('UNO Cards',7,199.00,100,'Mattel'),
('Building Blocks Set',7,1299.00,35,'Funskool'),
('Kids Learning Tablet',7,2499.00,18,'PlayShifu'),
('Tata Tea Gold 1kg',8,650.00,50,'Tata'),
('Maggi Noodles Pack',8,180.00,90,'Nestle'),
('Parle-G Biscuits',8,120.00,150,'Parle'),
('Surf Excel Detergent',8,450.00,70,'HUL'),
('Ariel Washing Powder',8,520.00,60,'P&G'),
('Godrej Bed',9,24999.00,8,'Godrej'),
('Nilkamal Dining Table',9,17999.00,10,'Nilkamal'),
('Home Centre Coffee Table',9,6999.00,18,'Home Centre'),
('Urban Ladder Recliner',9,29999.00,6,'Urban Ladder'),
('Wooden TV Unit',9,12999.00,12,'IKEA'),
('Skechers Running Shoes',10,7999.00,22,'Skechers'),
('Reebok Training Shoes',10,5499.00,30,'Reebok'),
('Crocs Classic Clogs',10,3999.00,35,'Crocs'),
('Campus Casual Shoes',10,2499.00,50,'Campus'),
('Red Tape Sneakers',10,3299.00,40,'Red Tape');
SELECT COUNT(*) AS total_products
FROM products;
ALTER TABLE orders
ADD shipping_city VARCHAR(50);
INSERT INTO orders
(customer_id, order_date, total_amount, order_status, payment_method, shipping_city)
VALUES
(1,'2024-01-12',79999,'Delivered','UPI','Bengaluru'),
(2,'2024-01-18',2499,'Delivered','Credit Card','Chennai'),
(3,'2024-02-03',59999,'Delivered','Debit Card','Ahmedabad'),
(4,'2024-02-15',4999,'Shipped','UPI','Hyderabad'),
(5,'2024-03-01',2899,'Delivered','Net Banking','Mumbai'),
(6,'2024-03-12',699,'Delivered','Cash on Delivery','Coimbatore'),
(7,'2024-04-05',24999,'Delivered','Credit Card','Delhi'),
(8,'2024-04-18',1499,'Processing','UPI','Pune'),
(9,'2024-05-08',499,'Delivered','Debit Card','Kolkata'),
(10,'2024-05-21',3499,'Delivered','UPI','Jaipur'),
(11,'2024-06-02',15999,'Delivered','Credit Card','Bhopal'),
(12,'2024-06-18',320,'Delivered','Cash on Delivery','Lucknow'),
(13,'2024-07-03',899,'Shipped','UPI','Kochi'),
(14,'2024-07-20',1799,'Delivered','Debit Card','Kolkata'),
(15,'2024-08-05',6999,'Delivered','Net Banking','Noida'),
(16,'2024-08-18',550,'Processing','UPI','Patna'),
(17,'2024-09-01',64999,'Delivered','Credit Card','Mangaluru'),
(18,'2024-09-15',4999,'Delivered','Debit Card','Indore'),
(19,'2024-10-03',220,'Delivered','Cash on Delivery','Bhubaneswar'),
(20,'2024-10-20',3999,'Shipped','UPI','Chandigarh');
select * from orders;
INSERT INTO orders
(customer_id, order_date, total_amount, order_status, payment_method, shipping_city)
VALUES
(21,'2024-10-25',6999,'Delivered','Credit Card','Nagpur'),
(22,'2024-10-28',499,'Delivered','UPI','Surat'),
(23,'2024-11-02',1799,'Processing','Debit Card','Kanpur'),
(24,'2024-11-05',12999,'Delivered','Net Banking','Guwahati'),
(25,'2024-11-08',799,'Delivered','Cash on Delivery','Dehradun'),
(26,'2024-11-12',2499,'Delivered','UPI','Siliguri'),
(27,'2024-11-16',35999,'Shipped','Credit Card','Thiruvananthapuram'),
(28,'2024-11-20',699,'Delivered','UPI','Amritsar'),
(29,'2024-11-23',5499,'Delivered','Debit Card','Mysuru'),
(30,'2024-11-28',29999,'Processing','Credit Card','Visakhapatnam'),
(31,'2024-12-02',3999,'Delivered','UPI','Vadodara'),
(32,'2024-12-05',899,'Delivered','Cash on Delivery','Cuttack'),
(33,'2024-12-08',320,'Delivered','UPI','Ludhiana'),
(34,'2024-12-10',1599,'Delivered','Credit Card','Faridabad'),
(35,'2024-12-12',64999,'Delivered','Net Banking','Ranchi'),
(36,'2024-12-15',24999,'Shipped','Debit Card','Durgapur'),
(37,'2024-12-18',420,'Delivered','UPI','Warangal'),
(38,'2024-12-20',4999,'Delivered','Credit Card','Nashik'),
(39,'2024-12-22',550,'Processing','UPI','Panaji'),
(40,'2024-12-24',6999,'Delivered','Debit Card','Agra');
INSERT INTO orders
(customer_id, order_date, total_amount, order_status, payment_method, shipping_city)
VALUES
(41,'2025-01-02',79999,'Delivered','Credit Card','Udaipur'),
(42,'2025-01-05',2499,'Delivered','UPI','Jabalpur'),
(43,'2025-01-08',3499,'Delivered','Debit Card','Madurai'),
(44,'2025-01-10',499,'Delivered','Cash on Delivery','Salem'),
(45,'2025-01-12',18999,'Delivered','Credit Card','Ajmer'),
(46,'2025-01-15',699,'Shipped','UPI','Hubballi'),
(47,'2025-01-18',2799,'Delivered','Net Banking','Shimla'),
(48,'2025-01-20',599,'Delivered','Debit Card','Jamshedpur'),
(49,'2025-01-23',17999,'Delivered','Credit Card','Meerut'),
(50,'2025-01-25',899,'Delivered','UPI','Vijayawada'),
(1,'2025-02-02',4999,'Delivered','Credit Card','Bengaluru'),
(3,'2025-02-05',699,'Delivered','UPI','Ahmedabad'),
(5,'2025-02-08',24999,'Delivered','Debit Card','Mumbai'),
(7,'2025-02-12',6999,'Delivered','Credit Card','Delhi'),
(9,'2025-02-15',3499,'Shipped','UPI','Kolkata'),
(11,'2025-02-18',15999,'Delivered','Net Banking','Bhopal'),
(13,'2025-02-20',320,'Delivered','Cash on Delivery','Kochi'),
(15,'2025-02-22',999,'Delivered','UPI','Noida'),
(17,'2025-02-25',5499,'Delivered','Credit Card','Mangaluru'),
(19,'2025-02-28',220,'Delivered','Debit Card','Bhubaneswar');
SELECT COUNT(*) AS total_orders
FROM orders;
INSERT INTO orders
(customer_id, order_date, total_amount, order_status, payment_method, shipping_city)
VALUES
(22,'2025-03-01',79999,'Delivered','Credit Card','Surat'),
(24,'2025-03-03',3999,'Delivered','UPI','Guwahati'),
(26,'2025-03-05',599,'Delivered','Debit Card','Siliguri'),
(28,'2025-03-07',4999,'Delivered','UPI','Amritsar'),
(30,'2025-03-09',24999,'Shipped','Credit Card','Visakhapatnam'),
(32,'2025-03-11',799,'Delivered','Cash on Delivery','Cuttack'),
(34,'2025-03-13',12999,'Delivered','Net Banking','Faridabad'),
(36,'2025-03-15',29999,'Delivered','Credit Card','Durgapur'),
(38,'2025-03-17',420,'Delivered','UPI','Nashik'),
(40,'2025-03-19',64999,'Delivered','Debit Card','Agra'),
(42,'2025-03-21',17999,'Delivered','Credit Card','Jabalpur'),
(44,'2025-03-23',3499,'Delivered','UPI','Salem'),
(46,'2025-03-25',899,'Processing','Debit Card','Hubballi'),
(48,'2025-03-27',2499,'Delivered','UPI','Jamshedpur'),
(50,'2025-03-29',6999,'Delivered','Credit Card','Vijayawada'),
(2,'2025-04-02',499,'Delivered','Cash on Delivery','Chennai'),
(4,'2025-04-05',550,'Delivered','UPI','Hyderabad'),
(6,'2025-04-07',15999,'Delivered','Credit Card','Coimbatore'),
(8,'2025-04-09',899,'Delivered','Debit Card','Pune'),
(10,'2025-04-11',320,'Delivered','UPI','Jaipur');
INSERT INTO orders
(customer_id, order_date, total_amount, order_status, payment_method, shipping_city)
VALUES
(12,'2025-04-13',699,'Delivered','Credit Card','Lucknow'),
(14,'2025-04-15',999,'Delivered','UPI','Kolkata'),
(16,'2025-04-17',2799,'Delivered','Debit Card','Patna'),
(18,'2025-04-19',6999,'Delivered','Credit Card','Indore'),
(20,'2025-04-21',4999,'Shipped','UPI','Chandigarh'),
(21,'2025-04-23',24999,'Delivered','Net Banking','Nagpur'),
(23,'2025-04-25',35999,'Delivered','Credit Card','Kanpur'),
(25,'2025-04-27',5499,'Delivered','Debit Card','Dehradun'),
(27,'2025-04-29',220,'Delivered','UPI','Thiruvananthapuram'),
(29,'2025-05-01',799,'Delivered','Cash on Delivery','Mysuru'),
(31,'2025-05-03',12999,'Delivered','Credit Card','Vadodara'),
(33,'2025-05-05',699,'Delivered','UPI','Ludhiana'),
(35,'2025-05-07',18999,'Delivered','Debit Card','Ranchi'),
(37,'2025-05-09',2499,'Delivered','Credit Card','Warangal'),
(39,'2025-05-11',499,'Delivered','UPI','Panaji'),
(41,'2025-05-13',899,'Delivered','Cash on Delivery','Udaipur'),
(43,'2025-05-15',64999,'Delivered','Credit Card','Madurai'),
(45,'2025-05-17',3499,'Delivered','Debit Card','Ajmer'),
(47,'2025-05-19',550,'Delivered','UPI','Shimla'),
(49,'2025-05-21',15999,'Delivered','Credit Card','Meerut');
SELECT COUNT(*) AS total_orders
FROM orders;
INSERT INTO order_items
(order_id, product_id, quantity, unit_price)
VALUES
(1,1,1,79999),
(1,54,1,24999),
(2,6,1,2499),
(2,17,1,499),
(3,3,1,59999),
(3,19,1,550),
(4,5,1,4999),
(4,24,2,799),
(5,11,1,2899),
(5,62,1,899),
(6,16,1,599),
(6,67,1,499),
(7,54,1,24999),
(7,53,1,55999),
(8,7,1,1499),
(8,81,2,899),
(9,17,1,499),
(9,89,2,120),
(10,10,1,3499),
(10,97,1,3999),
(11,62,1,15999),
(11,85,2,650),
(12,96,1,320),
(12,87,2,180),
(13,68,1,599),
(13,77,1,899),
(14,83,1,1799),
(14,72,1,1499),
(15,91,1,7999),
(15,47,1,4999),
(16,18,1,899),
(16,86,1,30),
(17,51,1,64999),
(17,52,1,62999),
(18,46,1,5499),
(18,98,1,2499),
(19,74,1,220),
(19,88,1,275),
(20,8,1,3999),
(20,41,1,18999);
SELECT COUNT(*) FROM order_items;
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES
(21,91,1,7999),
(21,46,1,5499),

(22,67,1,499),
(22,88,2,275),

(23,84,1,1599),
(23,73,1,299),

(24,63,1,15999),
(24,42,1,6499),

(25,79,1,2499),
(25,95,1,520),

(26,26,1,2499),
(26,90,1,12999),

(27,45,1,35999),
(27,43,1,7999),

(28,69,1,899),
(28,87,1,180),

(29,92,1,5499),
(29,52,1,62999),

(30,94,1,29999),
(30,41,1,18999),

(31,97,1,3999),
(31,82,2,1599),

(32,62,1,899),
(32,86,2,30),

(33,96,1,320),
(33,87,2,180),

(34,72,1,1499),
(34,73,1,299),

(35,51,1,64999),
(35,53,1,55999),

(36,54,1,24999),
(36,44,1,5999),

(37,88,1,275),
(37,74,1,220),

(38,47,1,4999),
(38,91,1,7999),

(39,18,1,899),
(39,76,1,2499),

(40,94,1,29999),
(40,45,1,35999);
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES
(41,1,1,79999),
(41,54,1,24999),

(42,6,1,2499),
(42,67,1,499),

(43,10,1,3499),
(43,17,1,499),

(44,68,1,399),
(44,74,1,220),

(45,41,1,18999),
(45,63,1,15999),

(46,16,1,699),
(46,88,1,275),

(47,64,1,12999),
(47,90,1,12999),

(48,69,1,499),
(48,83,1,1799),

(49,42,1,17999),
(49,98,1,2499),

(50,62,1,899),
(50,87,1,180),

(51,47,1,4999),
(51,5,1,4999),

(52,18,1,699),
(52,16,1,599),

(53,54,1,24999),
(53,91,1,7999),

(54,92,1,5499),
(54,79,1,2499),

(55,10,1,3499),
(55,97,1,3999),

(56,63,1,15999),
(56,88,2,275),

(57,96,1,320),
(57,86,1,30),

(58,71,1,599),
(58,82,1,1599),

(59,47,1,4999),
(59,42,1,6499),

(60,74,1,220),
(60,95,1,520);
SELECT COUNT(*) AS total_order_items
FROM order_items;
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES
(61,1,1,79999),
(61,53,1,55999),

(62,8,1,3999),
(62,88,2,275),

(63,16,1,599),
(63,69,1,499),

(64,47,1,4999),
(64,92,1,5499),

(65,54,1,24999),
(65,43,1,7999),

(66,62,1,899),
(66,86,1,30),

(67,64,1,12999),
(67,11,1,2899),

(68,94,1,29999),
(68,41,1,18999),

(69,46,1,5499),
(69,72,1,1499),

(70,17,1,499),
(70,96,2,320),

(71,91,1,7999),
(71,52,1,62999),

(72,79,1,2499),
(72,97,1,3999),

(73,71,1,599),
(73,74,1,220),

(74,44,1,5999),
(74,42,1,6499),

(75,51,1,64999),
(75,54,1,24999),

(76,68,1,399),
(76,88,1,275),

(77,81,1,899),
(77,73,1,299),

(78,47,1,4999),
(78,90,1,12999),

(79,95,1,520),
(79,67,1,499),

(80,63,1,15999),
(80,98,1,2499);
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES
(81,16,1,699),
(81,87,1,180),

(82,83,1,1799),
(82,69,1,499),

(83,79,1,2499),
(83,62,1,899),

(84,47,1,4999),
(84,91,1,7999),

(85,46,1,5499),
(85,94,1,29999),

(86,54,1,24999),
(86,43,1,7999),

(87,45,1,35999),
(87,44,1,5999),

(88,92,1,5499),
(88,95,1,520),

(89,17,1,499),
(89,86,2,30),

(90,81,1,899),
(90,88,2,275),

(91,63,1,15999),
(91,42,1,6499),

(92,97,1,3999),
(92,10,1,3499),

(93,18,1,699),
(93,74,1,220),

(94,51,1,64999),
(94,52,1,62999),

(95,64,1,12999),
(95,11,1,2899),

(96,47,1,4999),
(96,82,1,1599),

(97,69,1,499),
(97,87,2,180),

(98,54,1,24999),
(98,79,1,2499),

(99,41,1,18999),
(99,94,1,29999),

(100,1,1,79999),
(100,53,1,55999);
SELECT COUNT(*) AS total_order_items
FROM order_items;
INSERT INTO payments
(order_id, payment_date, payment_status, amount)
VALUES
(1,'2024-01-12','Success',79999),
(2,'2024-01-18','Success',2499),
(3,'2024-02-03','Success',59999),
(4,'2024-02-15','Success',4999),
(5,'2024-03-01','Success',2899),
(6,'2024-03-12','Success',699),
(7,'2024-04-05','Success',24999),
(8,'2024-04-18','Pending',1499),
(9,'2024-05-08','Success',499),
(10,'2024-05-21','Success',3499),
(11,'2024-06-02','Success',15999),
(12,'2024-06-18','Success',320),
(13,'2024-07-03','Success',899),
(14,'2024-07-20','Success',1799),
(15,'2024-08-05','Success',6999),
(16,'2024-08-18','Pending',550),
(17,'2024-09-01','Success',64999),
(18,'2024-09-15','Success',4999),
(19,'2024-10-03','Success',220),
(20,'2024-10-20','Success',3999),
(21,'2024-10-25','Success',6999),
(22,'2024-10-28','Success',499),
(23,'2024-11-02','Pending',1799),
(24,'2024-11-05','Success',12999),
(25,'2024-11-08','Success',799),
(26,'2024-11-12','Success',2499),
(27,'2024-11-16','Success',35999),
(28,'2024-11-20','Success',699),
(29,'2024-11-23','Success',5499),
(30,'2024-11-28','Pending',29999),
(31,'2024-12-02','Success',3999),
(32,'2024-12-05','Success',899),
(33,'2024-12-08','Success',320),
(34,'2024-12-10','Success',1599),
(35,'2024-12-12','Success',64999),
(36,'2024-12-15','Success',24999),
(37,'2024-12-18','Success',420),
(38,'2024-12-20','Success',4999),
(39,'2024-12-22','Pending',550),
(40,'2024-12-24','Success',6999),
(41,'2025-01-02','Success',79999),
(42,'2025-01-05','Success',2499),
(43,'2025-01-08','Success',3499),
(44,'2025-01-10','Success',499),
(45,'2025-01-12','Success',18999),
(46,'2025-01-15','Success',699),
(47,'2025-01-18','Success',2799),
(48,'2025-01-20','Success',599),
(49,'2025-01-23','Success',17999),
(50,'2025-01-25','Success',899);
INSERT INTO payments
(order_id, payment_date, payment_status, amount)
VALUES
(51,'2025-02-02','Success',4999),
(52,'2025-02-05','Success',699),
(53,'2025-02-08','Success',24999),
(54,'2025-02-12','Success',6999),
(55,'2025-02-15','Success',3499),
(56,'2025-02-18','Success',15999),
(57,'2025-02-20','Success',320),
(58,'2025-02-22','Success',999),
(59,'2025-02-25','Success',5499),
(60,'2025-02-28','Success',220),
(61,'2025-03-01','Success',79999),
(62,'2025-03-03','Success',3999),
(63,'2025-03-05','Success',599),
(64,'2025-03-07','Success',4999),
(65,'2025-03-09','Success',24999),
(66,'2025-03-11','Success',799),
(67,'2025-03-13','Success',12999),
(68,'2025-03-15','Success',29999),
(69,'2025-03-17','Success',420),
(70,'2025-03-19','Success',64999),
(71,'2025-03-21','Success',17999),
(72,'2025-03-23','Pending',3499),
(73,'2025-03-25','Pending',899),
(74,'2025-03-27','Success',2499),
(75,'2025-03-29','Success',6999),
(76,'2025-04-02','Success',499),
(77,'2025-04-05','Success',550),
(78,'2025-04-07','Success',15999),
(79,'2025-04-09','Success',899),
(80,'2025-04-11','Success',320),
(81,'2025-04-13','Success',699),
(82,'2025-04-15','Success',999),
(83,'2025-04-17','Success',2799),
(84,'2025-04-19','Success',6999),
(85,'2025-04-21','Success',4999),
(86,'2025-04-23','Success',24999),
(87,'2025-04-25','Success',35999),
(88,'2025-04-27','Success',5499),
(89,'2025-04-29','Success',220),
(90,'2025-05-01','Success',799),
(91,'2025-05-03','Success',12999),
(92,'2025-05-05','Success',699),
(93,'2025-05-07','Success',18999),
(94,'2025-05-09','Success',2499),
(95,'2025-05-11','Success',499),
(96,'2025-05-13','Success',899),
(97,'2025-05-15','Success',64999),
(98,'2025-05-17','Success',3499),
(99,'2025-05-19','Success',550),
(100,'2025-05-21','Success',15999);
SELECT COUNT(*) AS total_payments
FROM payments;

SELECT SUM(amount) AS Total_Revenue
FROM payments
WHERE payment_status = 'Success';

SELECT COUNT(*) AS Total_Orders
FROM orders;

SELECT COUNT(*) AS Total_Customers
FROM customers;

SELECT
payment_method,
SUM(total_amount) AS Revenue
FROM orders
GROUP BY payment_method
ORDER BY Revenue DESC;

SELECT
order_status,
COUNT(*) AS Total_Orders
FROM orders
GROUP BY order_status;

SELECT
c.customer_id,
CONCAT(c.first_name,' ',c.last_name) AS Customer_Name,
SUM(o.total_amount) AS Total_Spent
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.customer_id,Customer_Name
ORDER BY Total_Spent DESC
LIMIT 10;

SELECT
p.product_name,
SUM(oi.quantity) AS Units_Sold
FROM products p
JOIN order_items oi
ON p.product_id=oi.product_id
GROUP BY p.product_name
ORDER BY Units_Sold DESC
LIMIT 10;

SELECT
c.category_name,
SUM(oi.quantity*oi.unit_price) AS Revenue
FROM categories c
JOIN products p
ON c.category_id=p.category_id
JOIN order_items oi
ON p.product_id=oi.product_id
GROUP BY c.category_name
ORDER BY Revenue DESC;

SELECT
shipping_city,
SUM(total_amount) AS Revenue
FROM orders
GROUP BY shipping_city
ORDER BY Revenue DESC
LIMIT 5;

SELECT
DATE_FORMAT(order_date,'%Y-%m') AS Month,
SUM(total_amount) AS Revenue
FROM orders
GROUP BY Month
ORDER BY Month;

SELECT
ROUND(AVG(total_amount),2) AS Average_Order_Value
FROM orders;

SELECT
product_name,
price
FROM products
ORDER BY price DESC
LIMIT 5;

SELECT
product_name,
stock_quantity
FROM products
WHERE stock_quantity < 20
ORDER BY stock_quantity;

SELECT
c.customer_id,
CONCAT(c.first_name,' ',c.last_name) AS Customer_Name,
COUNT(o.order_id) AS Total_Orders
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.customer_id,Customer_Name
HAVING COUNT(o.order_id)>1;

SELECT
c.category_name,
COUNT(p.product_id) AS Total_Products
FROM categories c
JOIN products p
ON c.category_id=p.category_id
GROUP BY c.category_name;

SELECT
p.product_name,
SUM(oi.quantity*oi.unit_price) AS Revenue
FROM products p
JOIN order_items oi
ON p.product_id=oi.product_id
GROUP BY p.product_name
ORDER BY Revenue DESC
LIMIT 1;

SELECT
DATE_FORMAT(order_date,'%Y-%m') AS Month,
COUNT(*) AS Total_Orders
FROM orders
GROUP BY Month
ORDER BY Month;

SELECT
payment_status,
COUNT(*) AS Total
FROM payments
GROUP BY payment_status;

SELECT
p.brand,
SUM(oi.quantity*oi.unit_price) AS Revenue
FROM products p
JOIN order_items oi
ON p.product_id=oi.product_id
GROUP BY p.brand
ORDER BY Revenue DESC;

SELECT
state,
COUNT(*) AS Total_Customers
FROM customers
GROUP BY state
ORDER BY Total_Customers DESC;

SELECT
    customer_id,
    Total_Spent,
    RANK() OVER(ORDER BY Total_Spent DESC) AS Customer_Rank
FROM (
    SELECT
        o.customer_id,
        SUM(o.total_amount) AS Total_Spent
    FROM orders o
    GROUP BY o.customer_id
) AS CustomerSales;

SELECT
    product_name,
    Revenue,
    DENSE_RANK() OVER(ORDER BY Revenue DESC) AS Product_Rank
FROM (
    SELECT
        p.product_name,
        SUM(oi.quantity*oi.unit_price) AS Revenue
    FROM products p
    JOIN order_items oi
    ON p.product_id=oi.product_id
    GROUP BY p.product_name
) AS ProductRevenue;

SELECT
order_id,
customer_id,
total_amount,
ROW_NUMBER() OVER(ORDER BY total_amount DESC) AS Row_Num
FROM orders;

WITH AvgRevenue AS
(
SELECT AVG(total_amount) AS Avg_Order
FROM orders
)
SELECT *
FROM orders
WHERE total_amount >
(
SELECT Avg_Order
FROM AvgRevenue
);

CREATE VIEW customer_sales AS
SELECT
c.customer_id,
CONCAT(c.first_name,' ',c.last_name) AS Customer_Name,
SUM(o.total_amount) AS Total_Spent
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.customer_id,Customer_Name;
SELECT *
FROM customer_sales;

CREATE VIEW product_revenue AS
SELECT
p.product_name,
SUM(oi.quantity*oi.unit_price) AS Revenue
FROM products p
JOIN order_items oi
ON p.product_id=oi.product_id
GROUP BY p.product_name;
SELECT *
FROM product_revenue;

SELECT
customer_id,
first_name,
last_name
FROM customers
WHERE customer_id NOT IN
(
SELECT customer_id
FROM orders
);

SELECT
shipping_city,
MAX(total_amount) AS Highest_Order
FROM orders
GROUP BY shipping_city;

SELECT
order_date,
total_amount,
SUM(total_amount)
OVER(ORDER BY order_date) AS Running_Revenue
FROM orders;

SELECT
p.brand,
SUM(oi.quantity*oi.unit_price) AS Revenue
FROM products p
JOIN order_items oi
ON p.product_id=oi.product_id
GROUP BY p.brand
ORDER BY Revenue DESC
LIMIT 5;