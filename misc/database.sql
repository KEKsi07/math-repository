
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
-- Table: `solution`
--
CREATE TABLE `solution`(
	`solution_id` INT(10) NOT NULL AUTO_INCREMENT,
    `solution_text` VARCHAR(200),
    `problem_id` INT(10),
    PRIMARY KEY(`solution_id`),
    FOREIGN KEY(`problem_id`) REFERENCES `problem`(`problem_id`)
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
(1, "admin", "admin");

--
-- Populate `problem` table with test data
--
INSERT INTO `problem` (`problem_id`, `problem_text`) VALUES
(1, "problem1"),
(2, "problem2"),
(3, "find all f:R -> R such that f(x) = x for all real numbers x");

--
-- Populate `hint` table with test data
--
INSERT INTO `hint` (`hint_id`, `hint_text`, `problem_id`) VALUES
(1, "hint1", 1),
(2, "hint2", 1),
(3, "substitute x -> y", 3);

--
-- Populate `solution` table with test data
--
INSERT INTO `solution` (`solution_id`, `solution_text`, `problem_id`) VALUES
(1, "solution1", 1),
(2, "solution2", 2),
(3, "f(x) = x", 3);
