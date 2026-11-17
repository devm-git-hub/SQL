create database instagram;
use instagram;
CREATE TABLE user ( 
    ID INT, 
    AGE INT, 
    NAME VARCHAR(50) NOT NULL, 
    EMAIL VARCHAR(50) UNIQUE, 
    FOLLOWERS INT DEFAULT 0, 
    FOLLOWING INT DEFAULT 0, 
    CONSTRAINT chk_age CHECK (AGE >= 18)
);


INSERT INTO `user` (id, age, name, email, followers, following) VALUES 
(1, 21, 'Dev Mandal', 'devmandalgps@gmail.com', 1250, 430),
(2, 24, 'Aarav Sharma', 'aarav.sharma@gmail.com', 340, 512),
(3, 19, 'Priya Patel', 'priya.patel@yahoo.com', 890, 210),
(4, 28, 'Rahul Verma', 'rahul.verma@outlook.com', 5420, 1050),
(5, 22, 'Ananya Iyer', 'ananya.iyer@gmail.com', 150, 180),
(6, 30, 'Vikram Singh', 'vikram.singh@workmail.com', 12400, 320),
(7, 25, 'Neha Gupta', 'neha.gupta@gmail.com', 4300, 890),
(8, 20, 'Karan Mehta', 'karan.mehta@proton.me', 75, 120),
(9, 27, 'Sneha Reddi', 'sneha.reddi@gmail.com', 920, 650),
(10, 23, 'Amit Kumar', 'amit.kumar@techmail.com', 3100, 410);


CREATE TABLE posts (    
    id INT,    
    content VARCHAR(100),    
    user_id INT,    
    FOREIGN KEY (user_id) REFERENCES user(id) 
);


INSERT INTO posts (id, content, user_id) VALUES 
(101, 'Excited to start working on my full-stack web project!', 1),
(102, 'Just finished an intense gym session and feeling great.', 2),
(103, 'Working on big data analytics case studies today.', 4),
(104, 'Enjoying a quiet evening walk after dinner.', 6),
(105, 'Testing out a new React and Vite component setup.', 1);

