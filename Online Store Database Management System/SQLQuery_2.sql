/*
# 

- **Online Store Database Project**
*/

/*
<span style="color: rgba(0, 0, 0, 0.87); font-family: Helvetica, Arial, sans-serif; font-size: 17px; background-color: rgb(255, 255, 255);">The&nbsp;</span> **Online Store Database Project** <span style="color: rgba(0, 0, 0, 0.87); font-family: Helvetica, Arial, sans-serif; font-size: 17px; background-color: rgb(255, 255, 255);">&nbsp;is designed to streamline and manage core e-commerce operations efficiently. This database system focuses on maintaining key entities like products, customers, orders, payments, and inventory, ensuring seamless business operations for an online store. The system enables the tracking of product information, customer details, order processing, payment tracking, and inventory management. By implementing this project, businesses can handle complex tasks such as adding new products, managing customer orders, processing payments, and monitoring inventory levels effectively.</span>
*/

/*
**Creating the Database in MySQL or PostgreSQL:**

**Create the Database:**
*/

CREATE DATABASE OnlineStoreDB;

use onlinestoredb;

/*
Create the Tables:

**Products Table:**

The Products table stores information about the products available in the online store, including the product ID, name, description, price, and category, helping manage the product catalog effectively..

**Structure:**

| Column Name | Data Type | Constraints |
| --- | --- | --- |
| product\_id | INT | PRIMARY KEY, AUTO\_INCREMENT |
| name | VARCHAR(25) | NOT NULL |
| description | TEXT |  |
| price | DECIMAL(10, 2) | NOT NULL |
| category | VARCHAR(50) |  |
*/

CREATE TABLE Products(

    product_id int NOT NULL auto_increment PRIMARY KEY,

    name VARCHAR(25) NOT NULL,

    description text,

    price DECIMAL(10,2) NOT NULL,

    category VARCHAR(50)

)

/*
**Customers Table:**

The Customers table stores customer details such as customer ID, name, email, phone number, and address, providing essential information for managing customer interactions and transactions within the online store.

**Structure:**

| Column Name | Data Type | Constraints |
| --- | --- | --- |
| customer\_id | INT | PRIMARY KEY, AUTO\_INCREMENT |
| name | VARCHAR(25) | NOT NULL |
| email | VARCHAR(25) | UNIQUE, NOT NULL |
| phone\_number | VARCHAR(15) |  |
| address | VARCHAR(55) |  |
*/

CREATE TABLE Customers(

    customer_id INT NOT NULL auto_increment PRIMARY KEY,

    name VARCHAR(25) NOT NULL,

    email VARCHAR(25) UNIQUE NOT NULL,

    phone_number varchar(15),

    address VARCHAR(55)

)

/*
**Orders Table:**

The **Orders** table records customer orders, tracking order ID, customer ID, order date, and status (such as 'Pending', 'Completed', or 'Cancelled'). It links orders to customers and helps manage the order lifecycle within the system.

**Structure:**

| Column Name | Data Type | Constraints |
| --- | --- | --- |
| order\_id | INT | PRIMARY KEY, AUTO\_INCREMENT |
| customer\_id | INT | FOREIGN KEY (customer\_id) REFERENCES Customers(customer\_id) |
| order\_date | DATE | NOT NULL |
| status | ENUM('Pending', 'Completed', 'Cancelled') | DEFAULT 'Pending' |
*/

CREATE TABLE Orders(

    order_id INT NOT NULL auto_increment PRIMARY KEY,

    customer_id INT,

    order_date DATE NOT NULL,

    status enum('Pending','Complete','Cancelled') DEFAULT 'Pending',

     FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)

)

