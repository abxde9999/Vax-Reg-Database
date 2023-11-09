CREATE TABLE appointment_details (
    appointment_num INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT(6) ZEROFILL UNIQUE NOT NULL,
    user_id BIGINT(10) ZEROFILL NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    FOREIGN KEY (user_id)
    REFERENCES user_info(user_id));

INSERT INTO appointment_details (appointment_id, user_id, appointment_date, appointment_time)
VALUES (177564, 0389371102, '2021-10-09', '07:00'),
       (227367, 0767384841, '2021-10-09', '07:00'),
       (238382, 1237738392, '2021-10-09', '07:00'),
       (389833, 1597382271, '2022-01-03', '09:00'),
       (402892, 2682011001, '2022-01-05', '09:00'),
       (598347, 3934889283, '2022-02-01', '11:00'),
       (610929, 4782737992, '2022-02-08', '07:00'),
       (734738, 5103273747, '2022-02-09', '07:00'),
       (747378, 6383992728, '2022-02-15', '11:00'),
       (838837, 7873737849, '2022-03-09', '07:00'),
       (912383, 8938377883, '2022-03-09', '09:00'),
       (937376, 9837827287, '2022-04-01', '07:00');