create database collage;
use collage;
create table teacher ( id int , name varchar(40), subject varchar(20), salary int);
insert into teacher values(23, "Ajay", "maths", 50000);
insert into teacher values(47, "Bharat", "maths", 60000),
    (18, "Chaten", "chemistry", 45000),
    (9, "Divya", "physics", 75000);
    
    
    select * from teacher;
    select salary from teacher where salary > 55000;
    ALTER TABLE teacher RENAME COLUMN salary TO ctc;
    UPDATE teacher SET ctc = ctc + ctc * 0.25 ;
    ALTER TABLE teacher ADD COLUMN city VARCHAR(255) default" Gurgaon";
    ALTER TABLE teacher DROP COLUMN ctc;
    
    
create table student (roll_no int primary key, name varchar(40), city varchar(20), marks int);
INSERT INTO student (roll_no, name, city, marks) VALUES 
(110, 'adam', 'Delhi', 76),
(108, 'bob', 'Mumbai', 65),
(124, 'Casey', 'Pune', 94),
(125, 'duke', 'Pune', 80);
select * from student;

select * from student where marks > 75;
select distinct city from student;
select city, max(marks) from student group by city;
SELECT avg(marks)  FROM student;
ALTER TABLE student ADD COLUMN grade VARCHAR(3);
UPDATE student SET grade = "O" WHERE marks >= 80;
UPDATE student SET grade = "A" WHERE marks >= 70 and marks < 80;
UPDATE student SET grade = "B" WHERE marks >= 60 and marks < 70;
select * from student;