create database ss5_exercise;
use ss5_exercise;

/* Bước 2 */

create table products(
id_product int primary key auto_increment,
code_product int unique,
name_product varchar(50) not null,
price_product int not null,
amount_product int,
description_product varchar(50),
status_product varchar(50) not null
);
insert into products(code_product,name_product,price_product,amount_product,description_product,status_product)
values 
(001,"mercedes",1000,2,"luxury car","available"),
(002,"ferrari",800,5,"sport car","available"),
(003,"lamborghini",1500,1,"super car","available");

/* Bước 3 */
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index unique_product on products(code_product);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index composite_index on products(name_product,price_product);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select *
from products
where code_product = '002';

-- So sánh câu truy vấn trước và sau khi tạo index
/* Truy xuất dữ liệu nhanh hơn so với lúc chưa đặt index, trước khi đặt là phải duyệt qua
tất cả các hàng nhưng khi đặt index chỉ cần duyệt qua 1 hàng. */

/* Bước 4 */
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.

create view view_products as
select products.code_product,
	   products.name_product,
       products.price_product,
       products.status_product
from products;

-- Tiến hành sửa đổi view
create or replace view view_products as 
select products.code_product,
       products.name_product,
       products.price_product
from products;

-- Tiến hành xoá view
drop view view_products;

/* Bước 5 */
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure get_info_products()
begin 
select *
from products;
end //
delimiter ;

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_new_product(in id_product int,
									code_product int,
                                    name_product varchar(50),
									price_product int,
                                    amount_product int,
                                    description_product varchar(50),
									status_product varchar(50))
begin
insert into products
values(id_product,code_product,name_product,price_product,amount_product,description_product,status_product);
end //
delimiter ;

call add_new_product(4,004,"porsche",1100,13,"luxury car","available");

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure edit_product(in id_search int,
								  new_code_product int,
                                  new_name_product varchar(50),
                                  new_price_product int,
                                  new_amount_product int,
                                  new_description_product varchar(50),
                                  new_status_product varchar(50))
begin
update products
set code_product = new_code_product,
	name_product = new_name_product,
	price_product = new_price_product,
	amount_product = new_amount_product,
	description_product = new_description_product,
	status_product = new_status_product
where id_product = id_search;
end //
delimiter ;

call edit_product(4,004,"huyndai",1100,13,"luxury car","available");

-- Tạo store procedure xoá sản phẩm theo id

delimiter //
create procedure remove_product(in id_search int)
begin
delete from products
where id_product = id_search;
end //
delimiter ;
call remove_product(4);
									










