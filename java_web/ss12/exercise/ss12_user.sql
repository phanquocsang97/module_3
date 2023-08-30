create database ss12_user;
use ss12_user;

create table users(
id_user int not null auto_increment primary key,
name_user varchar(120) not null,
email_user varchar(120) not null,
country_user varchar(120),
is_delete int default 0
);

insert into users(name_user,email_user,country_user)
values 
('Minh','minh@codegym.vn','Vietyuu Nam'),
('Kante','kante@che.uk','Keniuytua');

update users set is_delete=1 where id_user =1;
select * from users where is_delete=0;

select * from users
where name_user like "%%"