
--
-- Database: `math-repository-database`
--
DROP DATABASE IF EXISTS `math-repository-database`;
CREATE DATABASE IF NOT EXISTS `math-repository-database`;
USE `math-repository-database`;

--
-- Table: `user`
--
CREATE TABLE `user`(
	`user_id` INT(10) NOT NULL AUTO_INCREMENT,
    `user_username` VARCHAR(25) NOT NULL,
    `user_password` VARCHAR(80) NOT NULL,
    PRIMARY KEY(`user_id`)
);

--
-- Table: `problem`
--
CREATE TABLE `problem`(
	`problem_id` INT(10) NOT NULL AUTO_INCREMENT,
    `problem_text` VARCHAR(200),
    PRIMARY KEY(`problem_id`)
);

--
-- Table: `hint`
--
CREATE TABLE `hint`(
	`hint_id` INT(10) NOT NULL AUTO_INCREMENT,
    `hint_text` VARCHAR(200),
    `problem_id` INT(10),
    PRIMARY KEY(`hint_id`),
    FOREIGN KEY(`problem_id`) REFERENCES `problem`(`problem_id`)
);

--
-- Populate `user` table with test data
--
INSERT INTO `user` (`user_id`, `user_username`, `user_password`) VALUES
(0, "admin", "admin");

INSERT INTO `problem` (`problem_id`, `problem_text`) VALUES
(0, "");