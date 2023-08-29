create database ss11_product;
use ss11_product;
create table products(
id_product int primary key auto_increment,
name_product varchar(50),
price_product int,
description_product varchar(255),
brand_product varchar(50)
);
insert into products(name_product,price_product,description_product,brand_product)
values
("Laptop",1000,"Gaming","Asus"),
("PC",1500,"Gaming","Dell"),
("Tablet",1100,"Office","Microsoft"),
("Ipad",1200,"Office","Apple");