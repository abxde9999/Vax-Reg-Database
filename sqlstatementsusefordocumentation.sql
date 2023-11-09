-- SQL QUERIES (5 Medium)

SELECT *
FROM vaccination_details
WHERE `status` = 'Waiting';

SELECT last_name
FROM user_info
ORDER BY last_name;

SELECT *
FROM user_info
WHERE category = 'Adult';

SELECT *
FROM appointment_details
WHERE appointment_time BETWEEN '07:00' AND '09:00';

SELECT *
FROM vaccine_info
WHERE stocks > 500;

-- SQL QUERIES (5 HARD)

SELECT user_id, CONCAT(last_name, ' ',   first_name) AS `name`
FROM user_info
WHERE gender = 'M'
ORDER BY `name`;

CREATE TABLE user_infobackup
SELECT *
FROM user_info;

SELECT COUNT(user_id), gender
FROM user_info
GROUP BY gender;

SELECT *
FROM appointment_details
WHERE appointment_num >= 3
ORDER BY appointment_time;

SELECT technology
FROM vaccine_info
GROUP BY technology
ORDER BY technology;

-- COLUMN FUNCTION (3)

SELECT SUM(stocks) AS Total_Vaccines
FROM vaccine_info;

SELECT COUNT(appointment_num) AS total_no_of_appointments
FROM appointment_details;

SELECT MAX(stocks)
FROM vaccine_info;


-- SCALAR FUNCTIONS (4)

SELECT UCASE(CONCAT(last_name, ' ', first_name)) AS `name`
FROM user_info;

SELECT LCASE(vaccine) AS vaccine, LCASE(technology) AS technology
FROM vaccine_info;

SELECT last_name, DAYOFMONTH(date_of_birth) AS birthday
FROM user_info;

SELECT user_id, LENGTH(user_id)
FROM user_info;

-- ARITHMETIC (3)

SELECT vaccine, stocks + 500 AS New_Stocks
FROM vaccine_info;

SELECT vaccine, stocks - 50 AS Remaining_Aztrazenica
FROM vaccine_info
WHERE vaccine = 'Aztrazenica';

SELECT SUM(stocks) - 1000 AS Total_Remaining_Vaccine_Stocks
FROM vaccine_info;

-- RETRIEVING FROM MULTIPLE TABLES
-- MEDIUM
SELECT user_info.last_name, appointment_details.appointment_id
FROM user_info
LEFT JOIN appointment_details
ON user_info.user_id = appointment_details.user_id;

SELECT vaccination_details.appointment_id, vaccination_details.vaccine_id, vaccine_info.vaccine
FROM vaccination_details
RIGHT JOIN vaccine_info
ON vaccination_details.vaccine_id = vaccine_info.vaccine_id;

-- HARD
SELECT user_info.user_id, appointment_details.appointment_id, vaccination_details.`status`
FROM user_info
INNER JOIN appointment_details
ON user_info.user_id = appointment_details.user_id
INNER JOIN vaccination_details
ON appointment_details.appointment_id = vaccination_details.appointment_id;

-- SUBQUERY (5)

-- MEDIUM
SELECT *
FROM appointment_details
WHERE appointment_time =
(SELECT appointment_time
FROM appointment_details
WHERE user_id = 0389371102);

SELECT *
FROM vaccine_info
WHERE stocks >
(SELECT MIN(stocks)
FROM vaccine_info);

SELECT vaccine, stocks
FROM vaccine_info
WHERE stocks >=
(SELECT AVG(stocks)
FROM vaccine_info);

-- HARD
SELECT appointment_num
FROM appointment_details
WHERE EXISTS
(SELECT *
FROM vaccination_details
WHERE vaccination_details.appointment_id = appointment_details.appointment_id);

SELECT vaccine_id, vaccine
FROM vaccine_info
WHERE vaccine_id
IN
(SELECT DISTINCT vaccine_id
FROM vaccination_details);



-- STORED PROCEDURE (3)
-- WITH INPUT PARAMETER
DELIMITER $$
CREATE PROCEDURE `check_user_via_user_id` (uid BIGINT(10))
BEGIN
SELECT *
FROM user_info
WHERE user_id = uid;
END$$
DELIMITER ;

-- WITHOUT PARAMETER
DELIMITER $$
CREATE PROCEDURE `vaccination_historylogtable` ()
BEGIN
CREATE TABLE vaccination_historylog (
    appointment_id INT(6) ZEROFILL NOT NULL,
    vaccine_id INT(4) NOT NULL,
    dose ENUM('1st Dose', '2nd Dose') NOT NULL,
    `status` ENUM('Waiting', 'Completed') NOT NULL);
END$$
DELIMITER ;

-- WITH OUTPUT PARAMETER
DELIMITER $$
CREATE PROCEDURE `totalregisteredviacount` (OUT count_registration INT)
BEGIN
SELECT COUNT(*) INTO count_registration
FROM user_info;
END$$
DELIMITER ;


-- VIEWS (2)
-- VIEWS Using SELECT CLAUSE
CREATE VIEW `registered_male` AS
SELECT *
FROM user_info
WHERE gender = 'M';

-- VIEWS Using JOIN
CREATE VIEW `vaccination` AS
SELECT appointment_details.user_id, appointment_details.appointment_id, vaccination_details.vaccine_id, vaccination_details.vaccine
FROM appointment_details
INNER JOIN vaccination_details
ON appointment_details.appointment_id = vaccination_details.appointment_id

-- TRIGGER
-- DDL TRIGGER
-- DML TRIGGER
DELIMITER $$
CREATE TRIGGER vaccinationdetailsdeletion
AFTER DELETE
ON vaccination_details FOR EACH ROW
BEGIN
INSERT INTO vaccination_historylog (appointment_id, vaccine_id, dose, `status`)
VALUES (OLD.appointment_id, OLD.vaccine_id, OLD.dose, OLD.`status`);
UPDATE vaccination_historylog
SET `status` = 'Completed';
END $$