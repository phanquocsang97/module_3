create database ss2_exercise_bonus;
use ss2_exercise_bonus;
create table class(
  id int primary key auto_increment, 
  name_class varchar(20)
);
create table room(
  id int primary key auto_increment, 
  name_room varchar(20), 
  class_id int, 
  foreign key(class_id) references class(id)
);
create table jame(
  `account` varchar(50) primary key, 
  `password` varchar(50)
);
create table student(
  id int primary key auto_increment, 
  name_student varchar(50), 
  birthday date, 
  gender boolean, 
  email varchar(50), 
  `point` float, 
  class_id int, 
  `account` varchar(50) unique, 
  foreign key (class_id) references class(id), 
  foreign key (`account`) references jame(`account`)
);
create table instructor(
  id int primary key auto_increment, 
  name_instructor varchar(50), 
  birthday date, 
  salary double
);
create table instructor_class(
  class_id int, 
  instructor_id int, 
  start_time date, 
  end_time date, 
  primary key (class_id, instructor_id), 
  foreign key(class_id) references class(id), 
  foreign key(instructor_id) references instructor(id)
);

insert into class (name_class) values ('c1121g1'), ('c1221g1'),('a0821i1'),('a0921i1');
insert into room(name_room,class_id) values ('Ken',1), ('Jame',1),('Ada',2),('Andy',2);

insert into jame(`account`,`password`)
 values('cunn','12345'),('chunglh','12345'),('hoanhh','12345'),('dungd','12345'),('huynhtd','12345'),
 ('hainm','12345'),('namtv','12345'),('hieuvm','12345'),('kynx','12345'),('vulm','12345');

insert into jame(`account`,`password`)
 values('anv','12345'),('bnv','12345');

 
insert into instructor(name_instructor,birthday, salary)
 values('tran van chanh','1985-02-03',100),('tran minh chien','1985-02-03',200),('vu thanh tien','1985-02-03',300);
insert into instructor(name_instructor,birthday, salary)
 values('tran van nam','1989-12-12',100);

 
 insert into student(name_student,birthday, gender,`point`, class_id,`account`) 
 values ('nguyen ngoc cu','1981-12-12',1,8,1,'cunn'),('le hai chung','1981-12-12',1,5,1,'chunglh'),
 ('hoang huu hoan','1990-12-12',1,6,2,'hoanhh'),('dau dung','1987-12-12',1,8,1,'dungd'),
 ('ta dinh huynh','1981-12-12',1,7,2,'huynhtd'),('nguyen minh hai','1987-12-12',1,9,1,'hainm'),
 ('tran van nam','1989-12-12',1,4,2,'namtv'),('vo minh hieu','1981-12-12',1,3,1,'hieuvm'),
 ('le xuan ky','1981-12-12',1,7,2,'kynx'),('le minh vu','1981-12-12',1,7,1,'vulm');

 insert into student(name_student,birthday, gender,`point`, class_id,`account`) 
 values ('nguyen van a','1981-12-12',1,8,null,'anv'),('tran van b','1981-12-12',1,5,null,'bnv');

 insert into instructor_class(class_id,instructor_id) 
 values (1,1),(1,2),(2,1),(2,2),(3,1),(3,2);
 
 
 /* 1. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào (chỉ học viên có lớp học). */
 
 select * from student
 join class on student.class_id = class.id;
 
 /*2. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào và cả các bạn đã đăng ký nhưng chưa có lớp học. */
 
select student.* from student
left join class on student.class_id = class.id; 

/* 4. Lấy ra thông tin của các học viên tên "Hai" và "Huynh" */

select  * from student 
where name_student = "nguyen minh hai" or name_student = "ta dinh huynh";

/* 5. Lấy ra học viên có điểm lớn hơn 5 */

select * from student
where `point` > 5;

/* 6. Lấy ra học viên có họ là "nguyen" */

select * from student
where name_student like "nguyen%";

/* 7. Thống kê số lượng học sinh theo từng loại điểm */

select count(distinct name_student, `point`) 
from student;
 
 /* 8. Thống kê sợ lượng học sinh theo điểm và điểm phải lớn hơn 5 */
 
select count(distinct `point`) 
from student
where `point` > 5;

/* 9. Thống kê số lượng học sinh theo điểm lớn hơn 5 và chỉ hiển thị với số lượng >=2 */

select `point`, COUNT(*) as quantity
from student
where `point` > 5
group by`point`
having quantity >= 2;

/* 10. Lấy ra danh sách học viên của lớp c1121g1 và sắp xếp tên học viên theo alphabet */

-- select name_student,name_class
-- from student,class
-- where name_class = "c1121g1"
-- order by name_class asc; 
 



 