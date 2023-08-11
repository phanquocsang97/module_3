use ss1_exercise;

create table classroom(
id int primary key auto_increment,
`name` varchar(45)
);

create table teacher(
id int primary key auto_increment,
`name` varchar(200),
age int,
country varchar(50)
);

insert into classroom(`name`)
values ("Sang"),("Lam"),("Viet");

insert into teacher(`name`,age,country)
values ("Chanh",35,"VN"),("Trung",30,"VN"),("Cong",32,"VN");

select *
from classroom;

select *
from teacher;
