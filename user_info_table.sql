CREATE TABLE user_info (
	user_id BIGINT(10) ZEROFILL PRIMARY KEY NOT NULL,
    last_name VARCHAR(10) NOT NULL,
    first_name VARCHAR(10) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('M','F') NOT NULL,
    mobile_num BIGINT(11) ZEROFILL NOT NULL,
    address VARCHAR(30) NOT NULL,
    category VARCHAR(30) NOT NULL);

INSERT INTO user_info (user_id, last_name, first_name, date_of_birth, gender, mobile_num, address, category)
VALUES (0389371102, 'Abode', 'Paul', '2000-02-14', 'M', 09356777889, 'Blk 66 Brgy 33 Phase 3', 'Adult'),
       (0767384841, 'Piid', 'Eric', '2001-01-01', 'M', 09768292828, 'Blk 4 Lot 3 Phase 99', 'Adult'),
       (1237738392, 'Sta. Rosa', 'Yuan', '2000-02-02', 'M', 09982929828, 'Blk 91 Lot 12 Phase 55', 'Adult'),
       (1597382271, 'Hori', 'Suzune', '2000-07-30', 'F', 09377493789, 'Blk 11 Lot 2 Phase 5', 'Adult'),
       (2682011001, 'Milize', 'Malika', '2012-09-10', 'F', 0984538902, 'Blk 18 Lot 36 Phase 7', '5-11 Pediatric A3'),
       (3934889283, 'Nouzen', 'Shinei', '1999-01-28', 'M', 0938028383, 'Blk 44 Area 5 Phase 8', 'Adult with Comorbidity'),
       (4782737992, 'Hayze', 'Ja', '2005-07-30', 'F', 09325774792, 'Blk 5 Phase 1 Phase 6', '12-17 Pediatric A3'),
       (5103273747, 'Rei', 'Arin', '1990-05-28', 'F', 09734637822, 'Blk 36 Lot 2 Phase 20', 'Pregnant Woman'),
       (6383992728, 'Bowles', 'Den', '1960-11-30', 'M', 09777383737, 'Blk 99 Area 1 Phase 9', 'Senior Citizen'),
       (7873737849, 'Leigh', 'Shanen', '1992-12-02', 'F', 09393383738, 'Blk 33 Brgy 50 Phase 4', 'Adult with Comorbidity'),
       (8938377883, 'Taylor', 'Josh', '2014-07-01', 'M', 09380283283, 'Blk 55 Area 7 Phase 8', '5-11 Pediatric A3'),
       (9837827287, 'Jackson', 'Jaren', '1959-05-28', 'M', 09982878458, 'Blk 99 Area 6 Phase 4', 'Senior Citizen');
       