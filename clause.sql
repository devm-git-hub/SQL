use  instagram;
select name, followers from user where followers >= 300;

select * from user where age + 1 = 20;

select * from user where age >= 25 and followers >= 400;
select * from user where age >= 25 or following >= 400;
select * from user where age  between 25 and 30;


USE instagram;

-- ==========================================
-- 1. AGGREGATE FUNCTIONS (COUNT, MIN, MAX, SUM, AVG)
-- ==========================================
SELECT COUNT(*) AS total_users FROM `user`;
SELECT MIN(AGE) AS youngest_age FROM `user`;
SELECT MAX(FOLLOWERS) AS max_followers FROM `user`;
SELECT SUM(FOLLOWERS) AS total_followers_sum FROM `user`;
SELECT AVG(FOLLOWING) AS avg_following FROM `user`;


-- ==========================================
-- 2. GROUP BY CLAUSE
-- ==========================================
-- Group users by their age and count how many users belong to each age group
SELECT AGE, COUNT(*) AS user_count 
FROM `user` 
GROUP BY AGE;


-- ==========================================
-- 3. HAVING CLAUSE
-- ==========================================
-- Filter grouped results (Find ages that have more than 1 user)
SELECT AGE, COUNT(*) AS user_count 
FROM `user` 
GROUP BY AGE 
HAVING COUNT(*) > 1;


-- ==========================================
-- 4. GENERAL CLAUSE ORDER REFERENCE
-- ==========================================
-- The correct order of clauses in a complex query:
-- SELECT -> FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY -> LIMIT
SELECT AGE, COUNT(*) AS user_count 
FROM `user` 
WHERE AGE >= 20 
GROUP BY AGE 
HAVING COUNT(*) >= 1 
ORDER BY user_count DESC;


-- ==========================================
-- 5. UPDATE TABLE
-- ==========================================
-- Modify existing data in a table
UPDATE `user` 
SET FOLLOWERS = 1350 
WHERE ID = 1;


-- ==========================================
-- 6. DELETE QUERY
-- ==========================================
-- Remove specific rows from a table
DELETE FROM `user` 
WHERE ID = 10;


-- ==========================================
-- 7. ALTER TABLE OPERATIONS
-- ==========================================

-- A. ADD a new column
ALTER TABLE `user` ADD COLUMN bio VARCHAR(255);

-- B. MODIFY a column data type/definition
ALTER TABLE `user` MODIFY COLUMN bio TEXT;

-- C. CHANGE a column name and definition together
ALTER TABLE `user` CHANGE COLUMN bio biography VARCHAR(255);

-- D. RENAME a column directly (MySQL 8.0+)
ALTER TABLE `user` RENAME COLUMN biography TO user_bio;

-- E. DROP (delete) a column
ALTER TABLE `user` DROP COLUMN user_bio;


-- ==========================================
-- 8. TRUNCATE TABLE
-- ==========================================
-- Empties all rows from the posts table instantly and resets auto-increment IDs
TRUNCATE TABLE posts;