CREATE TABLE vaccine_info (
    vaccine_id INT PRIMARY KEY NOT NULL,
    vaccine VARCHAR(20) NOT NULL,
    technology VARCHAR(20),
    no_of_shots INT,
    stocks INT);

INSERT INTO vaccine_info(vaccine_id, vaccine, technology , no_of_shots, Stocks)
VALUES (1022, 'Moderna', 'mRNA', 2, 500),
       (2283, 'Phizer','mRNA', 2, 1000),
       (3927, 'Johnson&Johnson','Adenoviral Vector', 1, 100),
	   (4829, 'AztraZenica','Adenoviral Vector', 2, 700),
       (5389, 'Sputnik V','Adenoviral Vector', 2, 200),
       (6210, 'Sinovac','Inactive Coronavirus', 2, 2000);