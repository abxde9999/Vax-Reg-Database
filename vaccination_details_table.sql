CREATE TABLE vaccination_details (
    appointment_id INT(6) ZEROFILL NOT NULL,
    vaccine_id INT(4) NOT NULL,
    dose ENUM('1st Dose', '2nd Dose') NOT NULL,
    `status` ENUM('Waiting', 'Completed') NOT NULL,
    FOREIGN KEY (appointment_id)
    REFERENCES appointment_details(appointment_id),
    FOREIGN KEY (vaccine_id)
    REFERENCES vaccine_info(vaccine_id));
    
INSERT INTO vaccination_details (appointment_id, vaccine_id, dose, `status`)
VALUES (177564, 1022, '1st Dose', 'Waiting'),
       (227367, 1022, '1st Dose', 'Waiting'),
       (238382, 1022, '1st Dose', 'Waiting'),
       (389833, 2283, '1st Dose', 'Waiting'),
       (402892, 4829, '2nd Dose', 'Waiting'),
       (598347, 3927, '1st Dose', 'Waiting'),
       (610929, 2283, '2nd Dose', 'Waiting'),
       (734738, 3927, '1st Dose', 'Waiting'),
       (747378, 5389, '1st Dose', 'Waiting'),
       (838837, 6210, '1st Dose', 'Waiting'),
       (912383, 6210, '2nd Dose', 'Waiting'),
       (937376, 1022, '2nd Dose', 'Waiting');
       
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