use  instagram;
select name, followers from user where followers >= 300;

select * from user where age + 1 = 20;

select * from user where age >= 25 and followers >= 400;
select * from user where age >= 25 or following >= 400;
select * from user where age  between 25 and 30;