/*
**Payments Table:**

The **Payments** table stores payment records associated with customer orders. It tracks the payment ID, order ID, payment date, amount, and payment status (e.g., 'Paid' or 'Unpaid'), linking payments to their respective orders to manage transaction processing.

**Structure:**

| Column Name | Data Type | Constraints |
| --- | --- | --- |
| payment\_id | INT | PRIMARY KEY, AUTO\_INCREMENT |
| order\_id | INT | FOREIGN KEY (order\_id) REFERENCES Orders(order\_id) |
| payment\_date | DATE | NOT NULL |
| amount | DECIMAL(10, 2) | NOT NULL |
| payment\_status | ENUM('Paid', 'Unpaid') | DEFAULT 'Unpaid' |
*/

CREATE TABLE Payments (

    payment_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,   -- Payment ID

    order_id INT,                                         -- Foreign key to Orders table

    payment_date DATE NOT NULL,                           -- Payment date

    amount DECIMAL(10, 2) NOT NULL,                       -- Payment amount

    payment_status ENUM('Paid', 'Unpaid') DEFAULT 'Unpaid', -- Payment status

	FOREIGN KEY (order_id) REFERENCES Orders(order_id)    -- Relating payments to orders

);



/*
**Inventory Table:**

The **Inventory** table tracks the stock levels of products in the system. It includes the inventory ID, product ID (linked to the Products table), the quantity of stock available, and the last updated date, helping manage and monitor product availability.

**Structure:**

| Column Name | Data Type | Constraints |
| --- | --- | --- |
| inventory\_id | INT | PRIMARY KEY, AUTO\_INCREMENT |
| product\_id | INT | FOREIGN KEY (product\_id) REFERENCES Products(product\_id) |
| stock\_quantity | INT | DEFAULT 0 |
| last\_updated | DATE | DEFAULT CURRENT\_DATE |
*/

CREATE TABLE Inventory(

    inventory_id INT NOT NULL auto_increment PRIMARY KEY,

    product_id INT,

    stock_quantity INT DEFAULT 0,

    last_updated DATE DEFAULT (CURRENT_DATE),

    FOREIGN KEY(product_id) REFERENCES Products(product_id)

)

/*
**Inserting Data:**

Add some sample data to the tables.

**Inserting Data into Products Table:**
*/

-- Insert Products

INSERT INTO Products (name, description, price, category) VALUES 

('Laptop', 'A high-performance laptop', 1200.00, 'Electronics'),

('Headphones', 'Wireless noise-cancelling headphones', 200.00, 'Electronics'),

('Book', 'Inspirational novel', 15.00, 'Books'),

('Office Chair', 'Ergonomic office chair', 150.00, 'Furniture'),

('Smartphone', 'Latest model smartphone', 800.00, 'Electronics'),

('Desk Lamp', 'LED desk lamp with adjustable brightness', 30.00, 'Furniture'),

('Backpack', 'Durable backpack for everyday use', 60.00, 'Accessories'),

('Coffee Maker', 'Automatic coffee maker', 100.00, 'Appliances'),

('Running Shoes', 'Comfortable running shoes', 90.00, 'Footwear'),

('Wristwatch', 'Stylish wristwatch with leather strap', 250.00, 'Accessories'),

('Tablet', '10-inch tablet with high-resolution display', 300.00, 'Electronics'),

('Gaming Console', 'Next-gen gaming console', 500.00, 'Electronics'),

('Bluetooth Speaker', 'Portable Bluetooth speaker', 80.00, 'Electronics'),

('Fitness Tracker', 'Waterproof fitness tracker', 70.00, 'Wearables'),

('Sunglasses', 'Polarized sunglasses', 120.00, 'Accessories'),

('Electric Kettle', 'Fast-boiling electric kettle', 40.00, 'Appliances'),

('Yoga Mat', 'Non-slip yoga mat', 25.00, 'Fitness'),

('Digital Camera', 'High-resolution digital camera', 600.00, 'Electronics'),

('Microwave Oven', 'Compact microwave oven', 90.00, 'Appliances'),

('Water Bottle', 'Insulated stainless steel water bottle', 20.00, 'Accessories'),

