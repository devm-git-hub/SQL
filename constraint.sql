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
