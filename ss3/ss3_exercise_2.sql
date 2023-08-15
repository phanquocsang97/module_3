create database ss3_exercise_2;
use ss3_exercise_2;

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

insert into customers(customer_name,customer_age)
values
("Minh Quan",10),
("Ngoc Oanh",20),
("Hong Ha",50);

insert into orders(customer_id,order_date)
values
(1,"2006-3-21"),
(2,"2006-3-23"),
(1,"2006-3-16");

insert into products(product_name,product_price)
values
("May giat",3),
("Tu lanh",5),
("Dieu hoa",7),
("Quat",1),
("Bep dien",2);

insert into orders_detail(order_id,product_id,order_detail_quantity)
values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order

select orders.order_id,orders.order_date,orders.order_total_price 
from orders;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách

select customers.customer_name,products.product_name
from customers
join orders
on customers.customer_id = orders.customer_id
join orders_detail
on orders.order_id = orders_detail.order_id
join products
on orders_detail.product_id = products.product_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select customers.customer_name
from customers
left join orders
on customers.customer_id = orders.customer_id
where orders.customer_id is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
select orders_detail.order_id,orders.order_date,sum(orders_detail.order_detail_quantity * products.product_price) as total_product_price
from orders
join orders_detail
on orders.order_id = orders_detail.order_id
join products
on orders_detail.product_id = products.product_id
group by orders_detail.order_id;