('Printer', 'All-in-one wireless printer', 150.00, 'Electronics'),

('Desk Organizer', 'Wooden desk organizer', 35.00, 'Furniture'),

('Electric Toothbrush', 'Rechargeable electric toothbrush', 50.00, 'Personal Care'),

('Hair Dryer', 'Professional hair dryer', 70.00, 'Personal Care'),

('Blender', 'High-speed blender', 120.00, 'Appliances'),

('Smartwatch', 'Smartwatch with fitness tracking', 200.00, 'Wearables'),

('Camping Tent', '4-person camping tent', 180.00, 'Outdoor'),

('Action Camera', 'Waterproof action camera', 250.00, 'Electronics'),

('Electric Scooter', 'Foldable electric scooter', 400.00, 'Transportation'),

('Air Purifier', 'HEPA air purifier', 130.00, 'Home Appliances'),

('VR Headset', 'Virtual reality headset', 350.00, 'Electronics'),

('Smart Home Hub', 'Voice-controlled smart home hub', 100.00, 'Home Automation'),

('Electric Grill', 'Indoor electric grill', 90.00, 'Appliances'),

('Noise Machine', 'White noise machine for better sleep', 40.00, 'Personal Care'),

('3D Printer', 'Desktop 3D printer', 700.00, 'Electronics'),

('Smart Thermostat', 'Wi-Fi enabled smart thermostat', 150.00, 'Home Automation'),

('Robot Vacuum', 'Automatic robot vacuum cleaner', 250.00, 'Home Appliances'),

('Electric Guitar', 'Beginner electric guitar', 300.00, 'Musical Instruments'),

('Digital Piano', '88-key digital piano', 500.00, 'Musical Instruments'),

('Treadmill', 'Foldable treadmill for home use', 600.00, 'Fitness'),

('Elliptical Trainer', 'Compact elliptical trainer', 400.00, 'Fitness'),

('Dumbbell Set', 'Adjustable dumbbell set', 150.00, 'Fitness'),

('Resistance Bands', 'Set of resistance bands', 30.00, 'Fitness'),

('Foam Roller', 'High-density foam roller', 25.00, 'Fitness'),

('Jump Rope', 'Adjustable jump rope', 15.00, 'Fitness'),

('Kettlebell Set', 'Set of kettlebells in various weights', 200.00, 'Fitness'),

('Medicine Ball', '10 lb medicine ball', 40.00, 'Fitness'),

('Pull-Up Bar', 'Doorway pull-up bar', 35.00, 'Fitness'),

('Yoga Blocks', 'Set of yoga blocks', 20.00, 'Fitness'),

('Yoga Strap', 'Cotton yoga strap', 10.00, 'Fitness'),

('Balance Board', 'Wooden balance board', 50.00, 'Fitness'),

('Exercise Mat', 'Thick exercise mat', 30.00, 'Fitness'),

('Ab Wheel', 'Ab wheel roller', 25.00, 'Fitness'),

('Gym Bag', 'Large gym bag with multiple compartments', 60.00, 'Accessories'),

('Waterproof Phone Case', 'Universal waterproof phone case', 15.00, 'Accessories'),

('Sports Watch', 'Digital sports watch with stopwatch', 80.00, 'Wearables'),

('Cycling Gloves', 'Padded cycling gloves', 25.00, 'Accessories'),

('Bike Helmet', 'Lightweight bike helmet', 70.00, 'Accessories'),

('Mountain Bike', '21-speed mountain bike', 400.00, 'Outdoor'),

('Road Bike', 'Lightweight road bike', 600.00, 'Outdoor'),

('Hybrid Bike', 'Versatile hybrid bike', 500.00, 'Outdoor'),

('Electric Bike', 'Foldable electric bike', 800.00, 'Transportation'),

('Bike Lock', 'Heavy-duty bike lock', 30.00, 'Accessories'),

