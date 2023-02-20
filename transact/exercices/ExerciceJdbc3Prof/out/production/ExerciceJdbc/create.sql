CREATE TABLE IF NOT EXISTS  REGISTRATION
                    (id INTEGER auto_increment,
                     first VARCHAR(255),
                     last VARCHAR(255),
                     age INTEGER,
                     PRIMARY KEY ( id ));

ALTER TABLE REGISTRATION DROP CONSTRAINT IF EXISTS first_last;
ALTER TABLE REGISTRATION ADD CONSTRAINT first_last UNIQUE ( first, last );

CREATE TABLE IF NOT EXISTS FACTURE
(id INTEGER auto_increment,
    amount numeric(9,2),
    created date,
    registration_id int,
    PRIMARY KEY ( id ));

CREATE TABLE IF NOT EXISTS PAIEMENT
(id INTEGER auto_increment,
    facture_id int,
    amount numeric(9,2),
    created date,
    PRIMARY KEY ( id ));
