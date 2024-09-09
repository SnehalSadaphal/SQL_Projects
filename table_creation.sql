PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

CREATE TABLE iPhone_Models (
    model_id INT PRIMARY KEY,        
    model_name VARCHAR(50) NOT NULL, 
    release_date DATE,               
    screen_size DECIMAL(3,1),        
    battery_life INT,                
    camera_specs VARCHAR(100),       
    storage_options VARCHAR(50)      
);

INSERT INTO iPhone_Models VALUES(1,'iPhone X','2017-11-03',5.79999999999999982,2716,'12MP dual','64GB, 256GB');
INSERT INTO iPhone_Models VALUES(2,'iPhone 8','2017-09-22',4.70000000000000017,1821,'12MP','64GB, 128GB');
INSERT INTO iPhone_Models VALUES(3,'iPhone 8 Plus','2017-09-22',5.5,2691,'12MP dual','64GB, 128GB, 256GB');
INSERT INTO iPhone_Models VALUES(4,'iPhone 11','2019-09-20',6.09999999999999964,3110,'12MP dual','64GB, 128GB, 256GB');
INSERT INTO iPhone_Models VALUES(5,'iPhone 11 Pro','2019-09-20',5.79999999999999982,3046,'12MP triple','64GB, 256GB, 512GB');
INSERT INTO iPhone_Models VALUES(6,'iPhone 12','2020-10-23',6.09999999999999964,2815,'12MP dual','64GB, 128GB, 256GB');
INSERT INTO iPhone_Models VALUES(7,'iPhone 12 Mini','2020-11-13',5.40000000000000035,2227,'12MP dual','64GB, 128GB, 256GB');
INSERT INTO iPhone_Models VALUES(8,'iPhone 12 Pro','2020-10-23',6.09999999999999964,2815,'12MP triple','128GB, 256GB, 512GB');
INSERT INTO iPhone_Models VALUES(9,'iPhone 13','2021-09-24',6.09999999999999964,3240,'12MP dual','128GB, 256GB, 512GB');
INSERT INTO iPhone_Models VALUES(10,'iPhone 13 Pro','2021-09-24',6.09999999999999964,3095,'12MP triple','128GB, 256GB, 512GB');

CREATE TABLE Sales_data (
Sales_id int primary key,
model_id int,
region varchar(50) not null,
units_sold int not null,
sale_date date not null,
price decimal(10,2) not null,
foreign key (model_id) references iPhone_Models(model_id)
);

INSERT INTO Sales_data VALUES(1,1,'North America',500,'2023-01-15',999.990000000000009);
INSERT INTO Sales_data VALUES(2,2,'Europe',300,'2023-02-10',799.990000000000009);
INSERT INTO Sales_data VALUES(3,3,'Asia',150,'2023-03-05',899.990000000000009);
INSERT INTO Sales_data VALUES(4,4,'North America',1000,'2023-04-12',1099.99);
INSERT INTO Sales_data VALUES(5,5,'Europe',750,'2023-05-22',1199.99);
INSERT INTO Sales_data VALUES(6,6,'Asia',400,'2023-06-03',1099.99);
INSERT INTO Sales_data VALUES(7,7,'North America',850,'2023-07-08',999.990000000000009);
INSERT INTO Sales_data VALUES(8,8,'Europe',600,'2023-08-19',1299.99);
INSERT INTO Sales_data VALUES(9,9,'Asia',500,'2023-09-10',999.990000000000009);
INSERT INTO Sales_data VALUES(10,10,'North America',1200,'2023-10-25',1099.99);

CREATE TABLE pricing (
price_id int primary key,
model_id int,
price decimal(10,2) not null,
date date not null,
foreign key(model_id) references iPhone_Models(model_id)
);

INSERT INTO pricing VALUES(1,1,999.990000000000009,'2024-01-01');
INSERT INTO pricing VALUES(2,1,949.990000000000009,'2024-02-01');
INSERT INTO pricing VALUES(3,1,899.990000000000009,'2024-03-01');
INSERT INTO pricing VALUES(4,2,1099.99,'2024-01-01');
INSERT INTO pricing VALUES(5,2,1049.99,'2024-02-01');
INSERT INTO pricing VALUES(6,2,999.990000000000009,'2024-03-01');
INSERT INTO pricing VALUES(7,3,1199.99,'2024-01-01');
INSERT INTO pricing VALUES(8,3,1149.99,'2024-02-01');
INSERT INTO pricing VALUES(9,3,1099.99,'2024-03-01');
INSERT INTO pricing VALUES(10,4,1299.99,'2024-01-01');

CREATE TABLE features (
feature_id int primary key,
model_id int,
feature_name varchar(50) not null,
feature_value varchar(50) not null,
foreign key (model_id) references iPhone_Models(model_id)
);
INSERT INTO features VALUES(1,1,'Screen Size','6.1 inches');
INSERT INTO features VALUES(2,1,'Storage','128 GB');
INSERT INTO features VALUES(3,1,'Battery Life','15 hours');
INSERT INTO features VALUES(4,2,'Screen Size','6.7 inches');
INSERT INTO features VALUES(5,2,'Storage','256 GB');
INSERT INTO features VALUES(6,2,'Battery Life','20 hours');
INSERT INTO features VALUES(7,3,'Screen Size','5.8 inches');
INSERT INTO features VALUES(8,3,'Storage','64 GB');
INSERT INTO features VALUES(9,3,'Battery Life','12 hours');
INSERT INTO features VALUES(10,4,'Screen Size','6.5 inches');

CREATE TABLE CustomerDemographics (
customer_id int primary key,
region text not null,
age_group text not null,
purchase_frequency text not null
);

INSERT INTO CustomerDemographics VALUES(1,'North America','18-24','Weekly');
INSERT INTO CustomerDemographics VALUES(2,'Europe','25-34','Monthly');
INSERT INTO CustomerDemographics VALUES(3,'Asia','35-44','Quarterly');
INSERT INTO CustomerDemographics VALUES(4,'South America','45-54','Annually');
INSERT INTO CustomerDemographics VALUES(5,'North America','55-64','Weekly');
INSERT INTO CustomerDemographics VALUES(6,'Europe','18-24','Monthly');
INSERT INTO CustomerDemographics VALUES(7,'Asia','25-34','Quarterly');
INSERT INTO CustomerDemographics VALUES(8,'South America','35-44','Annually');
INSERT INTO CustomerDemographics VALUES(9,'North America','45-54','Weekly');
INSERT INTO CustomerDemographics VALUES(10,'Europe','55-64','Monthly');

CREATE TABLE regions (
region_id int primary key,
region_name text not null,
country text
);

INSERT INTO regions VALUES(1,'North America','USA');
INSERT INTO regions VALUES(2,'Europe','Germany');
INSERT INTO regions VALUES(3,'Asia','China');
INSERT INTO regions VALUES(4,'South America','Brazil');
INSERT INTO regions VALUES(5,'Africa','South Africa');
INSERT INTO regions VALUES(6,'Oceania','Australia');
INSERT INTO regions VALUES(7,'North America','Canada');
INSERT INTO regions VALUES(8,'Europe','France');
INSERT INTO regions VALUES(9,'Asia','Japan');
INSERT INTO regions VALUES(10,'South America','Argentina');
COMMIT;