('Bike Pump', 'Portable bike pump', 20.00, 'Accessories'),

('Cycling Jersey', 'Moisture-wicking cycling jersey', 40.00, 'Apparel'),

('Cycling Shorts', 'Padded cycling shorts', 50.00, 'Apparel'),

('Running Hat', 'Lightweight running hat', 20.00, 'Apparel'),

('Running Socks', 'Moisture-wicking running socks (3-pack)', 15.00, 'Apparel'),

('Trail Running Shoes', 'Durable trail running shoes', 100.00, 'Footwear'),

('Hiking Boots', 'Waterproof hiking boots', 120.00, 'Footwear'),

('Camping Stove', 'Portable camping stove', 80.00, 'Outdoor'),

('Sleeping Bag', '4-season sleeping bag', 100.00, 'Outdoor'),

('Camping Chair', 'Foldable camping chair', 40.00, 'Outdoor'),

('Cooler Box', 'Insulated cooler box', 70.00, 'Outdoor'),

('Fishing Rod', 'Lightweight fishing rod', 60.00, 'Outdoor'),

('Tackle Box', 'Multi-compartment tackle box', 30.00, 'Outdoor'),

('Hammock', 'Portable camping hammock', 50.00, 'Outdoor'),

('Binoculars', 'Compact binoculars', 80.00, 'Outdoor'),

('Ski Jacket', 'Waterproof ski jacket', 150.00, 'Apparel'),

('Ski Pants', 'Insulated ski pants', 120.00, 'Apparel'),

('Snowboard', 'All-mountain snowboard', 300.00, 'Outdoor'),

('Ski Goggles', 'Anti-fog ski goggles', 60.00, 'Accessories'),

('Winter Gloves', 'Insulated winter gloves', 40.00, 'Apparel'),

('Thermal Socks', 'Thermal wool socks (3-pack)', 25.00, 'Apparel'),

('Ice Skates', 'Figure ice skates', 100.00, 'Footwear'),

('Snowshoes', 'Adjustable snowshoes', 150.00, 'Outdoor'),

('Sled', 'Plastic snow sled', 30.00, 'Outdoor'),

('Hot Chocolate Maker', 'Electric hot chocolate maker', 40.00, 'Appliances'),

('Holiday Lights', 'String of LED holiday lights', 20.00, 'Home Decor'),

('Christmas Tree', 'Artificial Christmas tree (6 ft)', 80.00, 'Home Decor'),

('Ornaments Set', 'Set of 20 assorted ornaments', 30.00, 'Home Decor'),

('Wreath', 'Decorative holiday wreath', 25.00, 'Home Decor'),

('Gift Wrap Set', 'Holiday gift wrap set with bows and tags', 15.00, 'Stationery'),

('Advent Calendar', 'Holiday-themed advent calendar', 20.00, 'Stationery'),

('Snow Globe', 'Holiday snow globe decoration', 25.00, 'Home Decor'),

('Holiday Mug Set', 'Set of 4 holiday-themed mugs', 30.00, 'Kitchenware'),

('Festive Tablecloth', 'Holiday-themed tablecloth', 20.00, 'Home Decor');



/*
**Inserting Data into Customers Table:**
*/

-- Insert 50 Customers

INSERT INTO Customers (name, email, phone_number, address) VALUES

('John Doe', 'john@example.com', '9876543210', '123 Main St'),

('Jane Smith', 'jane@example.com', '8765432109', '456 Elm St'),

('Harry Joe', 'harry@example.com', '7654321098', '789 Oak St'),

('Marry Maria', 'marry@example.com', '6543210987', '321 Pine St'),

('Jonny Stark', 'jonny@example.com', '9123456780', '654 Maple St'),

('Jackly Rose', 'jackly@example.com', '9876501234', '545 Uhn Rt'),

('Canny Con', 'canny@example.com', '9988776655', '568 Manr Gt'),

('Emma Watson', 'emma@example.com', '9001122334', '12 Baker St'),

