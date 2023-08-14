create database ss3_exercise_1;
use ss3_exercise_1;

create table classes(
class_id int not null auto_increment primary key,
class_name varchar(60) not null,
start_date datetime not null,
class_status bit
);

create table students(
student_id int not null auto_increment primary key,
student_name varchar(30) not null,
address varchar(50),
phone varchar(20),
student_status bit,
class_id int not null,
foreign key(class_id) references classes(class_id)
);

create table subjects(
subject_id int not null auto_increment primary key,
subject_name varchar(30) not null,
credit tinyint not null default 1 check ( credit >= 1),
subject_status bit default 1
);

create table marks(
mark_id int not null auto_increment primary key,
subject_id int not null,
student_id int not null,
mark float default 0 check (mark between 0 and 100),
exam_times tinyint default 1,
unique (subject_id, student_id),
foreign key(subject_id) references subjects(subject_id),
foreign key(student_id) references students(student_id)
);

insert into classes(class_name,start_date,class_status)
values 
("A1","2008-12-20",1),
("A2","2008-12-22",1),
("B3",current_date,0)
;

insert into students(student_name,address,phone,student_status,class_id)
values 
("Hung","Ha Noi","0912113113",1,1),
("Hoa","Hai Phong","",1,1),
("Manh","HCM","0123123123",0,2);

insert into subjects(subject_name,credit,subject_status)
values
("CF",5,1),
("C",6,1),
("HDJ",5,1),
("RDBMS",10,1);

insert into marks(subject_id,student_id,mark,exam_times)
values
(1,1,8,1),
(1,2,10,2),
(2,1,12,1);

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’

select * from students
where students.student_name like "H%";

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.

select * from classes
where month(start_date) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.

select * from subjects
where subjects.credit > 3 and subjects.credit <= 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.

set sql_safe_updates = 0;
update students
set class_id = 2 
where student_name = 'Hung';
set sql_safe_updates = 1;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.

select students.student_name, subjects.subject_name, marks.mark
from marks
join students 
on students.student_id = marks.student_id
join subjects 
on subjects.subject_id = marks.subject_id
order by mark desc, student_name asc;




 
 
