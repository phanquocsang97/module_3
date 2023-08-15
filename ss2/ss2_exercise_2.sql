create database ss2_exercise_2;
use ss2_exercise_2;

create table customers(
customer_id int primary key auto_increment,
customer_name varchar(50),
customer_age int
);

create table orders(
order_id int primary key auto_increment,
customer_id int,
order_date date,
order_total_price int,
foreign key(customer_id) references customers(customer_id)
);

create table products(
product_id int primary key auto_increment,
product_name varchar(50),
product_price int
);

create table orders_detail(
order_id int,
product_id int,
order_detail_quantity int,
foreign key(order_id) references orders(order_id),
foreign key(product_id) references products(product_id)
); 