('Oliver Twist', 'oliver@example.com', '9012233445', '34 Cherry Lane'),

('Sophia Loren', 'sophia@example.com', '9023344556', '56 Oakwood Dr'),

('Liam Miller', 'liam@example.com', '9034455667', '78 Pinehill Rd'),

('Ava Davis', 'ava@example.com', '9045566778', '90 Maple Ave'),

('Noah Wilson', 'noah@example.com', '9056677889', '123 Lakeview St'),

('Mia Johnson', 'mia@example.com', '9067788990', '45 Hillcrest Rd'),

('Lucas Brown', 'lucas@example.com', '9078899001', '67 River Rd'),

('Isabella White', 'isabella@example.com', '9089900112', '89 Willow Ln'),

('Ethan Harris', 'ethan@example.com', '9091011223', '11 Sunset Blvd'),

('Amelia Martin', 'amelia@example.com', '9102122334', '22 Ocean Ave'),

('James Thompson', 'james@example.com', '9113233445', '33 Birchwood Dr'),

('Charlotte Garcia', 'charlotte@example.com', '9124344556', '44 Highland St'),

('Benjamin Lee', 'benjamin@example.com', '9135455667', '55 Forest Way'),

('Ella Martinez', 'ella@example.com', '9146566778', '66 Sunrise Blvd'),

('Logan Anderson', 'logan@example.com', '9157677889', '77 Oakridge Ct'),

('Grace Taylor', 'grace@example.com', '9168788990', '88 Meadow Ln'),

('Alexander Moore', 'alexander@example.com', '9179899001', '99 Parkview Dr'),

('Emily Jackson', 'emily@example.com', '9180900112', '101 Cedar St'),

('Daniel Martin', 'daniel@example.com', '9191011223', '102 Maple Grove'),

('Harper Clark', 'harper@example.com', '9202122334', '103 Ridge Rd'),

('Jacob Lewis', 'jacob@example.com', '9213233445', '104 Garden St'),

('Evelyn Walker', 'evelyn@example.com', '9224344556', '105 Bridge Ln'),

('Michael Hall', 'michael@example.com', '9235455667', '106 Brookside Dr'),

('Abigail Allen', 'abigail@example.com', '9246566778', '107 Cypress Ct'),

('William Young', 'william@example.com', '9257677889', '108 Beacon St'),

('Sofia Hernandez', 'sofia@example.com', '9268788990', '109 Orchard Rd'),

('David King', 'david@example.com', '9279899001', '110 Sunset Blvd'),

('Scarlett Wright', 'scarlett@example.com', '9280900112', '111 Pinecrest Dr'),

('Joseph Scott', 'joseph@example.com', '9291011223', '112 Lakewood Ave'),

('Victoria Green', 'victoria@example.com', '9302122334', '113 Evergreen Ln'),

('Matthew Adams', 'matthew@example.com', '9313233445', '114 Chestnut St'),

('Chloe Baker', 'chloe@example.com', '9324344556', '115 Rosewood Ct'),

('Samuel Nelson', 'samuel@example.com', '9335455667', '116 Elm Grove'),

('Avery Carter', 'avery@example.com', '9346566778', '117 Willow Dr'),

('Henry Mitchell', 'henry@example.com', '9357677889', '118 Hilltop Rd'),

('Ella Perez', 'ella.perez@example.com', '9368788990', '119 Oak Grove'),

('Jackson Roberts', 'jackson@example.com', '9379899001', '120 Silver St'),

('Luna Turner', 'luna@example.com', '9380900112', '121 Forest Ave'),

('Sebastian Phillips', 'sebastian@example.com', '9391011223', '122 Meadow Rd'),

('Aria Campbell', 'aria@example.com', '9402122334', '123 Ocean Blvd'),

('Mason Parker', 'mason@example.com', '9413233445', '124 Brookline St'),

