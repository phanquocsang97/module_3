use ss1_exercise;

create table Class(
id int primary key auto_increment,
`name` varchar(45)
);

create table Teacher(
id int primary key auto_increment,
`name` varchar(200),
age int,
country varchar(50)
);

insert into Class(`name`)
values ("Sang"),("Lam"),("Viet");

insert into Teacher(`name`,age,country)
values ("Chanh",35,"VN"),("Trung",30,"VN"),("Cong",32,"VN");

select *
from Class;

select *
from Teacher;