('Layla Evans', 'layla@example.com', '9424344556', '125 Valley View');



/*
**Inserting Data into Orders Table:**
*/

-- Insert Orders

INSERT INTO Orders (customer_id, order_date, status) VALUES 

(1, '2024-10-21', 'Pending'),

(2, '2024-10-20', 'Complete'),

(3, '2024-10-19', 'Complete'),

(4, '2024-10-18', 'Cancelled'),

(5, '2024-10-17', 'Pending'),

(6, '2024-10-16', 'Complete'),

(7, '2024-10-15', 'Pending'),

(8, '2024-10-14', 'Complete'),

(9, '2024-10-13', 'Cancelled'),

(10, '2024-10-12', 'Pending'),

(11, '2024-10-11', 'Complete'),

(12, '2024-10-10', 'Pending'),

(13, '2024-10-09', 'Complete'),

(14, '2024-10-08', 'Cancelled'),

(15, '2024-10-07', 'Pending'),

(16, '2024-10-06', 'Complete'),

(17, '2024-10-05', 'Pending'),

(18, '2024-10-04', 'Complete'),

(19, '2024-10-03', 'Cancelled'),

(20, '2024-10-02', 'Pending'),

(21, '2024-10-01', 'Complete'),

(22, '2024-09-30', 'Pending'),

(23, '2024-09-29', 'Complete'),

(24, '2024-09-28', 'Cancelled'),

(25, '2024-09-27', 'Pending'),

(26, '2024-09-26', 'Complete'),

(27, '2024-09-25', 'Pending'),

(28, '2024-09-24', 'Complete'),

(29, '2024-09-23', 'Cancelled'),

(30, '2024-09-22', 'Pending'),

(31, '2024-09-21', 'Complete'),

(32, '2024-09-20', 'Pending'),

(33, '2024-09-19', 'Complete'),

(34, '2024-09-18', 'Cancelled'),

(35, '2024-09-17', 'Pending'),

(36, '2024-09-16', 'Complete'),

(37, '2024-09-15', 'Pending'),

(38, '2024-09-14', 'Complete'),

(39, '2024-09-13', 'Cancelled'),

(40, '2024-09-12', 'Pending'),

(41, '2024-09-11', 'Complete'),

(42, '2024-09-10', 'Pending'),

(43, '2024-09-09', 'Complete'),

(44, '2024-09-08', 'Cancelled'),

(45, '2024-09-07', 'Pending'),

(46, '2024-09-06', 'Complete'),

(47, '2024-09-05', 'Pending'),

(48, '2024-09-04', 'Complete'),

(49, '2024-09-03', 'Cancelled'),

(50, '2024-09-02', 'Pending');











/*
**Inserting Data into Payments Table:**
*/

-- Insert Payments

INSERT INTO Payments (order_id, payment_date, amount, payment_status) VALUES 

(153, '2024-10-21', 1200.00, 'Paid'),

(154, '2024-10-20', 200.00, 'Paid'),

(155, '2024-10-19', 150.00, 'Unpaid'),

(156, '2024-10-18', 300.00, 'Paid'),

(157, '2024-10-17', 450.00, 'Unpaid'),

(158, '2024-10-16', 600.00, 'Paid'),

(159, '2024-10-15', 750.00, 'Paid'),

(160, '2024-10-14', 900.00, 'Unpaid'),

(161, '2024-10-13', 1100.00, 'Paid'),

(162, '2024-10-12', 1300.00, 'Paid'),

(163, '2024-10-11', 1400.00, 'Unpaid'),

(164, '2024-10-10', 1600.00, 'Paid'),

(165, '2024-10-09', 1700.00, 'Paid'),

(166, '2024-10-08', 1800.00, 'Unpaid'),

(167, '2024-10-07', 1900.00, 'Paid'),

(168, '2024-10-06', 2100.00, 'Paid'),

(169, '2024-10-05', 2200.00, 'Unpaid'),

(170, '2024-10-04', 2300.00, 'Paid'),

(171, '2024-10-03', 2400.00, 'Paid'),

(172, '2024-10-02', 2500.00, 'Unpaid'),

(173, '2024-10-01', 2600.00, 'Paid'),

(174, '2024-09-30', 2700.00, 'Paid'),

(175, '2024-09-29', 2800.00, 'Unpaid'),

(176, '2024-09-28', 2900.00, 'Paid'),

(177, '2024-09-27', 3000.00, 'Paid'),

(178, '2024-09-26', 3100.00, 'Unpaid'),

(179, '2024-09-25', 3200.00, 'Paid'),

(180, '2024-09-24', 3300.00, 'Paid'),

(181, '2024-09-23', 3400.00, 'Unpaid'),

(182, '2024-09-22', 3500.00, 'Paid'),

(183, '2024-09-21', 3600.00, 'Paid'),

(184, '2024-09-20', 3700.00, 'Unpaid'),

(185, '2024-09-19', 3800.00, 'Paid'),

(186, '2024-09-18', 3900.00, 'Paid'),

(187, '2024-09-17', 4000.00, 'Unpaid'),

(188, '2024-09-16', 4100.00, 'Paid'),

(189, '2024-09-15', 4200.00, 'Paid'),

(190, '2024-09-14', 4300.00, 'Unpaid'),

(191, '2024-09-13', 4400.00, 'Paid'),

(192, '2024-09-12', 4500.00, 'Paid'),

(193, '2024-09-11', 4600.00, 'Unpaid'),

(194, '2024-09-10', 4700.00, 'Paid'),

(195, '2024-09-09', 4800.00, 'Paid'),

(196, '2024-09-08', 4900.00, 'Unpaid'),

(197, '2024-09-07', 5000.00, 'Paid'),

(198, '2024-09-06', 5100.00, 'Paid'),

(199, '2024-09-05', 5200.00, 'Unpaid'),

(200, '2024-09-04', 5300.00, 'Paid');



/*
**Inserting Data into Inventory Table:**
*/

-- Insert Inventory

INSERT INTO Inventory (product_id, stock_quantity, last_updated) VALUES 

(1, 50, '2024-10-20'),

(2, 100, '2024-10-19'),

(3, 200, '2024-10-18'),

(4, 150, '2024-10-17'),

(5, 75, '2024-10-16'),

(6, 300, '2024-10-15'),

(7, 120, '2024-10-14'),

(8, 80, '2024-10-13'),

(9, 60, '2024-10-12'),

(10, 90, '2024-10-11'),

(11, 110, '2024-10-10'),

(12, 130, '2024-10-09'),

(13, 140, '2024-10-08'),

(14, 160, '2024-10-07'),

(15, 170, '2024-10-06'),

(16, 180, '2024-10-05'),

(17, 190, '2024-10-04'),

(18, 210, '2024-10-03'),

(19, 220, '2024-10-02'),

(20, 230, '2024-10-01'),

(21, 240, '2024-09-30'),

(22, 250, '2024-09-29'),

(23, 260, '2024-09-28'),

(24, 270, '2024-09-27'),

(25, 280, '2024-09-26'),

(26, 290, '2024-09-25'),

(27, 310, '2024-09-24'),

(28, 320, '2024-09-23'),

(29, 330, '2024-09-22'),

(30, 340, '2024-09-21'),

(31, 350, '2024-09-20'),

(32, 360, '2024-09-19'),

(33, 370, '2024-09-18'),

(34, 380, '2024-09-17'),

(35, 390, '2024-09-16'),

(36, 400, '2024-09-15'),

(37, 410, '2024-09-14'),

(38, 420, '2024-09-13'),

(39, 430, '2024-09-12'),

(40, 440, '2024-09-11'),

(41, 450, '2024-09-10'),

(42, 460, '2024-09-09'),

(43, 470, '2024-09-08'),

(44, 480, '2024-09-07'),

(45, 490, '2024-09-06'),

(46, 500, '2024-09-05'),

(47, 510, '2024-09-04'),

(48, 520, '2024-09-03'),

(49, 530, '2024-09-02'),

(50, 540, '2024-09-01'),

(51, 550, '2024-08-31'),

(52, 560, '2024-08-30'),

(53, 570, '2024-08-29'),

(54, 580, '2024-08-28'),

(55, 590, '2024-08-27'),

(56, 600, '2024-08-26'),

(57, 610, '2024-08-25'),

(58, 620, '2024-08-24'),

(59, 630, '2024-08-23'),

(60, 640, '2024-08-22'),

(61, 650, '2024-08-21'),

(62, 660, '2024-08-20'),

(63, 670, '2024-08-19'),

(64, 680, '2024-08-18'),

(65, 690, '2024-08-17'),

(66, 700, '2024-08-16'),

(67, 710, '2024-08-15'),

(68, 720, '2024-08-14'),

(69, 730, '2024-08-13'),

(70, 740, '2024-08-12'),

(71, 750, '2024-08-11'),

(72, 760, '2024-08-10'),

(73, 770, '2024-08-09'),

(74, 780, '2024-08-08'),

(75, 790, '2024-08-07'),

(76, 800, '2024-08-06'),

(77, 810, '2024-08-05'),

(78, 820, '2024-08-04'),

(79, 830, '2024-08-03'),

(80, 840, '2024-08-02'),

(81, 850, '2024-08-01'),

(82, 860, '2024-07-31'),

(83, 870, '2024-07-30'),

(84, 880, '2024-07-29'),

(85, 890, '2024-07-28'),

(86, 900, '2024-07-27'),

(87, 910, '2024-07-26'),

(88, 920, '2024-07-25'),

(89, 930, '2024-07-24'),

(90, 940, '2024-07-23'),

(91, 950, '2024-07-22'),

(92, 960, '2024-07-21'),

(93, 970, '2024-07-20'),

(94, 980, '2024-07-19'),

(95, 990, '2024-07-18'),

(96, 1000, '2024-07-17'),

(97, 1010, '2024-07-16');



/*
**Writing Queries for Functionality:**
*/

/*
**Query-1: View All Products**
*/

SELECT *FROM Customers

SELECT *FROM Inventory

SELECT *FROM Orders

SELECT *FROM Products

SELECT *FROM payments



/*
**Basic Functionalities of Employee Payroll System:**

- **Add New Products:**
    - Allow users to add new products to the system.
- **Update Product Information:**
    - Update product details, including name, price, and category.
- **Delete Products:**
    - Remove products from the system when no longer available.
- **Track Customer Orders:**
    - View the status of customer orders.
- **Process Payments:**
    - Update payment status when customers complete a transaction.
- **Manage Inventory:**
    - Adjust stock levels based on new shipments and sales.
*/

/*
**Query-2: Check Product Availability**
*/

SELECT name, stock_quantity               

FROM Products p                             

JOIN Inventory i ON p.product_id = i.product_id  

WHERE stock_quantity > 0;                  

/*
**Query-3: Get Customer Details**
*/

SELECT *FROM Customers

WHERE customer_id = 1;

/*
**Query-4: Orders with Payment Status**
*/

SELECT o.order_id, o.order_date, p.payment_status  

JOIN Payments p ON o.order_id = p.order_id;        



/*
**Query-5: Pending Payments**
*/

SELECT *FROM payments

WHERE payment_status='unpaid'

/*
**Query-6: Total Sales**
*/

SELECT sum(amount) AS total_sales

FROM payments

/*
**Query-7:****Inventory Restocking**
*/

SELECT stock_quantity

FROM Inventory

JOIN Products on Inventory.product_id = Products.product_id

WHERE stock_quantity < 100;

/*
**Query-8: Customers with Multiple Orders**
*/